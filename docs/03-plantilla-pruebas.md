# 03. Plantilla de pruebas – ZYRA PALLET

## 1. Objetivo

Documentar los casos de prueba funcionales de ZYRA PALLET para verificar el funcionamiento de sus pantallas, navegación y operaciones con la base de datos.

## 2. Datos de ejecución

- Aplicación: ZYRA PALLET
- Framework: Flutter
- Base de datos: Supabase
- Entorno: Desarrollo local
- Responsable: Equipo de desarrollo
- Estado inicial: Pendiente de ejecución

## 3. Casos de prueba

| ID | Caso de prueba | Tipo | Resultado esperado | Estado |
|---|---|---|---|---|
| CP-01 | Abrir la aplicación | Positiva | Se muestra la pantalla principal | Pendiente |
| CP-02 | Visualizar las opciones del menú | Positiva | Se muestran las opciones principales | Pendiente |
| CP-03 | Acceder a Nuevo Pallet | Positiva | Se abre el formulario de registro | Pendiente |
| CP-04 | Registrar un pallet con datos válidos | Positiva | El pallet queda guardado en Supabase | Pendiente |
| CP-05 | Registrar un pallet con campos obligatorios vacíos | Negativa | Se impide el registro o se muestra una validación | Pendiente |
| CP-06 | Acceder a la búsqueda de pallets | Positiva | Se muestra la pantalla de búsqueda | Pendiente |
| CP-07 | Buscar un pallet existente | Positiva | Se muestran los datos del pallet | Pendiente |
| CP-08 | Buscar un código inexistente | Negativa | Se informa que no se encontraron resultados | Pendiente |
| CP-09 | Consultar la lista de pallets | Positiva | Se muestran los registros disponibles | Pendiente |
| CP-10 | Consultar los movimientos | Positiva | Se muestran los movimientos disponibles | Pendiente |

## 4. Registro individual de resultados

Para cada caso ejecutado se debe registrar:

- Fecha de ejecución.
- Identificador del caso.
- Datos utilizados.
- Resultado obtenido.
- Resultado esperado.
- Estado: Aprobado o Fallido.
- Evidencia mediante captura de pantalla, cuando corresponda.

## 5. Pruebas automatizadas

| ID | Prueba | Archivo | Estado |
|---|---|---|---|
| PA-01 | Verificar la pantalla principal | test/widget/widget_test.dart | Aprobada |
| PA-02 | Prueba unitaria de una función de la aplicación | test/unit/ | Pendiente |

## 6. Análisis estático

| Herramienta | Comando | Resultado |
|---|---|---|
| Flutter Analyze | flutter analyze | Sin problemas detectados |

## 7. Observaciones

Los casos funcionales se marcarán como aprobados o fallidos únicamente después de ejecutarlos y comprobar sus resultados.

Las pruebas relacionadas con Firebase se documentarán después de integrar y verificar el servicio.