defmodule IncidentReportManagerWeb.CreateTemplateLive do
  use IncidentReportManagerWeb, :live_view
  alias IncidentReportManager.Templates
  def mount(_params, _session, socket) do
    Templates.subscribe()
    {:ok, fetch(socket)}
  end

  def handle_info({Templates, [:template | _ ], _}, socket) do
    {:noreply, fetch(socket)}
  end

  def handle_event("add", %{"templates" => details}, socket) do
    Templates.create_template(details)
    {:noreply, fetch(socket)}
  end

  def handle_event("delete_template", %{"id" => id}, socket) do
    this_template = Templates.get_template!(id)
    Templates.delete_template(this_template)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, templates: Templates.list_templates())
  end
end
