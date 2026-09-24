# Gestor de Tareas Personales

Aplicación móvil desarrollada con **Flutter** como parte del **Reto 1 de Pragma**.

El proyecto consiste en una aplicación CRUD para gestionar tareas personales utilizando **Riverpod 3** para el manejo de estado y **SharedPreferences** para la persistencia local.

La aplicación funciona completamente de manera local y no requiere conexión a un backend.

---

## 🎯 Objetivo

Construir una aplicación de gestión de tareas que permita al usuario:

- Crear tareas.
- Visualizar sus tareas.
- Consultar el detalle de una tarea.
- Editar tareas existentes.
- Eliminar tareas.
- Marcar y desmarcar tareas como completadas.
- Filtrar tareas por estado.
- Mantener la información almacenada después de cerrar la aplicación.

---

## ✨ Funcionalidades

### Gestión de tareas

- [x] Crear una tarea.
- [x] Listar tareas.
- [x] Consultar el detalle de una tarea.
- [x] Editar una tarea.
- [x] Eliminar una tarea con confirmación.
- [x] Marcar una tarea como completada.
- [x] Desmarcar una tarea.
- [x] Filtrar tareas entre todas, pendientes y completadas.
- [x] Mostrar un estado vacío cuando no existan tareas.

### Formularios

- [x] Formulario para crear tareas.
- [x] Formulario reutilizado para editar tareas.
- [x] Validación del título.
- [x] Manejo de estados durante el guardado.
- [x] Indicador visual mientras se guarda una tarea.

### Persistencia

- [x] Guardar tareas localmente.
- [x] Recuperar tareas al iniciar la aplicación.
- [x] Mantener la información después de cerrar y volver a abrir la aplicación.

### Experiencia de usuario

- [x] Interfaz basada en Material 3.
- [x] Diseño visual consistente.
- [x] Indicador de progreso de tareas.
- [x] Estados visuales para tareas pendientes y completadas.
- [x] Confirmación antes de eliminar.
- [x] Estados de carga y error.
- [x] Empty state personalizado.
- [x] Filtros rápidos por estado.
- [x] Feedback visual durante las acciones principales.

---

## 🛠️ Tecnologías

- **Flutter** — Framework para desarrollo multiplataforma.
- **Dart** — Lenguaje de programación.
- **Riverpod 3** — Manejo de estado y operaciones de la aplicación.
- **SharedPreferences** — Persistencia local.
- **Material 3** — Sistema de diseño utilizado como base para la interfaz.

No se utilizan servicios externos ni backend para la gestión de las tareas.

---

## 🏗️ Arquitectura

El proyecto utiliza una arquitectura organizada por funcionalidades (**feature-based architecture**) y separa las responsabilidades en capas.

```text
lib/
│
├── app/
│   └── app.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   └── theme/
│
├── features/
│   └── tasks/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   └── repositories/
│       │
│       └── presentation/
│           ├── pages/
│           ├── providers/
│           └── widgets/
│
└── main.dart
```

### Capas principales

#### Presentation

Contiene las pantallas, widgets y providers/notifiers utilizados para manejar el estado y la interacción con el usuario.

#### Domain

Contiene las entidades y contratos de repositorio relacionados con las tareas.

Esta capa no depende de detalles relacionados con el almacenamiento.

#### Data

Contiene los modelos, fuentes de datos locales y la implementación concreta de los repositorios.

---

## 🔄 Flujo de datos

Las operaciones de la aplicación siguen el siguiente flujo:

```text
UI
 ↓
Riverpod / TaskNotifier
 ↓
TaskRepository
 ↓
TaskLocalDataSource
 ↓
SharedPreferences
```

Esto permite mantener separada la interfaz de usuario de la implementación utilizada para almacenar los datos.

---

## 📱 Pantallas

### Lista de tareas

Pantalla principal de la aplicación.

Permite:

