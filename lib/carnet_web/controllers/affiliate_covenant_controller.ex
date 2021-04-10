defmodule CarnetWeb.AffiliateCovenantController do
  use CarnetWeb, :controller

  alias Carnet.AffiliatesCovenants
  alias Carnet.AffiliatesCovenants.AffiliateCovenant
  alias Carnet.Repo

  def index(conn, _params) do
    affiliatescovenants = AffiliatesCovenants.list_affiliatescovenants()
    render(conn, "index.html", affiliatescovenants: affiliatescovenants)
  end

  def new(conn, _params) do
    changeset = AffiliatesCovenants.change_affiliate_covenant(%AffiliateCovenant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"affiliate_covenant" => affiliate_covenant_params}) do
    case AffiliatesCovenants.create_affiliate_covenant(affiliate_covenant_params) do
      {:ok, affiliate_covenant} ->
        conn
        |> put_flash(:info, "Affiliate covenant created successfully.")
        |> redirect(to: Routes.affiliate_covenant_path(conn, :show, affiliate_covenant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    affiliate_covenant = AffiliatesCovenants.get_affiliate_covenant!(id)
    render(conn, "show.html", affiliate_covenant: affiliate_covenant)
  end

  def edit(conn, %{"id" => id}) do
    affiliate_covenant = AffiliatesCovenants.get_affiliate_covenant!(id)
    changeset = AffiliatesCovenants.change_affiliate_covenant(affiliate_covenant)
    render(conn, "edit.html", affiliate_covenant: affiliate_covenant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "affiliate_covenant" => affiliate_covenant_params}) do
    affiliate_covenant = AffiliatesCovenants.get_affiliate_covenant!(id)

    case AffiliatesCovenants.update_affiliate_covenant(affiliate_covenant, affiliate_covenant_params) do
      {:ok, affiliate_covenant} ->
        conn
        |> put_flash(:info, "Affiliate covenant updated successfully.")
        |> redirect(to: Routes.affiliate_covenant_path(conn, :show, affiliate_covenant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", affiliate_covenant: affiliate_covenant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    affiliate_covenant = AffiliatesCovenants.get_affiliate_covenant!(id)
    {:ok, _affiliate_covenant} = AffiliatesCovenants.delete_affiliate_covenant(affiliate_covenant)

    conn
    |> put_flash(:info, "Affiliate covenant deleted successfully.")
    |> redirect(to: Routes.affiliate_covenant_path(conn, :index))
  end


  def get_affiliates_per_covenants(conn, _params) do
    affiliate = conn |> Guardian.Plug.current_resource()

    affiliates = Carnet.AffiliatesCovenants.get_affiliates_per_covenants(affiliate.id)
                      |> Repo.preload(:beneficiarios)
                      |> Repo.preload(:covenants)

    render(conn, "affiliates_covenants.json", affiliates: affiliates, as: :affiliates)
  end
end
