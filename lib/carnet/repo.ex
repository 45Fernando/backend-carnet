defmodule Carnet.Repo do
  use Ecto.Repo,
    otp_app: :carnet,
    adapter: Ecto.Adapters.Postgres
end
