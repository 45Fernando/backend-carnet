defmodule OsunsaWeb.PageController do
  use OsunsaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
