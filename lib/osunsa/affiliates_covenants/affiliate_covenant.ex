defmodule Osunsa.AffiliatesCovenants.AffiliateCovenant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "affiliates_covenants" do
    field :fecha_alta, :date
    field :fecha_baja, :date

    belongs_to(:titulares, Osunsa.Affiliates.Affiliate, foreign_key: :titular_id)
    belongs_to(:beneficiarios, Osunsa.Affiliates.Affiliate, foreign_key: :beneficiario_id)
    belongs_to(:covenants, Osunsa.Covenants.Covenant, foreign_key: :covenant_id)

    timestamps()
  end

  @doc false
  def changeset(affiliate_covenant, attrs) do
    affiliate_covenant
    |> cast(attrs, [:fecha_alta, :fecha_baja, :titular_id, :beneficiario_id, :covenant_id])
    |> validate_required([:fecha_alta, :fecha_baja, :titular_id, :beneficiario_id, :covenant_id])
    |> foreign_key_constraint(:titular_id)
    |> foreign_key_constraint(:beneficiario_id)
    |> foreign_key_constraint(:covenant_id)
  end
end
