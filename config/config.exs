# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :carnet,
  ecto_repos: [Carnet.Repo]

# Configures the endpoint
config :carnet, CarnetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2L+6yIl7ekllHUASHk5qhG/o5GFv8rGpeLO8fnWT5gsO6fDoVNPOgJ+yVywokzv2",
  render_errors: [view: CarnetWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Carnet.PubSub,
  live_view: [signing_salt: "N+uqFBcD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configurando Ueberauth
config :ueberauth, Ueberauth,
  base_path: "/api/login",
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      request_path: "/api/login",
      callback_path: "/api/login",
      callback_methods: ["POST"],
      uid_field: :correo
    ]}
  ]

# Configuracion de Guardian
config :carnet, CarnetWeb.Guardian,
  hooks: GuardianDb,
  issuer: "carnet",
  secret_key: "RH7T+LnFWQCxXxGDNjwDu13oqmlZBmpyMeCNTa3+Ig2Wp8wuOrHiiy7GcnycdtCF",

  # We will get round to using these permissions at the end
  permissions: %{
    default: [:read_users, :write_users]
  }

# Configure the authentication plug pipeline
config :carnet, CarnetWeb.Plugs.AuthAccessPipeline,
  module: CarnetWeb.Guardian,
  error_handler: CarnetWeb.Plugs.AuthErrorHandler

config :guardian, Guardian.DB,
  # Add your repository module
  repo: Carnet.Repo,
  # default
  schema_name: "guardian_tokens",
  # token_types: ["refresh_token"], # store all token types if not set
  # default: 60 minutes
  sweep_interval: 120

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
