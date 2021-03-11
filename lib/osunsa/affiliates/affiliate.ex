defmodule Osunsa.Affiliates.Affiliate do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Osunsa.Repo

  schema "affiliates" do
    field :avatar, :string
    field :correo, :string
    field :dni, :string
    field :name, :string
    field :password_hash, :string

    many_to_many(:roles, Osunsa.Roles.Rol, join_through: "affiliates_roles", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(affiliate, attrs) do
    affiliate
    |> cast(attrs, [:dni, :name, :correo, :avatar, :password_hash])
    |> validate_required([:dni, :name, :correo, :avatar, :password_hash])
  end

  def update_changeset_roles(affiliate, attrs) do
    affiliate
    |> Repo.preload(:roles)
    |> cast(attrs, [])
    #|> cast_assoc(:roles, with: &Osunsa.Roles.Rol.changeset/2)
    |> put_assoc(:roles, load_roles(attrs))
  end


  #Cargando los roles
  def load_roles(params) do
    case params["role_ids"] || [] do
      [] -> []
      ids -> Repo.all from r in Osunsa.Roles.Rol, where: r.id in ^ids
    end
  end
end
