defmodule Carnet.RolesTest do
  use Carnet.DataCase

  alias Carnet.Roles

  describe "roles" do
    alias Carnet.Roles.Rol

    @valid_attrs %{nombre: "some nombre"}
    @update_attrs %{nombre: "some updated nombre"}
    @invalid_attrs %{nombre: nil}

    def rol_fixture(attrs \\ %{}) do
      {:ok, rol} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_rol()

      rol
    end

    test "list_roles/0 returns all roles" do
      rol = rol_fixture()
      assert Roles.list_roles() == [rol]
    end

    test "get_rol!/1 returns the rol with given id" do
      rol = rol_fixture()
      assert Roles.get_rol!(rol.id) == rol
    end

    test "create_rol/1 with valid data creates a rol" do
      assert {:ok, %Rol{} = rol} = Roles.create_rol(@valid_attrs)
      assert rol.nombre == "some nombre"
    end

    test "create_rol/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_rol(@invalid_attrs)
    end

    test "update_rol/2 with valid data updates the rol" do
      rol = rol_fixture()
      assert {:ok, %Rol{} = rol} = Roles.update_rol(rol, @update_attrs)
      assert rol.nombre == "some updated nombre"
    end

    test "update_rol/2 with invalid data returns error changeset" do
      rol = rol_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_rol(rol, @invalid_attrs)
      assert rol == Roles.get_rol!(rol.id)
    end

    test "delete_rol/1 deletes the rol" do
      rol = rol_fixture()
      assert {:ok, %Rol{}} = Roles.delete_rol(rol)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_rol!(rol.id) end
    end

    test "change_rol/1 returns a rol changeset" do
      rol = rol_fixture()
      assert %Ecto.Changeset{} = Roles.change_rol(rol)
    end
  end
end
