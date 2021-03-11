defmodule OsunsaWeb.CovenantControllerTest do
  use OsunsaWeb.ConnCase

  alias Osunsa.Covenants

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:covenant) do
    {:ok, covenant} = Covenants.create_covenant(@create_attrs)
    covenant
  end

  describe "index" do
    test "lists all covenants", %{conn: conn} do
      conn = get(conn, Routes.covenant_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Covenants"
    end
  end

  describe "new covenant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.covenant_path(conn, :new))
      assert html_response(conn, 200) =~ "New Covenant"
    end
  end

  describe "create covenant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.covenant_path(conn, :create), covenant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.covenant_path(conn, :show, id)

      conn = get(conn, Routes.covenant_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Covenant"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.covenant_path(conn, :create), covenant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Covenant"
    end
  end

  describe "edit covenant" do
    setup [:create_covenant]

    test "renders form for editing chosen covenant", %{conn: conn, covenant: covenant} do
      conn = get(conn, Routes.covenant_path(conn, :edit, covenant))
      assert html_response(conn, 200) =~ "Edit Covenant"
    end
  end

  describe "update covenant" do
    setup [:create_covenant]

    test "redirects when data is valid", %{conn: conn, covenant: covenant} do
      conn = put(conn, Routes.covenant_path(conn, :update, covenant), covenant: @update_attrs)
      assert redirected_to(conn) == Routes.covenant_path(conn, :show, covenant)

      conn = get(conn, Routes.covenant_path(conn, :show, covenant))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, covenant: covenant} do
      conn = put(conn, Routes.covenant_path(conn, :update, covenant), covenant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Covenant"
    end
  end

  describe "delete covenant" do
    setup [:create_covenant]

    test "deletes chosen covenant", %{conn: conn, covenant: covenant} do
      conn = delete(conn, Routes.covenant_path(conn, :delete, covenant))
      assert redirected_to(conn) == Routes.covenant_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.covenant_path(conn, :show, covenant))
      end
    end
  end

  defp create_covenant(_) do
    covenant = fixture(:covenant)
    %{covenant: covenant}
  end
end
