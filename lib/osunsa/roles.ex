defmodule Osunsa.Roles do
  @moduledoc """
  The Roles context.
  """

  import Ecto.Query, warn: false
  alias Osunsa.Repo

  alias Osunsa.Roles.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Rol{}, ...]

  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single rol.

  Raises `Ecto.NoResultsError` if the Rol does not exist.

  ## Examples

      iex> get_rol!(123)
      %Rol{}

      iex> get_rol!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a rol.

  ## Examples

      iex> create_rol(%{field: value})
      {:ok, %Rol{}}

      iex> create_rol(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rol.

  ## Examples

      iex> update_rol(rol, %{field: new_value})
      {:ok, %Rol{}}

      iex> update_rol(rol, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rol.

  ## Examples

      iex> delete_rol(rol)
      {:ok, %Rol{}}

      iex> delete_rol(rol)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rol changes.

  ## Examples

      iex> change_rol(rol)
      %Ecto.Changeset{data: %Rol{}}

  """
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end
end
