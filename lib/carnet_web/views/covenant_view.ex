defmodule CarnetWeb.CovenantView do
  use CarnetWeb, :view
  alias CarnetWeb.CovenantView

  def render("index.json", %{covenants: covenants}) do
    %{data: render_many(covenants, CovenantView, "covenant.json", as: :covenant)}
  end

  def render("show.json", %{covenant: covenant}) do
    %{data: render_one(covenant, CovenantView, "covenant.json", as: :covenant)}
  end

  def render("covenant.json", %{covenant: covenant}) do
    %{
      id: covenant.id,
      name: covenant.name
    }
  end
end
