defmodule RekkidsApp.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :artist, :string
      add :title, :string
      add :bpm, :integer
      add :year, :integer
      add :original_year, :integer
      add :is_edit, :boolean, default: false, null: false

      timestamps()
    end

  end
end
