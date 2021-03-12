defmodule Osunsa.AffiliatesCovenants do
  @moduledoc """
  The AffiliatesCovenants context.
  """

  import Ecto.Query, warn: false
  alias Osunsa.Repo

  alias Osunsa.AffiliatesCovenants.AffiliateCovenant

  @doc """
  Returns the list of affiliatescovenants.

  ## Examples

      iex> list_affiliatescovenants()
      [%AffiliateCovenant{}, ...]

  """
  def list_affiliatescovenants do
    Repo.all(AffiliateCovenant)
  end

  @doc """
  Gets a single affiliate_covenant.

  Raises `Ecto.NoResultsError` if the Affiliate covenant does not exist.

  ## Examples

      iex> get_affiliate_covenant!(123)
      %AffiliateCovenant{}

      iex> get_affiliate_covenant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_affiliate_covenant!(id), do: Repo.get!(AffiliateCovenant, id)

  @doc """
  Creates a affiliate_covenant.

  ## Examples

      iex> create_affiliate_covenant(%{field: value})
      {:ok, %AffiliateCovenant{}}

      iex> create_affiliate_covenant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_affiliate_covenant(attrs \\ %{}) do
    %AffiliateCovenant{}
    |> AffiliateCovenant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a affiliate_covenant.

  ## Examples

      iex> update_affiliate_covenant(affiliate_covenant, %{field: new_value})
      {:ok, %AffiliateCovenant{}}

      iex> update_affiliate_covenant(affiliate_covenant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_affiliate_covenant(%AffiliateCovenant{} = affiliate_covenant, attrs) do
    affiliate_covenant
    |> AffiliateCovenant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a affiliate_covenant.

  ## Examples

      iex> delete_affiliate_covenant(affiliate_covenant)
      {:ok, %AffiliateCovenant{}}

      iex> delete_affiliate_covenant(affiliate_covenant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_affiliate_covenant(%AffiliateCovenant{} = affiliate_covenant) do
    Repo.delete(affiliate_covenant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking affiliate_covenant changes.

  ## Examples

      iex> change_affiliate_covenant(affiliate_covenant)
      %Ecto.Changeset{data: %AffiliateCovenant{}}

  """
  def change_affiliate_covenant(%AffiliateCovenant{} = affiliate_covenant, attrs \\ %{}) do
    AffiliateCovenant.changeset(affiliate_covenant, attrs)
  end
end
