defmodule PrNotifier.PageController do
  use PrNotifier.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
