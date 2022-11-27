defmodule RekkidsApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :source_id, :integer, null: false
      add :source_created_at, :utc_datetime_usec, null: false
      add :source_updated_at, :utc_datetime_usec, null: false

      timestamps()
    end
  end
end
