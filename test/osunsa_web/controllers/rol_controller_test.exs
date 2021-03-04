defmodule OsunsaWeb.RolControllerTest do
  use OsunsaWeb.ConnCase

  alias Osunsa.Roles

  @create_attrs %{nombre: "some nombre"}
  @update_attrs %{nombre: "some updated nombre"}
  @invalid_attrs %{nombre: nil}

  def fixture(:rol) do
    {:ok, rol} = Roles.create_rol(@create_attrs)
    rol
  end

  describe "index" do
    test "lists all roles", %{conn: conn} do
      conn = get(conn, Routes.rol_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Roles"
    end
  end

  describe "new rol" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.rol_path(conn, :new))
      assert html_response(conn, 200) =~ "New Rol"
    end
  end

  describe "create rol" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rol_path(conn, :create), rol: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.rol_path(conn, :show, id)

      conn = get(conn, Routes.rol_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Rol"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rol_path(conn, :create), rol: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Rol"
    end
  end

  describe "edit rol" do
    setup [:create_rol]

    test "renders form for editing chosen rol", %{conn: conn, rol: rol} do
      conn = get(conn, Routes.rol_path(conn, :edit, rol))
      assert html_response(conn, 200) =~ "Edit Rol"
    end
  end

  describe "update rol" do
    setup [:create_rol]

    test "redirects when data is valid", %{conn: conn, rol: rol} do
      conn = put(conn, Routes.rol_path(conn, :update, rol), rol: @update_attrs)
      assert redirected_to(conn) == Routes.rol_path(conn, :show, rol)

      conn = get(conn, Routes.rol_path(conn, :show, rol))
      assert html_response(conn, 200) =~ "some updated nombre"
    end

    test "renders errors when data is invalid", %{conn: conn, rol: rol} do
      conn = put(conn, Routes.rol_path(conn, :update, rol), rol: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Rol"
    end
  end

  describe "delete rol" do
    setup [:create_rol]

    test "deletes chosen rol", %{conn: conn, rol: rol} do
      conn = delete(conn, Routes.rol_path(conn, :delete, rol))
      assert redirected_to(conn) == Routes.rol_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.rol_path(conn, :show, rol))
      end
    end
  end

  defp create_rol(_) do
    rol = fixture(:rol)
    %{rol: rol}
  end
end
