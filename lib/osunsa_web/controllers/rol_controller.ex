defmodule OsunsaWeb.RolController do
  use OsunsaWeb, :controller

  alias Osunsa.Roles
  alias Osunsa.Roles.Rol

  def index(conn, _params) do
    roles = Roles.list_roles()
    render(conn, "index.html", roles: roles)
  end

  def new(conn, _params) do
    changeset = Roles.change_rol(%Rol{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"rol" => rol_params}) do
    case Roles.create_rol(rol_params) do
      {:ok, rol} ->
        conn
        |> put_flash(:info, "Rol created successfully.")
        |> redirect(to: Routes.rol_path(conn, :show, rol))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    rol = Roles.get_rol!(id)
    render(conn, "show.html", rol: rol)
  end

  def edit(conn, %{"id" => id}) do
    rol = Roles.get_rol!(id)
    changeset = Roles.change_rol(rol)
    render(conn, "edit.html", rol: rol, changeset: changeset)
  end

  def update(conn, %{"id" => id, "rol" => rol_params}) do
    rol = Roles.get_rol!(id)

    case Roles.update_rol(rol, rol_params) do
      {:ok, rol} ->
        conn
        |> put_flash(:info, "Rol updated successfully.")
        |> redirect(to: Routes.rol_path(conn, :show, rol))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", rol: rol, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rol = Roles.get_rol!(id)
    {:ok, _rol} = Roles.delete_rol(rol)

    conn
    |> put_flash(:info, "Rol deleted successfully.")
    |> redirect(to: Routes.rol_path(conn, :index))
  end
end
