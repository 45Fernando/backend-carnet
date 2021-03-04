defmodule Osunsa.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Osunsa.Repo,
      # Start the Telemetry supervisor
      OsunsaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Osunsa.PubSub},
      # Start the Endpoint (http/https)
      OsunsaWeb.Endpoint
      # Start a worker by calling: Osunsa.Worker.start_link(arg)
      # {Osunsa.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Osunsa.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OsunsaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end