defmodule HelloWeb.AuthController do
  use HelloWeb, :controller

  def login_page(conn,_params) do 
    render(conn,:login)
  end

  def login(conn,%{"username" => username, "password" => password}) do 
    if username == "admin" and password == "1234" do 
      conn
      |> put_session(:user, username)
      |> put_flash(:info, "Wellcome")
      |> redirect(to: "/dashboard")
    else
      conn
      |> put_flash(:error, "Error in Credentials")
      |> redirect(to: "/login")
    end
  end

  def logout(conn, _params) do 
    conn
    |> clear_session()
    |> redirect(to: "/login")
  end


end
