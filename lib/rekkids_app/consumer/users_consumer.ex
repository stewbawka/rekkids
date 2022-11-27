defmodule UsersConsumer do

  alias Auth.User, as: UserSchema
  alias RekkidsApp.Auth
  alias RekkidsApp.Auth.User

  def _protobuf_ts_to_datetime(ts) do
    DateTime.from_unix!(ts.seconds * 1_000_000_000 + ts.nanos, :nanosecond)
  end

  def handle_messages(messages) do
    for %{key: key, value: value} = message <- messages do
      struct = UserSchema.decode(value)
      IO.puts("received message")
      IO.puts(struct.first_name)
      map = Map.new(Enum.map(Map.from_struct(struct), fn
        {:id, id} -> {:source_id, id}
        {:created_at, created_at} -> {:source_created_at, _protobuf_ts_to_datetime(created_at)}
        {:updated_at, updated_at} -> {:source_updated_at, _protobuf_ts_to_datetime(updated_at)}
        pair -> pair
      end))
      with {:ok, %User{} = user} <- Auth.create_user(map) do
        IO.inspect(user)
      else {:error, errors} ->
        IO.inspect(errors)
      end
    end
	:ok
  end
end
