defmodule HelloWeb.CarroController do 
  use HelloWeb, :controller

  def index(conn, params) do
    dbg(params)
    render(conn, :index) 
  end
end






defmodule HelloWeb.ProductController do
  use HelloWeb, :controller

  def index(conn, params) do
    IO.puts("---------------------------------------------")
    dbg(conn)
    IO.puts("---------------------------------------------")
    dbg(params)
   
    render(conn, :index)
  end

  # def show(conn,params)do
  def show(conn,%{"id" => id})do
    #dbg(params)
    #id = params["id"]
    #IO.puts(id)
    dbg(id)

    render(conn,:show, id: id, name: "xbox" )
  end
end
