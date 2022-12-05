defmodule RekkidsApp.Repo.Migrations.CreateUsersSourceIdUniquenessIdx do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:source_id])
  end
end
