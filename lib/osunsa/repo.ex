defmodule Osunsa.Repo do
  use Ecto.Repo,
    otp_app: :osunsa,
    adapter: Ecto.Adapters.Postgres
end
