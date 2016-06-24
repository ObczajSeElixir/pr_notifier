defmodule PrNotifier.Repo.Migrations.CreateRepository do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :full_name, :string
      add :description, :text

      timestamps
    end

  end
end
