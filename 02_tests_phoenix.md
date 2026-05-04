# Cómo ejecutar tests en Phoenix (Elixir)

En Phoenix (con Ecto), los tests se ejecutan usando ExUnit, el sistema de testing de Elixir.

---

## 1. Ejecutar todos los tests

```bash
mix test
```

Ejecuta toda la suite de pruebas del proyecto.

---

## 2. Ejecutar un archivo específico

```bash
mix test test/app1/accounts_test.exs
```

Permite ejecutar solo los tests de un módulo específico.

---

## 3. Ejecutar un test en una línea específica

```bash
mix test test/app1/accounts_test.exs:15
```

Ejecuta únicamente el test ubicado en la línea indicada.

---

## 4. Estructura de tests

Los tests se encuentran en:

test/

Ejemplos:

test/app1/accounts_test.exs
test/app1_web/controllers/user_controller_test.exs

---

## 5. Ejemplo de test básico

```elixir
defmodule App1.AccountsTest do
  use App1.DataCase

  alias App1.Accounts

  test "crear usuario" do
    {:ok, user} = Accounts.create_user(%{
      name: "Juan",
      email: "juan@test.com"
    })

    assert user.name == "Juan"
  end
end
```

---

## 6. Base de datos para tests

Antes de ejecutar tests:

```bash
mix ecto.create
MIX_ENV=test mix ecto.migrate
```

---

## 7. Flujo típico

```bash
mix ecto.create
mix ecto.migrate
mix test
```

---

## 8. Errores comunes

### Base de datos no existe

database does not exist

Solución:

```bash
mix ecto.create
```

---

### Migraciones faltantes en entorno test

```bash
MIX_ENV=test mix ecto.migrate
```

---

## 9. Resumen

- mix test ejecuta todos los tests
- Puedes ejecutar archivos o líneas específicas
- La base de datos de test debe estar creada y migrada
- ExUnit es el sistema de testing de Elixir
