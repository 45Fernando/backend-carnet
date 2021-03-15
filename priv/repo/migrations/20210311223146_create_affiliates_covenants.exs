defmodule Osunsa.Repo.Migrations.CreateAffiliatesCovenants do
  use Ecto.Migration

  def change do
    create table(:affiliates_covenants) do
      add(:titular_id, references(:affiliates))
      add(:beneficiario_id, references(:affiliates))
      add(:covenant_id, references(:covenants))
      add :fecha_alta, :date
      add :fecha_baja, :date

      timestamps()
    end

    create(index(:affiliates_covenants, [:titular_id]))
    create(index(:affiliates_covenants, [:beneficiario_id]))
    create(index(:affiliates_covenants, [:covenant_id]))

    create(
      unique_index(:affiliates_covenants, [:titular_id, :beneficiario_id, :covenant_id], name: :titular_id_beneficiario_id_covenant_id_unique_index)
    )
  end
end
