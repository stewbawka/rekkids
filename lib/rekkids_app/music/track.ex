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

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:artist, :title, :bpm, :year, :original_year, :is_edit])
    |> validate_required([:artist, :title, :bpm, :year, :original_year, :is_edit])
  end
end
