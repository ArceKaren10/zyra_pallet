# 04. Registro de incidencias – ZYRA PALLET

## 1. Objetivo

Registrar los errores y problemas detectados durante el desarrollo, integración y pruebas de la aplicación ZYRA PALLET.

## 2. Incidencias detectadas

### INC-001 – Referencia incorrecta en prueba de widget

- **Severidad:** Media
- **Prioridad:** Alta
- **Origen:** Prueba automatizada de widget.
- **Descripción:** La prueba hacía referencia a una clase llamada MyApp que no existía en el proyecto.
- **Causa:** Diferencia entre el nombre de la clase principal de la aplicación y el utilizado en el archivo de pruebas.
- **Corrección:** Se actualizó la prueba para utilizar ZyraPalletApp.
- **Estado:** Corregida.
- **Reprueba:** Aprobada. `flutter test` finalizó correctamente.

### INC-002 – Uso de propiedad obsoleta en DropdownButtonFormField

- **Severidad:** Baja
- **Prioridad:** Media
- **Origen:** Análisis estático de Flutter.
- **Descripción:** Flutter informó que la propiedad `value` estaba obsoleta.
- **Causa:** Uso de una propiedad antigua del componente.
- **Corrección:** Se sustituyó `value: _stato` por `initialValue: _stato`.
- **Estado:** Corregida.
- **Reprueba:** Aprobada. `flutter analyze` no detectó problemas.

### INC-003 – Pendiente de detección durante las pruebas funcionales

- **Severidad:** Pendiente de determinar.
- **Prioridad:** Pendiente de determinar.
- **Origen:** Pruebas funcionales.
- **Descripción:** Se reservará este registro para documentar una tercera incidencia real detectada durante la ejecución de los casos de prueba.
- **Causa:** Pendiente de análisis.
- **Corrección:** Pendiente.
- **Estado:** Pendiente de ejecución.

## 3. Resumen

| Incidencia | Estado |
|---|---|
| INC-001 | Corregida y aprobada en la reprueba |
| INC-002 | Corregida y aprobada en la reprueba |
| INC-003 | Pendiente de detección |

## 4. Observaciones

Las incidencias deben estar respaldadas por resultados de pruebas o evidencias. No se deben registrar errores hipotéticos como si ya hubieran ocurrido.