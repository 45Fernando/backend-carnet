defmodule Osunsa.Roles.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string

    many_to_many(:affiliates, Osunsa.Affiliates.Affiliate, join_through: "affiliates_roles", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(rol, attrs) do
    rol
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
