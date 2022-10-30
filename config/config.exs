# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rekkids_app,
  ecto_repos: [RekkidsApp.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :rekkids_app, RekkidsAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7+CzlzaGQwYiDCabH+rcVUUUfEtM9RvvNWAQiT9O2GCeqsyVn+YA8gR34/JYq01X",
  render_errors: [view: RekkidsAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RekkidsApp.PubSub,
  live_view: [signing_salt: "7Qc8TRIL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Kafka consumer config
config :kaffe,
  consumer: [
    endpoints: ["kafka-service": 9092],
    topics: ["users"],     # the topic(s) that will be consumed
    consumer_group: "rekkids_users",   # the consumer group for tracking offsets in Kafka
    message_handler: UsersConsumer,           # the module that will process messages
    start_with_earliest_message: true 
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
