defmodule HelloWeb.ChaoController do 
    use HelloWeb, :controller

    def ole_perra(conn, _params) do 
        render(conn, :chao_como_funcion)
    end
end
