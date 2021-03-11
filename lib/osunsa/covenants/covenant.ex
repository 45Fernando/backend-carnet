defmodule Osunsa.Covenants.Covenant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "covenants" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(covenant, attrs) do
    covenant
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
