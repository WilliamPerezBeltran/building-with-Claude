defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
  plug :accepts, ["html"]  # Acepta solo requests HTML (navegador)
  plug :fetch_session  # Lee y carga la sesión (cookies del usuario)
  plug :fetch_live_flash  # Maneja mensajes flash (notificaciones temporales)
  plug :put_root_layout, html: {HelloWeb.Layouts, :root}  # Define el layout base de las páginas HTML
  plug :protect_from_forgery  # Protección contra ataques CSRF
  plug :put_secure_browser_headers  # Agrega headers de seguridad HTTP    | protects form posts from cross-site forgery.
    plug HelloWeb.Plugs.Locale, "en"  # Define el idioma por defecto (locale) |
  plug HelloWeb.Plugs.SetConsole, "pc" 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/hello", HelloController, :index
    get "/chao", ChaoController, :ole_perra
    get "/hello/:messenger", HelloController, :show
    get "/products", ProductController, :index
    get "/product/:id", ProductController, :show
    get "/carros/", ProductController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hello, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HelloWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
