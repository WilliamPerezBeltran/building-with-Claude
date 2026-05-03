defmodule App1Web.PageController do
  use App1Web, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
