defmodule CarnetWeb.Plugs.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :carnet

  # If there is a session token, validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
   # If there is an authorization header, validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, ensure: true
end
