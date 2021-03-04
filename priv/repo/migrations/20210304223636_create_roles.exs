defmodule Osunsa.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :nombre, :string

      timestamps()
    end

  end
end
