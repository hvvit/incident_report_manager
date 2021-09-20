defmodule IncidentReportManager.Templates.Template do
  use Ecto.Schema
  import Ecto.Changeset

  schema "templates" do
    field :cause, :string
    field :impact, :string
    field :observation, :string
    field :owner, :string
    field :product, :string

    timestamps()
  end

  @doc false
  def changeset(template, attrs) do
    template
    |> cast(attrs, [:owner, :product, :observation, :cause, :impact])
    |> validate_required([:owner, :product, :observation, :cause, :impact])
  end
end
