defmodule PrNotifier.ProjectRepository do
  use PrNotifier.Web, :model

  schema "project_repository" do
    belongs_to :project, PrNotifier.Project
    belongs_to :repository, PrNotifier.Repository

    timestamps
  end

  @required_fields ~w(project_id repository_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
