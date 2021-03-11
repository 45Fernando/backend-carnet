defmodule Osunsa.Repo.Migrations.CreateAffiliates do
  use Ecto.Migration

  def change do
    create table(:affiliates) do
      add :dni, :string
      add :name, :string
      add :correo, :string
      add :avatar, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:affiliates, [:correo, :dni])
  end
end
