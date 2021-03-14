defmodule Osunsa.Repo.Migrations.CreateAffiliatescovenants do
  use Ecto.Migration

  def change do
    create table(:affiliates_covenants) do
      add(:dni_titular, references(:affiliates))
      add(:dni_beneficiario, references(:affiliates))
      add(:id_covenant, references(:covenants))
      add :fecha_alta, :date
      add :fecha_baja, :date

      timestamps()
    end

    create(index(:affiliates_covenants, [:dni_titular]))
    create(index(:affiliates_covenants, [:dni_beneficiario]))
    create(index(:affiliates_covenants, [:id_covenant]))

    create(
      unique_index(:affiliates_covenants, [:dni_titular, :dni_beneficiario, :id_covenant], name: :dni_titular_dni_beneficiario_id_covenant_unique_index)
    )
  end
end
