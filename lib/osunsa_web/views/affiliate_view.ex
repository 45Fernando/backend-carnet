defmodule OsunsaWeb.AffiliateView do
  use OsunsaWeb, :view
  alias OsunsaWeb.AffiliateView

  def render("index.json", %{affiliates: affiliates}) do
    %{data: render_many(affiliates, AffiliateView, "affiliate.json", as: :affiliate)}
  end

  def render("show.json", %{affiliate: affiliate}) do
    %{data: render_one(affiliate, AffiliateView, "affiliate.json", as: :affiliate)}
  end

  def render("affiliate.json", %{affiliate: affiliate}) do
    %{
      id: affiliate.id,
      name: affiliate.name,
      dni: affiliate.dni,
      correo: affiliate.correo
      #avatars: TurnosWeb.Uploaders.Avatar.urls({user.avatar, user}),
    }
  end
end
