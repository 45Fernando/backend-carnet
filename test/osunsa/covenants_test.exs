defmodule Osunsa.CovenantsTest do
  use Osunsa.DataCase

  alias Osunsa.Covenants

  describe "covenants" do
    alias Osunsa.Covenants.Covenant

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def covenant_fixture(attrs \\ %{}) do
      {:ok, covenant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Covenants.create_covenant()

      covenant
    end

    test "list_covenants/0 returns all covenants" do
      covenant = covenant_fixture()
      assert Covenants.list_covenants() == [covenant]
    end

    test "get_covenant!/1 returns the covenant with given id" do
      covenant = covenant_fixture()
      assert Covenants.get_covenant!(covenant.id) == covenant
    end

    test "create_covenant/1 with valid data creates a covenant" do
      assert {:ok, %Covenant{} = covenant} = Covenants.create_covenant(@valid_attrs)
      assert covenant.name == "some name"
    end

    test "create_covenant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Covenants.create_covenant(@invalid_attrs)
    end

    test "update_covenant/2 with valid data updates the covenant" do
      covenant = covenant_fixture()
      assert {:ok, %Covenant{} = covenant} = Covenants.update_covenant(covenant, @update_attrs)
      assert covenant.name == "some updated name"
    end

    test "update_covenant/2 with invalid data returns error changeset" do
      covenant = covenant_fixture()
      assert {:error, %Ecto.Changeset{}} = Covenants.update_covenant(covenant, @invalid_attrs)
      assert covenant == Covenants.get_covenant!(covenant.id)
    end

    test "delete_covenant/1 deletes the covenant" do
      covenant = covenant_fixture()
      assert {:ok, %Covenant{}} = Covenants.delete_covenant(covenant)
      assert_raise Ecto.NoResultsError, fn -> Covenants.get_covenant!(covenant.id) end
    end

    test "change_covenant/1 returns a covenant changeset" do
      covenant = covenant_fixture()
      assert %Ecto.Changeset{} = Covenants.change_covenant(covenant)
    end
  end
end
