defmodule OsunsaWeb.AffiliateCovenantView do
  use OsunsaWeb, :view
  alias OsunsaWeb.AffiliateCovenantView


  def render("affiliates_covenants.json", %{affiliates: affiliates}) do
    %{data: render_many(affiliates, AffiliateCovenantView, "affiliate_covenant.json", as: :affiliate_covenant)}
  end

  def render("show.json", %{affiliate: affiliate}) do
    %{data: render_one(affiliate, AffiliateCovenantView, "affiliate_covenant.json", as: :affiliate_covenant)}
  end

  def render("affiliate_covenant.json", %{affiliate_covenant: affiliate_covenant}) do
    %{
      fecha_alta: affiliate_covenant.fecha_alta,
      fecha_baja: affiliate_covenant.fecha_baja,
      affiliate: render_one(affiliate_covenant.beneficiarios, OsunsaWeb.AffiliateView, "affiliate.json"),
      covenant: render_one(affiliate_covenant.covenants, OsunsaWeb.CovenantView, "covenant.json")
    }
  end
end
