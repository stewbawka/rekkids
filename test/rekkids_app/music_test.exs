defmodule RekkidsApp.MusicTest do
  use RekkidsApp.DataCase

  alias RekkidsApp.Music

  describe "tracks" do
    alias RekkidsApp.Music.Track

    @valid_attrs %{artist: "some artist", bpm: 42, is_edit: true, original_year: 42, title: "some title", year: 42}
    @update_attrs %{artist: "some updated artist", bpm: 43, is_edit: false, original_year: 43, title: "some updated title", year: 43}
    @invalid_attrs %{artist: nil, bpm: nil, is_edit: nil, original_year: nil, title: nil, year: nil}

    def track_fixture(attrs \\ %{}) do
      {:ok, track} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Music.create_track()

      track
    end

    test "list_tracks/0 returns all tracks" do
      track = track_fixture()
      assert Music.list_tracks() == [track]
    end

    test "get_track!/1 returns the track with given id" do
      track = track_fixture()
      assert Music.get_track!(track.id) == track
    end

    test "create_track/1 with valid data creates a track" do
      assert {:ok, %Track{} = track} = Music.create_track(@valid_attrs)
      assert track.artist == "some artist"
      assert track.bpm == 42
      assert track.is_edit == true
      assert track.original_year == 42
      assert track.title == "some title"
      assert track.year == 42
    end

    test "create_track/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_track(@invalid_attrs)
    end

    test "update_track/2 with valid data updates the track" do
      track = track_fixture()
      assert {:ok, %Track{} = track} = Music.update_track(track, @update_attrs)
      assert track.artist == "some updated artist"
      assert track.bpm == 43
      assert track.is_edit == false
      assert track.original_year == 43
      assert track.title == "some updated title"
      assert track.year == 43
    end

    test "update_track/2 with invalid data returns error changeset" do
      track = track_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_track(track, @invalid_attrs)
      assert track == Music.get_track!(track.id)
    end

    test "delete_track/1 deletes the track" do
      track = track_fixture()
      assert {:ok, %Track{}} = Music.delete_track(track)
      assert_raise Ecto.NoResultsError, fn -> Music.get_track!(track.id) end
    end

    test "change_track/1 returns a track changeset" do
      track = track_fixture()
      assert %Ecto.Changeset{} = Music.change_track(track)
    end
  end
end
