defmodule Storage.Relational do
  use Ecto.Repo,
    otp_app: :scraping_service,
    adapter: Ecto.Adapters.Postgres
end
