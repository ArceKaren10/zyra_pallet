# ZYRA PALLET

Sistema de gestión y seguimiento de pallets desarrollado con Flutter y Supabase.

## Descripción del proyecto

ZYRA PALLET es una aplicación diseñada para facilitar la gestión de pallets dentro de operaciones logísticas y de transporte.

Permite registrar información de los pallets y consultar sus datos mediante una interfaz sencilla.

## Funcionalidades

- Registro de nuevos pallets.
- Almacenamiento de información en Supabase.
- Consulta y búsqueda de pallets.
- Visualización de movimientos.
- Gestión de información logística.

*Nota: algunas funcionalidades están en proceso de validación.*

## Tecnologías utilizadas

- Flutter
- Dart
- Supabase
- Firebase (configuración inicial pendiente de integración funcional).

## Estructura del proyecto

```text
zyra_pallet/
├── android/
├── lib/
├── test/
├── docs/
│   ├── 01-declaracion-alcance.md
│   ├── 02-mapa-flujos-criticos.md
│   ├── 03-plantilla-pruebas.md
│   ├── 04-registro-incidencias.md
│   ├── 05-reflexion-final.md
│   └── evidencias/
├── pubspec.yaml
└── README.md
```

## Instalación

1. Clonar el repositorio.
2. Abrir la carpeta del proyecto.
3. Instalar las dependencias:

```bash
flutter pub get
```

4. Configurar las credenciales de Supabase localmente.
5. Ejecutar la aplicación:

```bash
flutter run
```

## Pruebas y análisis

Para analizar el código:

```bash
flutter analyze
```

Para ejecutar las pruebas automatizadas:

```bash
flutter test
```

## Documentación

La documentación de la práctica se encuentra en la carpeta `docs/`.

## Estado del proyecto

Proyecto en desarrollo, con integración de Supabase y validación de funcionalidades.

## Autora

Karen Arce

Proyecto académico – Ingeniería en Sistemas Informáticos.