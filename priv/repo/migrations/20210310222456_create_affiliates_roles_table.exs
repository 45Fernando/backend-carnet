defmodule Carnet.Repo.Migrations.CreateAffiliatesRolesTable do
  use Ecto.Migration

  def change do
    create table(:affiliates_roles, primary_key: false) do
      add(:role_id, references(:roles), primary_key: true)
      add(:affiliate_id, references(:affiliates), primary_key: true)

      #timestamps()
    end

    create(index(:affiliates_roles, [:role_id]))
    create(index(:affiliates_roles, [:affiliate_id]))

    create(
      unique_index(:affiliates_roles, [:affiliate_id, :role_id], name: :affiliate_id_role_id_unique_index)
    )
  end
end
