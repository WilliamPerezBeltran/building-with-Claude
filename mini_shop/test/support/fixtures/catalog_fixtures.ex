defmodule MiniShop.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MiniShop.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        name: "some name",
        price: "120.5",
        stock: 42
      })

    {:ok, product} = MiniShop.Catalog.create_product(scope, attrs)
    product
  end
end
