defmodule Osunsa.Repo.Migrations.CreateCovenants do
  use Ecto.Migration

  def change do
    create table(:covenants) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
