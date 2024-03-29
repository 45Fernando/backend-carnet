defmodule Carnet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Carnet.Repo,
      # Start the Telemetry supervisor
      CarnetWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Carnet.PubSub},
      # Start the Endpoint (http/https)
      CarnetWeb.Endpoint,
      # Start a worker by calling: Carnet.Worker.start_link(arg)
      # {Carnet.Worker, arg}
      {Guardian.DB.Token.SweeperServer, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Carnet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CarnetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
