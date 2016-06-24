defmodule PrNotifier.Repo.Migrations.CreateProjectRepository do
  use Ecto.Migration

  def change do
    create table(:project_repository) do
      add :project_id, :integer
      add :repository_id, :integer

      timestamps
    end

  end
end
