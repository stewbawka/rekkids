defmodule RekkidsApp.Music.Track do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tracks" do
    field :artist, :string
    field :bpm, :integer
    field :is_edit, :boolean, default: false
    field :original_year, :integer
    field :title, :string
    field :year, :integer
    belongs_to :user, RekkidsApp.Auth.User, type: :binary_id

    timestamps()
  end

  @allowed_fields [:artist, :title, :bpm, :year, :original_year, :is_edit, :user_id]
  @required_fields [:artist, :title, :bpm, :year, :original_year, :is_edit, :user_id]

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, @allowed_fields)
    |> validate_required(@required_fields)
  end
end
