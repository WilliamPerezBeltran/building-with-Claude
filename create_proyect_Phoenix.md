# Crear proyectos con Phoenix (Elixir)

## Instalación del generador

```bash
mix archive.install hex phx_new
```

Este comando instala el generador de proyectos de Phoenix de forma global en tu entorno.

---

## ¿Cuántas veces se ejecuta?

Solo necesitas ejecutarlo **una vez**.

Después de eso, puedes crear todos los proyectos que quieras sin repetir este paso.

---

## Crear nuevos proyectos

```bash
mix phx.new app1
mix phx.new app2
mix phx.new app3
```

---

## Cuándo debes volver a instalarlo

Solo en estos casos:

* Cambias de computadora
* Borras tu entorno (`asdf`, `.mix`, etc.)
* Quieres actualizar Phoenix

Actualizar:

```bash
mix archive.update phx_new
```

---

## Verificar si ya está instalado

```bash
mix help phx.new
```

* Si muestra ayuda → ya está instalado
* Si da error → necesitas instalarlo

---

## Resumen

* `mix archive.install hex phx_new` → una sola vez
* `mix phx.new` → las veces que quieras crear proyectos

