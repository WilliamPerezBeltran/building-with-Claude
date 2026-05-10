defmodule HelloWeb.PracticeController do
  use HelloWeb, :controller

  def index(conn, params) do
    dbg(params)
    render(conn, :index)
    #redirect(to: ~p"wrong")
  end

end
