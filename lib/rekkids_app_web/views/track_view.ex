defmodule RekkidsAppWeb.TrackView do
  use RekkidsAppWeb, :view
  alias RekkidsAppWeb.TrackView

  def render("index.json", %{tracks: tracks}) do
    %{data: render_many(tracks, TrackView, "track.json")}
  end

  def render("show.json", %{track: track}) do
    %{data: render_one(track, TrackView, "track.json")}
  end

  def render("track.json", %{track: track}) do
    %{id: track.id,
      artist: track.artist,
      title: track.title,
      bpm: track.bpm,
      year: track.year,
      original_year: track.original_year,
      is_edit: track.is_edit}
  end
end
