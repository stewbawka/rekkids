defmodule RekkidsApp.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :source_id, :string
    field :source_created_at, :utc_datetime_usec
    field :source_updated_at, :utc_datetime_usec
    has_many :tracks, RekkidsApp.Music.Track

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :email, :first_name, :last_name, :source_id, :source_created_at, :source_updated_at])
    |> validate_required([:email, :first_name, :last_name, :source_id, :source_created_at, :source_updated_at])
  end
end
