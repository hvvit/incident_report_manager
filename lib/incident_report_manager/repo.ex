defmodule IncidentReportManager.Repo do
  use Ecto.Repo,
    otp_app: :incident_report_manager,
    adapter: Ecto.Adapters.Postgres
end
