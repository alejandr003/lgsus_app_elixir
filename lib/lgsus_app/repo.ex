defmodule LgsusApp.Repo do
  use Ecto.Repo,
    otp_app: :lgsus_app,
    adapter: Ecto.Adapters.Postgres
end
