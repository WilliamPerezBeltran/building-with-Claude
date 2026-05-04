defmodule MiniShop.Repo do
  use Ecto.Repo,
    otp_app: :mini_shop,
    adapter: Ecto.Adapters.Postgres
end
