defmodule Osunsa.AffiliatesTest do
  use Osunsa.DataCase

  alias Osunsa.Affiliates

  describe "affiliates" do
    alias Osunsa.Affiliates.Affiliate

    @valid_attrs %{avatar: "some avatar", correo: "some correo", dni: "some dni", name: "some name", password_hash: "some password_hash"}
    @update_attrs %{avatar: "some updated avatar", correo: "some updated correo", dni: "some updated dni", name: "some updated name", password_hash: "some updated password_hash"}
    @invalid_attrs %{avatar: nil, correo: nil, dni: nil, name: nil, password_hash: nil}

    def affiliate_fixture(attrs \\ %{}) do
      {:ok, affiliate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Affiliates.create_affiliate()

      affiliate
    end

    test "list_affiliates/0 returns all affiliates" do
      affiliate = affiliate_fixture()
      assert Affiliates.list_affiliates() == [affiliate]
    end

    test "get_affiliate!/1 returns the affiliate with given id" do
      affiliate = affiliate_fixture()
      assert Affiliates.get_affiliate!(affiliate.id) == affiliate
    end

    test "create_affiliate/1 with valid data creates a affiliate" do
      assert {:ok, %Affiliate{} = affiliate} = Affiliates.create_affiliate(@valid_attrs)
      assert affiliate.avatar == "some avatar"
      assert affiliate.correo == "some correo"
      assert affiliate.dni == "some dni"
      assert affiliate.name == "some name"
      assert affiliate.password_hash == "some password_hash"
    end

    test "create_affiliate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Affiliates.create_affiliate(@invalid_attrs)
    end

    test "update_affiliate/2 with valid data updates the affiliate" do
      affiliate = affiliate_fixture()
      assert {:ok, %Affiliate{} = affiliate} = Affiliates.update_affiliate(affiliate, @update_attrs)
      assert affiliate.avatar == "some updated avatar"
      assert affiliate.correo == "some updated correo"
      assert affiliate.dni == "some updated dni"
      assert affiliate.name == "some updated name"
      assert affiliate.password_hash == "some updated password_hash"
    end

    test "update_affiliate/2 with invalid data returns error changeset" do
      affiliate = affiliate_fixture()
      assert {:error, %Ecto.Changeset{}} = Affiliates.update_affiliate(affiliate, @invalid_attrs)
      assert affiliate == Affiliates.get_affiliate!(affiliate.id)
    end

    test "delete_affiliate/1 deletes the affiliate" do
      affiliate = affiliate_fixture()
      assert {:ok, %Affiliate{}} = Affiliates.delete_affiliate(affiliate)
      assert_raise Ecto.NoResultsError, fn -> Affiliates.get_affiliate!(affiliate.id) end
    end

    test "change_affiliate/1 returns a affiliate changeset" do
      affiliate = affiliate_fixture()
      assert %Ecto.Changeset{} = Affiliates.change_affiliate(affiliate)
    end
  end
end
