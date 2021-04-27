defmodule CarnetWeb.AffiliateView do
  use CarnetWeb, :view
  alias CarnetWeb.AffiliateView

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
      correo: affiliate.correo,
      avatar: affiliate.avatar
      # avatars: TurnosWeb.Uploaders.Avatar.urls({user.avatar, user}),
    }
  end
end
