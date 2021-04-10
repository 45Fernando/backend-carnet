defmodule Carnet.AffiliatesCovenantsTest do
  use Carnet.DataCase

  alias Carnet.AffiliatesCovenants

  describe "affiliatescovenants" do
    alias Carnet.AffiliatesCovenants.AffiliateCovenant

    @valid_attrs %{fecha_alta: ~D[2010-04-17], fecha_baja: ~D[2010-04-17]}
    @update_attrs %{fecha_alta: ~D[2011-05-18], fecha_baja: ~D[2011-05-18]}
    @invalid_attrs %{fecha_alta: nil, fecha_baja: nil}

    def affiliate_covenant_fixture(attrs \\ %{}) do
      {:ok, affiliate_covenant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AffiliatesCovenants.create_affiliate_covenant()

      affiliate_covenant
    end

    test "list_affiliatescovenants/0 returns all affiliatescovenants" do
      affiliate_covenant = affiliate_covenant_fixture()
      assert AffiliatesCovenants.list_affiliatescovenants() == [affiliate_covenant]
    end

    test "get_affiliate_covenant!/1 returns the affiliate_covenant with given id" do
      affiliate_covenant = affiliate_covenant_fixture()
      assert AffiliatesCovenants.get_affiliate_covenant!(affiliate_covenant.id) == affiliate_covenant
    end

    test "create_affiliate_covenant/1 with valid data creates a affiliate_covenant" do
      assert {:ok, %AffiliateCovenant{} = affiliate_covenant} = AffiliatesCovenants.create_affiliate_covenant(@valid_attrs)
      assert affiliate_covenant.fecha_alta == ~D[2010-04-17]
      assert affiliate_covenant.fecha_baja == ~D[2010-04-17]
    end

    test "create_affiliate_covenant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AffiliatesCovenants.create_affiliate_covenant(@invalid_attrs)
    end

    test "update_affiliate_covenant/2 with valid data updates the affiliate_covenant" do
      affiliate_covenant = affiliate_covenant_fixture()
      assert {:ok, %AffiliateCovenant{} = affiliate_covenant} = AffiliatesCovenants.update_affiliate_covenant(affiliate_covenant, @update_attrs)
      assert affiliate_covenant.fecha_alta == ~D[2011-05-18]
      assert affiliate_covenant.fecha_baja == ~D[2011-05-18]
    end

    test "update_affiliate_covenant/2 with invalid data returns error changeset" do
      affiliate_covenant = affiliate_covenant_fixture()
      assert {:error, %Ecto.Changeset{}} = AffiliatesCovenants.update_affiliate_covenant(affiliate_covenant, @invalid_attrs)
      assert affiliate_covenant == AffiliatesCovenants.get_affiliate_covenant!(affiliate_covenant.id)
    end

    test "delete_affiliate_covenant/1 deletes the affiliate_covenant" do
      affiliate_covenant = affiliate_covenant_fixture()
      assert {:ok, %AffiliateCovenant{}} = AffiliatesCovenants.delete_affiliate_covenant(affiliate_covenant)
      assert_raise Ecto.NoResultsError, fn -> AffiliatesCovenants.get_affiliate_covenant!(affiliate_covenant.id) end
    end

    test "change_affiliate_covenant/1 returns a affiliate_covenant changeset" do
      affiliate_covenant = affiliate_covenant_fixture()
      assert %Ecto.Changeset{} = AffiliatesCovenants.change_affiliate_covenant(affiliate_covenant)
    end
  end
end
