defmodule IncidentReportManager.TemplatesTest do
  use IncidentReportManager.DataCase

  alias IncidentReportManager.Templates

  describe "templates" do
    alias IncidentReportManager.Templates.Template

    @valid_attrs %{cause: "some cause", impact: "some impact", observation: "some observation", owner: "some owner", product: "some product"}
    @update_attrs %{cause: "some updated cause", impact: "some updated impact", observation: "some updated observation", owner: "some updated owner", product: "some updated product"}
    @invalid_attrs %{cause: nil, impact: nil, observation: nil, owner: nil, product: nil}

    def template_fixture(attrs \\ %{}) do
      {:ok, template} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Templates.create_template()

      template
    end

    test "list_templates/0 returns all templates" do
      template = template_fixture()
      assert Templates.list_templates() == [template]
    end

    test "get_template!/1 returns the template with given id" do
      template = template_fixture()
      assert Templates.get_template!(template.id) == template
    end

    test "create_template/1 with valid data creates a template" do
      assert {:ok, %Template{} = template} = Templates.create_template(@valid_attrs)
      assert template.cause == "some cause"
      assert template.impact == "some impact"
      assert template.observation == "some observation"
      assert template.owner == "some owner"
      assert template.product == "some product"
    end

    test "create_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_template(@invalid_attrs)
    end

    test "update_template/2 with valid data updates the template" do
      template = template_fixture()
      assert {:ok, %Template{} = template} = Templates.update_template(template, @update_attrs)
      assert template.cause == "some updated cause"
      assert template.impact == "some updated impact"
      assert template.observation == "some updated observation"
      assert template.owner == "some updated owner"
      assert template.product == "some updated product"
    end

    test "update_template/2 with invalid data returns error changeset" do
      template = template_fixture()
      assert {:error, %Ecto.Changeset{}} = Templates.update_template(template, @invalid_attrs)
      assert template == Templates.get_template!(template.id)
    end

    test "delete_template/1 deletes the template" do
      template = template_fixture()
      assert {:ok, %Template{}} = Templates.delete_template(template)
      assert_raise Ecto.NoResultsError, fn -> Templates.get_template!(template.id) end
    end

    test "change_template/1 returns a template changeset" do
      template = template_fixture()
      assert %Ecto.Changeset{} = Templates.change_template(template)
    end
  end
end
