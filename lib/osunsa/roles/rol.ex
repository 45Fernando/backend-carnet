defmodule Osunsa.Roles.Rol do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(rol, attrs) do
    rol
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
