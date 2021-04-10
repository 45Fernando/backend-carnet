defmodule Carnet.Covenants.Covenant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "covenants" do
    field :name, :string
    field :description, :string

    has_many(:affiliate_covenants, Carnet.AffiliatesCovenants.AffiliateCovenant, foreign_key: :covenant_id)

    timestamps()
  end

  @doc false
  def changeset(covenant, attrs) do
    covenant
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
