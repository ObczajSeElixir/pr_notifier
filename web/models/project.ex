defmodule PrNotifier.Project do
  use PrNotifier.Web, :model

  schema "projects" do
    field :name, :string
    has_many :project_repositories, PrNotifier.ProjectRepository
    has_many :repositories, through: [:project_repositories, :repository]
    timestamps
  end

  @required_fields ~w(name)
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
