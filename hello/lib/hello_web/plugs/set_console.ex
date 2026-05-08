defmodule HelloWeb.Plugs.SetConsole do
  import Plug.Conn

  # Consolas válidas permitidas en la app
  @valid_consoles ["nintendo", "pc", "playstation", "xbox"]

  # Tiempo de vida de la cookie (30 días en segundos)
  @thirty_days_in_seconds 2_592_000

  # Valor por defecto cuando el plug se inicializa
  def init(default_console), do: default_console

  # 1. Caso: viene ?console=valor válido en la URL
  def call(%Plug.Conn{params: %{"console" => console}} = conn, _default_console)
      when console in @valid_consoles do

    conn
    |> assign(:console, console)
    |> put_resp_cookie("console", console, max_age: @thirty_days_in_seconds)
  end

  # 2. Caso: no viene en params, pero sí existe cookie válida
  def call(%Plug.Conn{cookies: %{"console" => console}} = conn, _default_console)
      when console in @valid_consoles do

    conn
    |> assign(:console, console)
  end

  # 3. Caso: no viene ni en params ni cookie válida → usar default
  def call(%Plug.Conn{} = conn, default_console) do
    conn
    |> assign(:console, default_console)
    |> put_resp_cookie("console", default_console, max_age: @thirty_days_in_seconds)
  end
end