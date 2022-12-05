defmodule RekkidsApp.Repo.Migrations.LinkTrackToUser do
  use Ecto.Migration

  def change do
    alter table(:tracks) do
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all)
    end
  end
end
