# 🧱 Mini Shop — Phoenix (Proyecto Completo)

Proyecto completo para aprender Phoenix en nivel real:

Incluye:
- Accounts (Auth)
- Catalog (productos)
- Sales (órdenes)
- Relaciones Ecto
- LiveView CRUD
- Testing básico

---

# 1. Crear proyecto

```bash
mix phx.new mini_shop --database postgres
cd mini_shop
mix ecto.create
```

---

# 2. Auth (Accounts)

```bash
mix phx.gen.auth Accounts User users
mix ecto.migrate
```

Incluye:
- registro
- login/logout
- sesiones
- hash password (bcrypt)
- protección de rutas

---

# 3. Contextos del sistema

## 📦 Accounts
Usuarios + autenticación

## 🛒 Catalog
Productos

## 🧾 Sales
Órdenes y items

---

# 4. Catalog (Productos + LiveView CRUD)

```bash
mix phx.gen.live Catalog Product products name:string price:decimal stock:integer
mix ecto.migrate
```

---

## Router

```elixir
scope "/", MiniShopWeb do
  pipe_through [:browser, :require_authenticated_user]

  live "/products", ProductLive.Index, :index
  live "/products/new", ProductLive.Form, :new
  live "/products/:id/edit", ProductLive.Form, :edit
end
```

---

# 5. Sales (órdenes + relaciones Ecto)

```bash
mix phx.gen.context Sales Order orders user_id:references:users
mix phx.gen.context Sales OrderItem order_items order_id:references:orders product_id:references:products quantity:integer price:decimal
mix ecto.migrate
```

---

## Relaciones Ecto

### Order
```elixir
schema "orders" do
  belongs_to :user, MiniShop.Accounts.User
  has_many :order_items, MiniShop.Sales.OrderItem

  timestamps()
end
```

### OrderItem
```elixir
schema "order_items" do
  belongs_to :order, MiniShop.Sales.Order
  belongs_to :product, MiniShop.Catalog.Product

  field :quantity, :integer
  field :price, :decimal

  timestamps()
end
```

---

# 6. LiveView CRUD

Generado con:
```bash
mix phx.gen.live
```

---

# 7. Testing básico

```elixir
test "create_product/1 works" do
  attrs = %{
    name: "Laptop",
    price: "1000.00",
    stock: 5
  }

  assert {:ok, product} = Catalog.create_product(attrs)
  assert product.name == "Laptop"
end
```

---

# 8. Arquitectura final

Accounts -> User  
Catalog -> Product  
Sales -> Order / OrderItem  

User ──< Order ──< OrderItem >── Product
