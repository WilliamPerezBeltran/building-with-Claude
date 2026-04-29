# Elixir Setup vs Ruby Setup (Guía Básica)

## 📦 1. ¿Qué se hizo?

### Elixir

```bash
mix local.hex
```

* Instala **Hex** (gestor de paquetes de Elixir)
* Permite descargar dependencias

```bash
mix archive.install hex phx_new
```

* Instala el generador de Phoenix
* Habilita el comando:

```bash
mix phx.new my_app
```

---

## 🧠 Equivalente en Ruby

### Ruby

```bash
gem install bundler
```

* Instala Bundler (gestor de dependencias)

```bash
gem install rails
```

* Instala Rails (framework web)

```bash
rails new my_app
```

* Genera un proyecto completo

---

## ⚖️ Comparación directa

| Concepto        | Elixir  | Ruby           |
| --------------- | ------- | -------------- |
| Gestor de build | mix     | rake / bundler |
| Gestor paquetes | Hex     | RubyGems       |
| Archivo deps    | mix.exs | Gemfile        |
| Framework web   | Phoenix | Rails          |

---

##  Flujo completo

### Elixir ->  Ruby

```bash
# Elixir
mix local.hex --------------------> gem install bundler
mix archive.install hex phx_new --> gem install rails
mix phx.new my_app----------------> rails new my_app
cd my_app ------------------------> cd my_app
mix deps.get ---------------------> bundle install
mix phx.server -------------------> rails server
```

---

##  Diferencias clave

### Elixir

* Herramientas más modulares
* Todo pasa por `mix`
* Basado en concurrencia (Erlang VM)

### Ruby

* Herramientas más globales
* Rails instala todo de una vez
* Enfoque más tradicional (request/response)

---

##  Resumen rápido

* `mix local.hex` = instalar gestor de paquetes
* `mix archive.install` = instalar generador
* `mix phx.new` = crear proyecto

Equivalente en Ruby:

* `gem install` = instalar herramientas
* `rails new` = crear proyecto

---

##  Conclusión

Elixir + Phoenix sigue una filosofía más modular y funcional.
Ruby + Rails es más directo y opinionado.

Ambos logran lo mismo, pero con enfoques diferentes.

