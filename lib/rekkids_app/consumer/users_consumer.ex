defmodule UsersConsumer do

  alias Auth.User, as: UserSchema
  alias RekkidsApp.Auth
  alias RekkidsApp.Auth.User

  def _protobuf_ts_to_datetime(ts) do
    DateTime.from_unix!(ts.seconds * 1_000_000_000 + ts.nanos, :nanosecond)
  end

  def handle_messages(messages) do
    for %{key: key, value: value} = message <- messages do
      IO.puts("decoding message")
      struct = UserSchema.decode(value)
      IO.puts("received message")
      IO.puts("another message")
      IO.puts("struct.id")
      IO.puts(struct.id)
      IO.puts("//struct.id")

      map = Map.new(Enum.map(Map.from_struct(struct), fn
        {:created_at, created_at} -> {:source_created_at, _protobuf_ts_to_datetime(created_at)}
        {:updated_at, updated_at} -> {:source_updated_at, _protobuf_ts_to_datetime(updated_at)}
        pair -> pair
      end))
      map = Map.put(map, :source_id, map[:id])
      with nil <- Auth.get_user_by(id: map[:id]) do
        with {:ok, %User{} = user} <- Auth.create_user(map) do
          IO.inspect(user)
        else {:error, errors} ->
          IO.inspect(errors)
        end
      else %User{} = user ->
        with {:ok, %User{} = user} <- Auth.update_user(user, map) do
          IO.inspect(user)
        else {:error, errors} ->
          IO.inspect(errors)
        end
      end
    end
	:ok
  end
end
