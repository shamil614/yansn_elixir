use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :social_network, App.SocialNetwork.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :social_network, App.SocialNetwork.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "social_network_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
