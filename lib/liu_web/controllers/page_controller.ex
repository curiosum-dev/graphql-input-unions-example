defmodule LiuWeb.PageController do
  use LiuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
