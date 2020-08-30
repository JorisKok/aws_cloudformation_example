# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aws_cloudformation_example,
  ecto_repos: [AwsCloudformationExample.Repo]
  
# Database configuration

# Configure your database
config :aws_cloudformation_example, AwsCloudformationExample.Repo,
       database: System.get_env("DB_NAME") || "aws_cloudformation_example",
       username: System.get_env("DB_USERNAME") || "app",
       password: System.get_env("DB_PASSWORD") || "secret",
       hostname: System.get_env("DB_HOSTNAME") || "localhost",
       show_sensitive_data_on_connection_error: true,
       pool_size: 10

# Configures the endpoint
config :aws_cloudformation_example, AwsCloudformationExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "soYbPISsGruDIyNVK3UDa2B/fwHRag7GCMcxwEIywF/6Sy6w8ufnZ3b2a+iXGhEI",
  render_errors: [view: AwsCloudformationExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AwsCloudformationExample.PubSub,
  live_view: [signing_salt: "ghCI+x4T"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
