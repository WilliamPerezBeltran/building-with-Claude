# Phoenix (Ecto) – Comandos organizados

## 1. Crear proyecto y dependencias

| Comando | Explicación |
|--------|-------------|
| `mix phx.new app1` | Crea una nueva aplicación Phoenix con estructura completa. |
| `mix deps.get` | Descarga e instala dependencias. |

---

## 2. Base de datos

| Comando | Explicación |
|--------|-------------|
| `mix ecto.create` | Crea la base de datos configurada en `dev.exs`. |
| `mix ecto.migrate` | Ejecuta migraciones pendientes. |
| `mix ecto.rollback` | Revierte la última migración. |
| `mix ecto.reset` | Borra DB, la crea de nuevo y ejecuta migraciones. |

---

## 3. Generación de código (Phoenix generators)

| Comando | Explicación |
|--------|-------------|
| `mix phx.gen.html Accounts User users name:string email:string` | Genera CRUD completo (contexto, schema, controlador, vistas, migración). |
| `mix phx.gen.schema Accounts.User users name:string email:string` | Genera solo schema (modelo) + migración. |
| `mix phx.gen.context Accounts User users name:string email:string` | Genera contexto + schema + migración (sin UI). |

---

## 4. Migraciones

| Comando | Explicación |
|--------|-------------|
| `mix ecto.gen.migration create_users` | Crea archivo de migración vacío. |
| `mix ecto.migrate` | Ejecuta migraciones nuevas. |

---

## 5. Ejecución del sistema

| Comando | Explicación |
|--------|-------------|
| `mix phx.server` | Levanta el servidor web en `http://localhost:4000`. |
| `iex -S mix` | Abre consola interactiva con la app cargada. |

---
