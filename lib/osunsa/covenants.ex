defmodule Osunsa.Covenants do
  @moduledoc """
  The Covenants context.
  """

  import Ecto.Query, warn: false
  alias Osunsa.Repo

  alias Osunsa.Covenants.Covenant

  @doc """
  Returns the list of covenants.

  ## Examples

      iex> list_covenants()
      [%Covenant{}, ...]

  """
  def list_covenants do
    Repo.all(Covenant)
  end

  @doc """
  Gets a single covenant.

  Raises `Ecto.NoResultsError` if the Covenant does not exist.

  ## Examples

      iex> get_covenant!(123)
      %Covenant{}

      iex> get_covenant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_covenant!(id), do: Repo.get!(Covenant, id)

  @doc """
  Creates a covenant.

  ## Examples

      iex> create_covenant(%{field: value})
      {:ok, %Covenant{}}

      iex> create_covenant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_covenant(attrs \\ %{}) do
    %Covenant{}
    |> Covenant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a covenant.

  ## Examples

      iex> update_covenant(covenant, %{field: new_value})
      {:ok, %Covenant{}}

      iex> update_covenant(covenant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_covenant(%Covenant{} = covenant, attrs) do
    covenant
    |> Covenant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a covenant.

  ## Examples

      iex> delete_covenant(covenant)
      {:ok, %Covenant{}}

      iex> delete_covenant(covenant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_covenant(%Covenant{} = covenant) do
    Repo.delete(covenant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking covenant changes.

  ## Examples

      iex> change_covenant(covenant)
      %Ecto.Changeset{data: %Covenant{}}

  """
  def change_covenant(%Covenant{} = covenant, attrs \\ %{}) do
    Covenant.changeset(covenant, attrs)
  end
end
