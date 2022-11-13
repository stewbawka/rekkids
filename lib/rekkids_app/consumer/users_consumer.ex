defmodule UsersConsumer do
  def handle_messages(messages) do
    for %{key: key, value: value} = message <- messages do
      struct = Auth.User.decode(value)
      IO.puts("received message")
      IO.puts(struct.first_name)
    end
	:ok
  end
end
