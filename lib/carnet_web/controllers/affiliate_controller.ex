defmodule CarnetWeb.AffiliateController do
  use CarnetWeb, :controller

  alias Carnet.Repo
  alias Carnet.Affiliates
  alias Carnet.Affiliates.Affiliate

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

  #Funcion para comparar el correo y la contraseña con la base de datos y autorizar el ingreso
  #O no.
  def login_email_password(nil, _password) do
    {:error, :invalid}
  end

  def login_email_password(_correo, nil) do
    {:error, :invalid}
  end

  def login_email_password(correo, password) do
    with  %Affiliate{} = affiliate <- Repo.get_by(Affiliate, correo: correo) |> Repo.preload(:roles),
          true <- Argon2.verify_pass(password, affiliate.password_hash) do
      {:ok, affiliate}
    else
      _ ->
        # Help to mitigate timing attacks
        Argon2.no_user_verify
        {:error, :unauthorised}
    end
  end
end
