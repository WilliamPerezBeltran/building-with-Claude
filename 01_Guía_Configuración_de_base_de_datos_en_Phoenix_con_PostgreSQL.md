# Guía: Configuración de base de datos en Phoenix con PostgreSQL

## 1. Introducción

En Phoenix, la base de datos se maneja mediante Ecto, que es la capa que conecta la aplicación con PostgreSQL.

---

## 2. Ubicación de la configuración

La configuración no está en un solo archivo.

### config/dev.exs

Archivo principal en desarrollo:

```elixir
config :app1, App1.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "app1_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

---

### config/config.exs

Define el repositorio:

```elixir
config :app1,
  ecto_repos: [App1.Repo]
```

---

### lib/app1/repo.ex

Define el adaptador:

```elixir
defmodule App1.Repo do
  use Ecto.Repo,
    otp_app: :app1,
    adapter: Ecto.Adapters.Postgres
end
```

---

## 3. Comandos básicos

Crear la base:

```bash
mix ecto.create
```

Migrar:

```bash
mix ecto.migrate
```

---

## 4. Error encontrado

```
FATAL 28P01 (invalid_password)
password authentication failed for user "postgres"
```

## Interpretación

La contraseña configurada en Phoenix no coincide con la del usuario en PostgreSQL.

---

## 5. Soluciones

### Opción 1: Corregir contraseña

Editar `config/dev.exs`:

```elixir
password: "TU_PASSWORD_REAL"
```

---

### Opción 2: Verificar conexión

```bash
psql -U postgres -h localhost
```

---

### Opción 3: Cambiar contraseña

```bash
sudo -u postgres psql
```

```sql
ALTER USER postgres WITH PASSWORD 'postgres';
```

---

### Opción 4: Ejecutar flujo

```bash
mix ecto.create
mix ecto.migrate
```

---

## 6. Interfaces de PostgreSQL

### Consola

* psql

### Interfaz gráfica

* pgAdmin

### Alternativas

* DBeaver
* TablePlus
* DataGrip

---

## 7. Relación con pgAdmin

Se reflejan los cambios si:

* Es el mismo servidor
* Mismo usuario
* Mismo puerto
* La conexión funciona

---

## 8. Estado actual

No verás nada en pgAdmin porque:

* Falló autenticación
* No se creó la base
* No se ejecutaron migraciones

---

## 9. Resultado esperado

Cuando funcione:

* Base: app1_dev
* Schema: public
* Tablas:

  * schema_migrations
  * users

---

## 10. Problemas comunes

* Conectarse a otro servidor
* Puerto incorrecto (default 5432)
* Usuario distinto

---

## 11. Flujo correcto

1. Configurar credenciales
2. Verificar conexión con psql
3. Crear base
4. Migrar
5. Verificar en pgAdmin

---

## 12. Conclusión

El problema es de autenticación en PostgreSQL.
Hasta corregir la contraseña, Phoenix no podrá crear ni migrar la base de datos.

---

