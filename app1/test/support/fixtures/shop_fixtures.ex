defmodule App1.ShopFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Shop` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 120.5,
        stock: 42
      })
      |> App1.Shop.create_product()

    product
  end
end
