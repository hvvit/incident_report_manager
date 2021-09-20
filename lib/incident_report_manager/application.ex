defmodule IncidentReportManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      IncidentReportManager.Repo,
      # Start the Telemetry supervisor
      IncidentReportManagerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: IncidentReportManager.PubSub},
      # Start the Endpoint (http/https)
      IncidentReportManagerWeb.Endpoint
      # Start a worker by calling: IncidentReportManager.Worker.start_link(arg)
      # {IncidentReportManager.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IncidentReportManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IncidentReportManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
