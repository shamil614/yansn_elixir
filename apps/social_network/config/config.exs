# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :social_network,
  namespace: App.SocialNetwork,
  ecto_repos: [App.SocialNetwork.Repo]

# Configures the endpoint
config :social_network, App.SocialNetwork.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lYVmH6bJFyb2E29YAQdMBKxX1p2VSMBQ4/LHRfDA94L8Ym2nYH3RK7ALRk+QqxN5",
  render_errors: [view: App.SocialNetwork.ErrorView, accepts: ~w(html json)],
  pubsub: [name: App.SocialNetwork.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
