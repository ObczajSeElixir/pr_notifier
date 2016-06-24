defmodule PrNotifier.RepositoryView do
  use PrNotifier.Web, :view

  def render("index.json", %{repositories: repositories}) do
    %{data: repositories}
  end
end
