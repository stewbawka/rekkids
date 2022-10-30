defmodule RekkidsApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RekkidsApp.Repo,
      # Start the Telemetry supervisor
      RekkidsAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RekkidsApp.PubSub},
      # Start the Endpoint (http/https)
      RekkidsAppWeb.Endpoint,
      # Start a worker by calling: RekkidsApp.Worker.start_link(arg)
      # {RekkidsApp.Worker, arg}
      %{
        id: Kaffe.GroupMemberSupervisor,
        start: {Kaffe.GroupMemberSupervisor, :start_link, []},
        type: :supervisor
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RekkidsApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RekkidsAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
