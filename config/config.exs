use Mix.Config

config :scraping_service, Storage.Relational,
  database: "scraping_service_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :scraping_service, ecto_repos: [Storage.Relational]

# Application version
config :scraping_service, application_version: "0.0.1"

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Payor Http Endpoints
config :scraping_service, :pumana,
  url: "https://pumana.com/api/procedure/"

config :scraping_service, :dcds,
  url: "https://api.dcds.com/procedure/"

config :scraping_service, :sigma,
  url: "https://sigma.com/api/v1/procedure/"
