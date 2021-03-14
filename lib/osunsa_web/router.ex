defmodule OsunsaWeb.Router do
  use OsunsaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug OsunsaWeb.Plugs.AuthAccessPipeline
  end

  scope "/", OsunsaWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/roles", RoleController
    resources "/covenants", CovenantController
    resources "/affiliates", AffiliateController
    resources "/affiliatescovenants", AffiliateCovenantController
  end

  # Other scopes may use custom stacks.
  scope "/api", OsunsaWeb do
    pipe_through :api

    post "/login", AutentificacionController, :identity_callback
    # Todo de aca para abajo va a pasar por la autentificacion.
    pipe_through :authenticated
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: OsunsaWeb.Telemetry
    end
  end
end
