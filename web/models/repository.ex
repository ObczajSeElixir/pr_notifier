defmodule PrNotifier.Repository do
  use PrNotifier.Web, :model

  schema "repositories" do
    field :full_name, :string
    field :description, :string
    has_many :project_repositories, PrNotifier.ProjectRepository
    has_many :projects, through: [:project_repositories, :projects]
    timestamps
  end

  @required_fields ~w(full_name description)
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
