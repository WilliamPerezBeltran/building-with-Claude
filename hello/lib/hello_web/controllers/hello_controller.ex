defmodule HelloWeb.HelloController do 
    use HelloWeb, :controller

    def index(conn, _params) do 
        render(conn, :index)
    end
    
    def show(conn, %{"messenger" => messenger} = params) do
        IO.puts("----------")
        IO.puts("----------")
        IO.puts(inspect(conn))
        IO.puts("----------")
        IO.puts("----------")
        IO.puts("----------")
       
        IO.puts("----------")
        IO.puts("----------")
        IO.puts("""
        Verb: #{inspect(params)} 
        Verb: #{inspect(conn.method)} 
        host: #{inspect(conn.host)} 
        Verb: #{inspect(conn.req_headers)} 
        """
        )
        render(conn, :show, messenger: messenger)
    end
end














