defmodule PrNotifier.RepositoryController do
  use PrNotifier.Web, :controller

  def index(conn, _params) do
    # TODO don't use hardcoded organization
    client = Tentacat.Client.new
    repositories = Tentacat.Repositories.list_orgs("netguru", client)
      |> Enum.map(fn(repo) -> %{
          full_name: repo["full_name"],
          description: repo["description"]
        } end)

    render(conn, "index.json", repositories: repositories)
  end
end
