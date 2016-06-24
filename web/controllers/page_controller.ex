defmodule PrNotifier.PageController do
  use PrNotifier.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def unauthorized(conn, _params) do
    conn
      |> put_flash(:alert, "You need to login first!")
      |> render("index.html")
  end
end
