defmodule CarnetWeb.AutentificacionController do
  use CarnetWeb, :controller

  plug Ueberauth

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    correo = auth.uid
    password = auth.credentials.other.password
    handle_affiliate_conn(CarnetWeb.AffiliateController.login_email_password(correo, password), conn)
  end

  #Es el que asigna el token.
  defp handle_affiliate_conn(affiliate, conn) do
    case affiliate do
      {:ok, affiliado} ->
        {:ok, jwt, _full_claims} =
          CarnetWeb.Guardian.encode_and_sign(affiliado, %{}, ttl: {1, :days})

          conn
            |> put_resp_header("authorization", "Bearer #{jwt}")
            |> render("auth.json", affiliate: affiliado, token: jwt, roles: affiliado.roles)

      # Handle our own error to keep it generic
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> json(%{message: "afiliado not found"})
    end
  end

  def delete(conn, _) do
    conn
    |> CarnetWeb.Guardian.Plug.sign_out()
    |> put_status(:no_content)
    |> json(%{message: "sign out"})
  end

  def refresh(conn, _params) do
    user = CarnetWeb.Guardian.Plug.current_resource(conn)
    jwt = CarnetWeb.Guardian.Plug.current_token(conn)

    case CarnetWeb.Guardian.refresh(jwt, ttl: {1, :days}) do
      {:ok, _, {new_jwt, _new_claims}} ->
        conn
        |> put_status(:ok)
        |> render("auth.json", user: user, token: new_jwt, roles: user.roles)

      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json", error: "Not Authenticated")
    end
  end

  def revoke(conn, params) do
    {:ok, _claims} = CarnetWeb.Guardian.revoke(params["token"])

    conn
    |> put_status(:ok)
    |> json(%{message: "token revoked"})
  end
end
