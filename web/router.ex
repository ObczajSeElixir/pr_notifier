defmodule PrNotifier.Router do
  use PrNotifier.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :authorized do
    plug :authorize_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PrNotifier do
    pipe_through [:browser, :authorized]

    get "/", PageController, :index
    resources "/projects", ProjectController
    resources "/repositories", RepositoryController, only: [:index]
  end

  scope "/", PrNotifier do
    pipe_through :browser
    get "/unauthorized", PageController, :unauthorized
  end

  scope "/auth", PrNotifier do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

  defp authorize_user(conn, params) do
    case get_session(conn, :current_user) do
      nil ->
        conn
          |> redirect(to: "/unauthorized")
          |> halt
      _ ->
        conn
    end
  end
end
