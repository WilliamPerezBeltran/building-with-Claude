defmodule HelloWeb.ProductController do
  use HelloWeb, :controller

  def index(conn, params) do
    dbg(conn)
    dbg(params)
   
    render(conn, :index)
    #redirect(to: ~p"wrong")
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
