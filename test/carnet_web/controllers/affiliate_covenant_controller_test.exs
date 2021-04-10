defmodule CarnetWeb.AffiliateCovenantControllerTest do
  use CarnetWeb.ConnCase

  alias Carnet.AffiliatesCovenants

  @create_attrs %{fecha_alta: ~D[2010-04-17], fecha_baja: ~D[2010-04-17]}
  @update_attrs %{fecha_alta: ~D[2011-05-18], fecha_baja: ~D[2011-05-18]}
  @invalid_attrs %{fecha_alta: nil, fecha_baja: nil}

  def fixture(:affiliate_covenant) do
    {:ok, affiliate_covenant} = AffiliatesCovenants.create_affiliate_covenant(@create_attrs)
    affiliate_covenant
  end

  describe "index" do
    test "lists all affiliatescovenants", %{conn: conn} do
      conn = get(conn, Routes.affiliate_covenant_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Affiliatescovenants"
    end
  end

  describe "new affiliate_covenant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.affiliate_covenant_path(conn, :new))
      assert html_response(conn, 200) =~ "New Affiliate covenant"
    end
  end

  describe "create affiliate_covenant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.affiliate_covenant_path(conn, :create), affiliate_covenant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.affiliate_covenant_path(conn, :show, id)

      conn = get(conn, Routes.affiliate_covenant_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Affiliate covenant"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.affiliate_covenant_path(conn, :create), affiliate_covenant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Affiliate covenant"
    end
  end

  describe "edit affiliate_covenant" do
    setup [:create_affiliate_covenant]

    test "renders form for editing chosen affiliate_covenant", %{conn: conn, affiliate_covenant: affiliate_covenant} do
      conn = get(conn, Routes.affiliate_covenant_path(conn, :edit, affiliate_covenant))
      assert html_response(conn, 200) =~ "Edit Affiliate covenant"
    end
  end

  describe "update affiliate_covenant" do
    setup [:create_affiliate_covenant]

    test "redirects when data is valid", %{conn: conn, affiliate_covenant: affiliate_covenant} do
      conn = put(conn, Routes.affiliate_covenant_path(conn, :update, affiliate_covenant), affiliate_covenant: @update_attrs)
      assert redirected_to(conn) == Routes.affiliate_covenant_path(conn, :show, affiliate_covenant)

      conn = get(conn, Routes.affiliate_covenant_path(conn, :show, affiliate_covenant))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, affiliate_covenant: affiliate_covenant} do
      conn = put(conn, Routes.affiliate_covenant_path(conn, :update, affiliate_covenant), affiliate_covenant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Affiliate covenant"
    end
  end

  describe "delete affiliate_covenant" do
    setup [:create_affiliate_covenant]

    test "deletes chosen affiliate_covenant", %{conn: conn, affiliate_covenant: affiliate_covenant} do
      conn = delete(conn, Routes.affiliate_covenant_path(conn, :delete, affiliate_covenant))
      assert redirected_to(conn) == Routes.affiliate_covenant_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.affiliate_covenant_path(conn, :show, affiliate_covenant))
      end
    end
  end

  defp create_affiliate_covenant(_) do
    affiliate_covenant = fixture(:affiliate_covenant)
    %{affiliate_covenant: affiliate_covenant}
  end
end
