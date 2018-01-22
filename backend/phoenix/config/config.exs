# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gui,
  ecto_repos: [Gui.Repo]

# Configures the endpoint
config :gui, GuiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sx4x2pBA+EnJ4CKRMDnrlcWP5DnpfcIszwK1tR6hfM7H3M5zTzuSqCo9nGtFJEjX",
  render_errors: [view: GuiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gui.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
