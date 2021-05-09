defmodule RekkidsAppWeb.TrackController do
  use RekkidsAppWeb, :controller

  alias RekkidsApp.Music
  alias RekkidsApp.Music.Track

  action_fallback RekkidsAppWeb.FallbackController

  def index(conn, _params) do
    tracks = Music.list_tracks()
    render(conn, "index.json", tracks: tracks)
  end

  def create(conn, %{"track" => track_params}) do
    with {:ok, %Track{} = track} <- Music.create_track(track_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.track_path(conn, :show, track))
      |> render("show.json", track: track)
    end
  end

  def show(conn, %{"id" => id}) do
    track = Music.get_track!(id)
    render(conn, "show.json", track: track)
  end

  def update(conn, %{"id" => id, "track" => track_params}) do
    track = Music.get_track!(id)

    with {:ok, %Track{} = track} <- Music.update_track(track, track_params) do
      render(conn, "show.json", track: track)
    end
  end

  def delete(conn, %{"id" => id}) do
    track = Music.get_track!(id)

    with {:ok, %Track{}} <- Music.delete_track(track) do
      send_resp(conn, :no_content, "")
    end
  end
end
