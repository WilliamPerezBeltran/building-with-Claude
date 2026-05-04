defmodule MiniShop.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :price, :decimal
    field :stock, :integer
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs, user_scope) do
    product
    |> cast(attrs, [:name, :price, :stock])
    |> validate_required([:name, :price, :stock])
    |> put_change(:user_id, user_scope.user.id)
  end
end
