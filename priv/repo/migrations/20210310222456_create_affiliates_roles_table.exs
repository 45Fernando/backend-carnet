defmodule Osunsa.Repo.Migrations.CreateaffiliatesRolesTable do
  use Ecto.Migration

  def change do
    create table(:affiliates_roles, primary_key: false) do
      add(:id_role, references(:roles), primary_key: true)
      add(:id_affiliate, references(:affiliates), primary_key: true)

      #timestamps()
    end

    create(index(:affiliates_roles, [:id_role]))
    create(index(:affiliates_roles, [:id_affiliate]))

    create(
      unique_index(:affiliates_roles, [:id_affiliate, :id_role], name: :id_affiliate_id_role_unique_index)
    )
  end
end
