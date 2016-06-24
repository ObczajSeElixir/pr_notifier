defmodule PrNotifier.ProjectRepositoryTest do
  use PrNotifier.ModelCase

  alias PrNotifier.ProjectRepository

  @valid_attrs %{project_id: 42, repository_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProjectRepository.changeset(%ProjectRepository{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProjectRepository.changeset(%ProjectRepository{}, @invalid_attrs)
    refute changeset.valid?
  end
end
