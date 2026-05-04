defmodule MiniShopWeb.PageController do
  use MiniShopWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