- Visualizar las tareas.
- Consultar el progreso general.
- Filtrar tareas.
- Marcar tareas como completadas.
- Acceder al detalle.
- Editar tareas.
- Eliminar tareas.
- Crear nuevas tareas.

### Detalle de tarea

Muestra información completa de la tarea:

- Título.
- Descripción.
- Estado.
- Fecha de creación.
- Fecha de última actualización.

### Crear / Editar tarea

Formulario reutilizable para:

- Crear nuevas tareas.
- Editar tareas existentes.
- Validar la información ingresada.
- Mostrar el estado de guardado.

---

## 🎨 Diseño y experiencia de usuario

La aplicación utiliza una interfaz enfocada en productividad, simplicidad y claridad visual.

Entre los elementos principales se incluyen:

- Cards con bordes redondeados.
- Sistema visual consistente.
- Indicadores de estado.
- Resumen de progreso.
- Filtros rápidos.
- Estados vacíos personalizados.
- Feedback visual para acciones importantes.
- Confirmación antes de eliminar información.
- Estados de carga y error.
- Formularios con validación.
- Diseño basado en Material 3.

---

## 📦 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/juanes030/gestor-tareas-personales.git
```

### 2. Entrar al proyecto

```bash
cd gestor-tareas-personales
```

### 3. Instalar dependencias

```bash
flutter pub get
```

### 4. Ejecutar la aplicación

```bash
flutter run
```

---

## 🧪 Testing

Se contemplan pruebas automatizadas para validar:

- Operaciones CRUD.
- Validaciones de formularios.
- Manejo del estado.
- Persistencia local.
- Comportamiento de los componentes principales.

Las pruebas automatizadas son una etapa de mejora posterior a la implementación funcional de la aplicación.

---

## 🔍 Análisis del proyecto

Para verificar problemas de análisis estático:

```bash
flutter analyze
```

El proyecto debe mantenerse sin errores de análisis antes de realizar una entrega.

---

## 📸 Capturas

Las capturas de pantalla de la aplicación pueden incluir:

- Lista de tareas.
- Crear tarea.
- Editar tarea.
- Detalle de tarea.
- Tareas completadas.
- Estado vacío.

---

## 🎥 Demo

La demo puede mostrar el siguiente flujo:

1. Crear una tarea.
2. Visualizarla en la lista.
3. Consultar su detalle.
4. Editar la tarea.
5. Marcarla como completada.
6. Filtrar tareas.
7. Eliminar una tarea.
8. Cerrar y volver a abrir la aplicación.
9. Comprobar la persistencia de los datos.

---

## 📚 Reto

Proyecto desarrollado como parte de:

**FASE 1 — Aplicación CRUD con almacenamiento local**

### Objetivos de aprendizaje

- Construcción de interfaces en Flutter.
- Arquitectura organizada por funcionalidades.
- Navegación entre pantallas.
- Formularios y validaciones.
- Manejo de estado con Riverpod 3.
- Persistencia local.
- Implementación de operaciones CRUD.
- Diseño y experiencia de usuario.
- Separación de responsabilidades mediante Repository Pattern.

---

## 🚀 Estado del proyecto

El proyecto cuenta con todas las funcionalidades principales solicitadas para el Reto 1 y se encuentra en etapa de revisión y mejora de calidad.

### Funcionalidades completadas

- CRUD completo de tareas.
- Persistencia local.
- Manejo de estado con Riverpod 3.
- Navegación entre pantallas.
- Filtros de tareas.
- Validaciones.
- Estados de carga y error.
- Diseño visual personalizado.
- Empty state.
- Detalle de tareas.

### Próximas mejoras

- Agregar pruebas automatizadas.
- Incorporar capturas de pantalla.
- Preparar una demo de la aplicación.
- Realizar revisión final de código y arquitectura.

---

## 👨‍💻 Autor

**Juan Esteban Alvarez Ruiz**
