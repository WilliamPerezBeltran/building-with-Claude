defmodule HelloWeb.CarroController do 
  use HelloWeb, :controller

  def index(conn, params) do
    dbg(params)
    render(conn, :index) 
  end
end



