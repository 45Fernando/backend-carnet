defmodule Carnet.Affiliates.Affiliate do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Carnet.Repo

  schema "affiliates" do
    field :avatar, :string
    field :correo, :string
    field :dni, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    many_to_many(:roles, Carnet.Roles.Role, join_through: "affiliates_roles", on_replace: :delete)
    has_many(:guardian_tokens, Carnet.GuardianTokens.GuardianToken, foreign_key: :sub)
    has_many(:titular_covenants, Carnet.AffiliatesCovenants.AffiliateCovenant, foreign_key: :titular_id)
    has_many(:beneficiario_covenants, Carnet.AffiliatesCovenants.AffiliateCovenant, foreign_key: :beneficiario_id)

    timestamps()
  end

  @doc false
  def changeset(affiliate, attrs) do
    affiliate
    |> cast(attrs, [:dni, :name, :correo, :avatar, :password])
    |> validate_required([:dni, :name, :correo, :avatar, :password])
  end

  def changeset_for_seed(affiliate, attrs) do
    affiliate
    |> cast(attrs, [:dni, :name, :correo, :avatar, :password])
    |> validate_required([:dni, :name, :correo, :avatar, :password])
    |> unique_correo()
    |> validate_password()
    |> put_pass_hash()
  end

  def update_changeset_roles(affiliate, attrs) do
    affiliate
    |> Repo.preload(:roles)
    |> cast(attrs, [])
    #|> cast_assoc(:roles, with: &Carnet.Roles.Rol.changeset/2)
    |> put_assoc(:roles, load_roles(attrs))
  end

  #Cargando los roles
  def load_roles(params) do
    case params["role_ids"] || [] do
      [] -> []
      ids -> Repo.all from r in Carnet.Roles.Role, where: r.id in ^ids
    end
  end

  # validando que el correo tenga el formato correcto, un tamaño maximo
  # y que sea unico en la base de datos
  defp unique_correo(changeset) do
    changeset
    |> validate_format(
      :correo,
      ~r/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-\.]+\.[a-zA-Z]{2,}$/
    )
    |> validate_length(:correo, max: 255)
    |> unique_constraint(:correo)
  end


  # If you are using Bcrypt or Pbkdf2, change Argon2 to Bcrypt or Pbkdf2
  defp put_pass_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset) do
    changeset
  end

  defp validate_password(changeset) do
    validate_change(changeset, :password, fn (:password, password) ->
      case NotQwerty123.PasswordStrength.strong_password?(password) do
        {:ok, _} ->  []
        {:error, msg} -> [{:password, msg}]
      end
    end)
  end
end
