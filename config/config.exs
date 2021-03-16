# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :liu,
  ecto_repos: [Liu.Repo]

# Configures the endpoint
config :liu, LiuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2oxhYSOrHaPZplbtQkqjU/8e5HRdpTAiUl+z+6JB6hHt7PO7gycKL5PhovrrFwU4",
  render_errors: [view: LiuWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Liu.PubSub,
  live_view: [signing_salt: "OgjthLQJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
