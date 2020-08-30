defmodule AwsCloudformationExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AwsCloudformationExample.Repo,
      # Start the Telemetry supervisor
      AwsCloudformationExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AwsCloudformationExample.PubSub},
      # Start the Endpoint (http/https)
      AwsCloudformationExampleWeb.Endpoint
      # Start a worker by calling: AwsCloudformationExample.Worker.start_link(arg)
      # {AwsCloudformationExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AwsCloudformationExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AwsCloudformationExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
