defmodule IncidentReportManager.Repo.Migrations.CreateTemplates do
  use Ecto.Migration

  def change do
    create table(:templates) do
      add :owner, :string
      add :product, :string
      add :observation, :string
      add :cause, :string
      add :impact, :string

      timestamps()
    end

  end
end
