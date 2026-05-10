defmodule HelloWeb.Plugs.AuthPlug do 
  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts
    
  def call(conn,_opts) do 
    user = get_session(conn, :user)

    if user do 
      conn
    else
      conn
      |> put_flash(:error, "Debes iniciiar session")
      |> redirect(to: "/login")
      |> halt()
    end
  end
end
