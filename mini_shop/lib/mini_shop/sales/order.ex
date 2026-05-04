defmodule MiniShop.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do

    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [])
    |> validate_required([])
  end
end
