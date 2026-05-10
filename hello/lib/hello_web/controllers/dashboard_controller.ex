defmodule HelloWeb.DashboardController do 
  use HelloWeb, :controller

  def index(conn,_params) do 
    user = get_session(conn, :user)

    render(conn, :index, user: user)
  end
end

