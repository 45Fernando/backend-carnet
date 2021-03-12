defmodule Osunsa.AffiliatesCovenants.AffiliateCovenant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "affiliatescovenants" do
    field :fecha_alta, :date
    field :fecha_baja, :date

    timestamps()
  end

  @doc false
  def changeset(affiliate_covenant, attrs) do
    affiliate_covenant
    |> cast(attrs, [:fecha_alta, :fecha_baja])
    |> validate_required([:fecha_alta, :fecha_baja])
  end
end
