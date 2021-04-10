defmodule CarnetWeb.CovenantController do
  use CarnetWeb, :controller

  alias Carnet.Covenants
  alias Carnet.Covenants.Covenant

  def index(conn, _params) do
    covenants = Covenants.list_covenants()
    render(conn, "index.html", covenants: covenants)
  end

  def new(conn, _params) do
    changeset = Covenants.change_covenant(%Covenant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"covenant" => covenant_params}) do
    case Covenants.create_covenant(covenant_params) do
      {:ok, covenant} ->
        conn
        |> put_flash(:info, "Covenant created successfully.")
        |> redirect(to: Routes.covenant_path(conn, :show, covenant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    covenant = Covenants.get_covenant!(id)
    render(conn, "show.html", covenant: covenant)
  end

  def edit(conn, %{"id" => id}) do
    covenant = Covenants.get_covenant!(id)
    changeset = Covenants.change_covenant(covenant)
    render(conn, "edit.html", covenant: covenant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "covenant" => covenant_params}) do
    covenant = Covenants.get_covenant!(id)

    case Covenants.update_covenant(covenant, covenant_params) do
      {:ok, covenant} ->
        conn
        |> put_flash(:info, "Covenant updated successfully.")
        |> redirect(to: Routes.covenant_path(conn, :show, covenant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", covenant: covenant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    covenant = Covenants.get_covenant!(id)
    {:ok, _covenant} = Covenants.delete_covenant(covenant)

    conn
    |> put_flash(:info, "Covenant deleted successfully.")
    |> redirect(to: Routes.covenant_path(conn, :index))
  end
end
