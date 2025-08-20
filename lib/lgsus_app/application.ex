defmodule LgsusApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LgsusAppWeb.Telemetry,
      LgsusApp.Repo,
      {DNSCluster, query: Application.get_env(:lgsus_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LgsusApp.PubSub},
      # Start a worker by calling: LgsusApp.Worker.start_link(arg)
      # {LgsusApp.Worker, arg},
      # Start to serve requests, typically the last entry
      LgsusAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LgsusApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LgsusAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
