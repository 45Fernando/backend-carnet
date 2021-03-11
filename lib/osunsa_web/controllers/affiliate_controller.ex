defmodule OsunsaWeb.AffiliateController do
  use OsunsaWeb, :controller

  alias Osunsa.Affiliates
  alias Osunsa.Affiliates.Affiliate

  def index(conn, _params) do
    affiliates = Affiliates.list_affiliates()
    render(conn, "index.html", affiliates: affiliates)
  end

  def new(conn, _params) do
    changeset = Affiliates.change_affiliate(%Affiliate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"affiliate" => affiliate_params}) do
    case Affiliates.create_affiliate(affiliate_params) do
      {:ok, affiliate} ->
        conn
        |> put_flash(:info, "Affiliate created successfully.")
        |> redirect(to: Routes.affiliate_path(conn, :show, affiliate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    affiliate = Affiliates.get_affiliate!(id)
    render(conn, "show.html", affiliate: affiliate)
  end

  def edit(conn, %{"id" => id}) do
    affiliate = Affiliates.get_affiliate!(id)
    changeset = Affiliates.change_affiliate(affiliate)
    render(conn, "edit.html", affiliate: affiliate, changeset: changeset)
  end

  def update(conn, %{"id" => id, "affiliate" => affiliate_params}) do
    affiliate = Affiliates.get_affiliate!(id)

    case Affiliates.update_affiliate(affiliate, affiliate_params) do
      {:ok, affiliate} ->
        conn
        |> put_flash(:info, "Affiliate updated successfully.")
        |> redirect(to: Routes.affiliate_path(conn, :show, affiliate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", affiliate: affiliate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    affiliate = Affiliates.get_affiliate!(id)
    {:ok, _affiliate} = Affiliates.delete_affiliate(affiliate)

    conn
    |> put_flash(:info, "Affiliate deleted successfully.")
    |> redirect(to: Routes.affiliate_path(conn, :index))
  end
end
