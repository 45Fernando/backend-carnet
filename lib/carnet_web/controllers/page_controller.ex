defmodule CarnetWeb.PageController do
  use CarnetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
