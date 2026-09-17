# Gestor de Tareas Personales

Aplicación móvil desarrollada en Flutter como parte del **Reto 1 de Pragma**.

El objetivo del proyecto es construir una aplicación CRUD completa utilizando **Flutter, Riverpod 3 y almacenamiento local**, permitiendo gestionar tareas personales sin necesidad de conexión a un backend.

## 🎯 Objetivo

Construir una aplicación que permita:

* Crear tareas.
* Visualizar una lista de tareas.
* Consultar el detalle de una tarea.
* Editar tareas existentes.
* Eliminar tareas.
* Marcar tareas como completadas.
* Mantener la información almacenada aunque la aplicación se cierre.

## ✨ Funcionalidades

### Gestión de tareas

* [ ] Crear una tarea.
* [ ] Listar tareas.
* [ ] Ver detalle de una tarea.
* [ ] Editar una tarea.
* [ ] Eliminar una tarea.
* [ ] Marcar una tarea como completada.
* [ ] Mostrar estado vacío cuando no existan tareas.

### Formularios

* [ ] Formulario para crear tareas.
* [ ] Formulario para editar tareas.
* [ ] Validaciones básicas.
* [ ] Manejo correcto de estados del formulario.

### Persistencia

* [ ] Guardar tareas localmente.
* [ ] Recuperar tareas al iniciar la aplicación.
* [ ] Mantener la información después de cerrar la aplicación.

## 🛠️ Tecnologías

* **Flutter**
* **Dart**
* **Riverpod 3** — Manejo de estado.
* **SharedPreferences** — Persistencia local.

## 🏗️ Arquitectura

El proyecto utiliza una arquitectura organizada por funcionalidades (**feature-based architecture**), separando las responsabilidades en capas.

```text
lib/
│
├── app/
│   ├── app.dart
│   └── router/
│       └── app_router.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   └── theme/
│
├── features/
│   └── tasks/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart
```

### Capas principales

**Presentation**

Contiene las pantallas, widgets y providers/notifiers utilizados para manejar el estado de la interfaz.

**Domain**

Contiene las entidades y contratos de repositorio relacionados con las tareas.

**Data**

Contiene los modelos, fuentes de datos locales y la implementación de los repositorios.

El flujo principal de datos será:

```text
UI
 ↓
Riverpod
 ↓
Repository
 ↓
Local Data Source
 ↓
SharedPreferences
```

## 📱 Pantallas

La aplicación contará inicialmente con las siguientes pantallas:

### Lista de tareas

Pantalla principal donde el usuario podrá:

* Ver sus tareas.
* Marcar tareas como completadas.
* Acceder al detalle.
* Editar tareas.
* Eliminar tareas.
* Crear una nueva tarea.

### Detalle de tarea

Muestra la información completa de una tarea seleccionada.

### Crear / Editar tarea

Formulario utilizado para crear nuevas tareas y modificar tareas existentes.

## 📦 Instalación

Clonar el repositorio:

```bash
git clone <REPOSITORY_URL>
```

Entrar al proyecto:

```bash
cd gestor_tareas_personales
```

Instalar las dependencias:

```bash
flutter pub get
```

Ejecutar la aplicación:

```bash
flutter run
```

## 🧪 Testing

Los tests se irán agregando durante el desarrollo para validar principalmente:

* Operaciones CRUD.
* Validaciones.
* Manejo del estado.
* Persistencia local.
* Comportamiento de los componentes principales.

## 📸 Capturas

Las capturas de pantalla se agregarán una vez finalizada la implementación de la aplicación.

## 🎥 Demo

Se agregará un video demostrativo mostrando:

1. Creación de una tarea.
2. Listado de tareas.
3. Consulta del detalle.
4. Edición de una tarea.
5. Marcado como completada.
6. Eliminación de una tarea.
7. Persistencia después de cerrar y volver a abrir la aplicación.

## 📚 Reto

Proyecto desarrollado como parte de la:

**FASE 1 — Aplicación CRUD con almacenamiento local**

### Objetivos de aprendizaje

* Construcción de pantallas en Flutter.
* Navegación.
* Formularios.
* Validaciones.
* Manejo de estado con Riverpod 3.
* Persistencia local.
* Implementación de un flujo CRUD completo.

## 👨‍💻 Autor

**Juan Esteban Alvarez Ruiz**
