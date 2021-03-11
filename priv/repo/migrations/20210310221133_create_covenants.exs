defmodule Osunsa.Repo.Migrations.CreateCovenants do
  use Ecto.Migration

  def change do
    create table(:covenants) do
      add :name, :string

      timestamps()
    end

  end
end
