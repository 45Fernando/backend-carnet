defmodule CarnetWeb.AffiliateControllerTest do
  use CarnetWeb.ConnCase

  alias Carnet.Affiliates

  @create_attrs %{avatar: "some avatar", correo: "some correo", dni: "some dni", name: "some name", password_hash: "some password_hash"}
  @update_attrs %{avatar: "some updated avatar", correo: "some updated correo", dni: "some updated dni", name: "some updated name", password_hash: "some updated password_hash"}
  @invalid_attrs %{avatar: nil, correo: nil, dni: nil, name: nil, password_hash: nil}

  def fixture(:affiliate) do
    {:ok, affiliate} = Affiliates.create_affiliate(@create_attrs)
    affiliate
  end

  describe "index" do
    test "lists all affiliates", %{conn: conn} do
      conn = get(conn, Routes.affiliate_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Affiliates"
    end
  end

  describe "new affiliate" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.affiliate_path(conn, :new))
      assert html_response(conn, 200) =~ "New Affiliate"
    end
  end

  describe "create affiliate" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.affiliate_path(conn, :create), affiliate: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.affiliate_path(conn, :show, id)

      conn = get(conn, Routes.affiliate_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Affiliate"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.affiliate_path(conn, :create), affiliate: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Affiliate"
    end
  end

  describe "edit affiliate" do
    setup [:create_affiliate]

    test "renders form for editing chosen affiliate", %{conn: conn, affiliate: affiliate} do
      conn = get(conn, Routes.affiliate_path(conn, :edit, affiliate))
      assert html_response(conn, 200) =~ "Edit Affiliate"
    end
  end

  describe "update affiliate" do
    setup [:create_affiliate]

    test "redirects when data is valid", %{conn: conn, affiliate: affiliate} do
      conn = put(conn, Routes.affiliate_path(conn, :update, affiliate), affiliate: @update_attrs)
      assert redirected_to(conn) == Routes.affiliate_path(conn, :show, affiliate)

      conn = get(conn, Routes.affiliate_path(conn, :show, affiliate))
      assert html_response(conn, 200) =~ "some updated avatar"
    end

    test "renders errors when data is invalid", %{conn: conn, affiliate: affiliate} do
      conn = put(conn, Routes.affiliate_path(conn, :update, affiliate), affiliate: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Affiliate"
    end
  end

  describe "delete affiliate" do
    setup [:create_affiliate]

    test "deletes chosen affiliate", %{conn: conn, affiliate: affiliate} do
      conn = delete(conn, Routes.affiliate_path(conn, :delete, affiliate))
      assert redirected_to(conn) == Routes.affiliate_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.affiliate_path(conn, :show, affiliate))
      end
    end
  end

  defp create_affiliate(_) do
    affiliate = fixture(:affiliate)
    %{affiliate: affiliate}
  end
end
