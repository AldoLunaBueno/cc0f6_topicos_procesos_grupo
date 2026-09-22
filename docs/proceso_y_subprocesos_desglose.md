# Procedimiento Administrativo de Matrícula Regular de Estudiantes - UNI

## 1. Visión General del Proceso

La integración de los 4 subprocesos para conformar el Proceso de Matrícula Regular de la Universidad Nacional de Ingeniería (UNI) responde a una cadena de valor secuencial y causal, donde la salida (*output*) de cada subproceso se convierte en la entrada (*input*) indispensable del siguiente. Asimismo, cuenta con bucles de control y realimentación (*feedback loops*) respaldados por la infraestructura sociotécnica del sistema (SIGA-ORCE / Intranet DIRCE).

---

### 1.1. Esquema de Transferencia de Entradas y Salidas (Handoffs)

```text
[ ESTUDIANTE / REQUISITOS INICIALES ]
                 │
                 ▼
┌────────────────────────────────────────────────────────┐
│  1. SUBPROCESO DE ACREDITACIÓN Y PRE-REQUISITOS        │
│  - Valida: Autoseguro, deudas y actas de notas         │
└────────────────────────┬───────────────────────────────┘
                         │ ─── Salida: Estudiante Habilitado y Turno Asignado
                         ▼
┌────────────────────────────────────────────────────────┐
│  2. SUBPROCESO DE SELECCIÓN Y REGISTRO DE CURSOS       │
│  - Selecciona: Asignaturas, secciones y cupos          │
└────────────────────────┬───────────────────────────────┘
                         │ ─── Salida: Pre-Ficha de Matrícula Registrada
                         ▼
┌────────────────────────────────────────────────────────┐
│  3.A SUBPROCESO DE VERIFICACIÓN Y CONTROL DE REGLAS    │
│  - Audita: Prerrequisitos, Grupo Cero y Solicitudes    │
└────────────────────────┬───────────────────────────────┘
                         │ ─── Salida: Pre-Ficha Aprobada / Dictamen de Rectificación
                         ▼
┌────────────────────────────────────────────────────────┐
│  3.B SUBPROCESO DE CONFIRMACIÓN Y REGISTRO OFICIAL     │
│  - Asienta: Transacción final en base de datos ORCE    │
└────────────────────────┬───────────────────────────────┘
                         │
                         ▼
[ MATRÍCULA OFICIALIZADA / BOLETA Y REPORTES SUNEDU ]
```

---

### 1.2. Articulación de la Cadena de Valor

#### De Subproceso 1 a Subproceso 2: Habilitación Operativa

* **Desencadenante (*Trigger*):** El estudiante cancela el autoseguro médico estudiantil y salda deudas en su respectiva Facultad.
* **Transferencia (*Handoff*):** El Subproceso 1 procesa la información junto al promedio ponderado consolidado y genera como salida la condición de **Habilitado** y la **Asignación del Turno de Atención**.
* **Impacto en el Subproceso 2:** Sin esta salida, la Intranet DIRCE mantiene bloqueado el acceso al Subproceso 2, impidiendo al estudiante visualizar la oferta de asignaturas o reservar vacantes.

#### De Subproceso 2 a Subproceso 3.A: Propuesta vs. Reglas

* **Desencadenante:** El estudiante selecciona sus asignaturas dentro del límite crediticio autorizado y envía su propuesta a través del portal.
* **Transferencia (*Handoff*):** El Subproceso 2 emite la **Pre-Ficha de Matrícula Registrada**, la cual contiene una reserva temporal de vacantes en el sistema.
* **Impacto en el Subproceso 3.A:** La Pre-Ficha ingresa a la etapa de auditoría e inspección donde se confronta con las matrices de prerrequisitos, los padrones del Grupo Cero (riesgo académico) y las solicitudes de rectificación por cruces o cupos.

#### De Subproceso 3.A a Subproceso 3.B: Auditoría y Calidad

* **Desencadenante:** La Comisión de Matrícula y la Dirección de Escuela evalúan la Pre-Ficha y resuelven las solicitudes de rectificación presentadas.
* **Transferencia (*Handoff*):** El Subproceso 3.A emite la **Pre-Ficha Aprobada o Subsanada**, acompañada de las resoluciones de inclusión/exclusión de asignaturas.
* **Impacto en el Subproceso 3.B:** Transforma una propuesta temporal en una carga académica validada administrativamente, lista para ser asentada con valor legal.

#### Cierre en Subproceso 3.B: Salida Final del proceso

* **Resultado definitivo:** El Subproceso 3.B ejecuta el cierre transaccional en el SIGA-ORCE.
* **Salida del cliente/usuario:** Emisión de la **Boleta de Matrícula Oficial** visada por la Oficina de Estadística de la Facultad, entrega de padrones de clase a los docentes y transferencia de la información consolidada a SUNEDU y MINEDU.

---

### 1.3. Mecanismos de Control y Bucles de Realimentación (Feedback Loops)

* **Bucle de Excepción por Solicitudes (3.A $\circlearrowleft$ 2):** Si el estudiante encuentra secciones agotadas o cruces de horario en el Subproceso 2, no puede culminar su matrícula de manera regular. Se activa un bucle hacia el Subproceso 3.A mediante el Formulario Digital de Solicitudes, donde la Escuela Profesional evalúa la ampliación de vacantes o ajustes de oferta, retornando la Pre-Ficha corregida para su posterior confirmación.
* **Bucle de Invalidación por Sanción (3.A $\circlearrowleft$ 1):** Si durante la auditoría del Subproceso 3.A se detecta que el estudiante incurrió en una tercera o cuarta desaprobación no identificada en la etapa inicial por rezago en actas, el sistema anula la Pre-Ficha del Subproceso 2 y regresa al estudiante al Subproceso 1 bajo condición de suspensión temporal o inhabilitación administrativa.

---

### 1.4. Dimensión Proceso vs. Sistema de Información

* **El Proceso de Negocio (Lógica de Trabajo):** Define la secuencia procedimental, las responsabilidades de los actores (Estudiante, Comisión de Matrícula, Dirección de Escuela, ORCE) y el cumplimiento de las reglas normativas (límites de créditos, TUPA, Estatuto UNI y Ley Universitaria).
* **El Sistema de Información (Habilitador Tecnológico):** Es la plataforma sociotécnica (Intranet DIRCE / SIGA-ORCE) que ejecuta el control de concurrencia de vacantes en tiempo real, procesa las validaciones algorítmicas automáticas y almacena el registro transaccional en la base de datos centralizada.

---

## 2. Caracterización Detallada de los Subprocesos

---

### Subproceso 1: Acreditación y Pre-requisitos

#### 1. Objetivo del Subproceso

Validar y verificar que el estudiante cumpla con todos los requisitos administrativos, financieros y académicos preliminares para habilitar su acceso al sistema y asignarle su turno de inscripción.

#### 2. Entradas (*Inputs*)

* **Datos de identificación del estudiante:** Código universitario y credenciales de acceso institucional `@uni.pe`.
* **Estado de pagos:** Registro o comprobante de pago cancelado por concepto de Autoseguro Médico Estudiantil.
* **Estado de deudas de Facultad:** Registro de no adeudo de material bibliográfico, instrumental de laboratorio o enseres.
* **Historial académico consolidado:** Registro de calificaciones del periodo académico anterior y promedio ponderado acumulado emitido por la ORCE.
* **Estado de Tutoría (si aplica):** Padrón de estudiantes en riesgo o condición académica con la tutoría previa completada.

#### 3. Actividades (Pasos del Flujo de Transformación)

1. **Verificación de compromisos financieros y administrativos:** Sincronización y validación automática del pago de autoseguro médico y de la ausencia de deudas con dependencias de la Facultad.
2. **Consolidación de la condición académica:** Verificación del cierre de actas de notas del semestre previo y comprobación de inexistencia de reclamos pendientes de calificación.
3. **Cálculo del orden de mérito:** Determinación de la posición del estudiante en función del promedio ponderado de los dos últimos periodos lectivos.
4. **Asignación del turno de matrícula:** Publicación del cronograma de atención indicando la fecha y franja horaria habilitada por Facultad.
5. **Habilitación en la Intranet:** Liberación del acceso a la ficha de matrícula individual en el portal DIRCE.

#### 4. Actores (*Actors*)

* **Estudiante Regular:** Responsable de verificar sus pagos y realizar la validación preliminar.
* **Oficina Central de Registro y Centro de Cómputo (ORCE):** Encargada de consolidar notas, calcular promedios y cargar el padrón habilitante.
* **Comisión de Matrícula y Dependencias de Facultad (Biblioteca / Cajas):** Responsables de reportar adeudos y validar el estado de reclamos de notas.
* **Oficina de Tutoría / Dirección de Escuela:** Encargada de supervisar y validar a los estudiantes en condición de riesgo académico.

#### 5. Recursos (*Resources*)

* **Plataforma Tecnológica:** Intranet DIRCE (`https://dirce.uni.edu.pe/`).
* **Sistemas de Información:** Base de datos centralizada de la ORCE y sistema de recaudación/Caja central de la UNI.

#### 6. Reglas de Negocio (*Business Rules*)

* **Regla de Autoseguro Obligatorio:** Es condición indispensable haber cancelado el autoseguro médico estudiantil antes de iniciar el proceso de matrícula.
* **Regla de Cero Deudas:** No mantener obligaciones pendientes registradas en bibliotecas, laboratorios o dependencias de la Facultad.
* **Regla de Cierre de Notas:** La información de actas de evaluación debe encontrarse cerrada y sin reclamos pendientes al menos con tres días útiles de anticipación al inicio del proceso.
* **Regla de Orden de Mérito:** La franja horaria de ingreso se asigna estrictamente en función decreciente del promedio ponderado de los dos últimos semestres académicos.
* **Regla de Riesgo Académico:** Los estudiantes con condición académica especial deben contar con el visto bueno emitido por la Oficina de Tutoría.

#### 7. Salidas (*Outputs*)

* **Estado de Habilitación:** Estudiante acreditado con estado "Habilitado" en la Intranet DIRCE.
* **Turno Oficial de Matrícula:** Franja horaria y fecha asignada para la selección de asignaturas.
* **Ficha de Matrícula Personalizada:** Asignaturas del Plan de Estudios disponibles para el alumno según su avance curricular.

#### 8. Problemas Frecuentes / Puntos de Dolor (*Diagnóstico As-Is*)

* **Desincronización de pagos:** Comprobantes abonados en Caja que continúan figurando como pendientes en el portal institucional.
* **Reclamos de notas no resueltos:** Demoras en la suscripción y cierre de actas que retrasan el cálculo oportuno del promedio y del turno de atención.
* **Inconsistencias en trámites previos:** Solicitudes de reincorporación o convalidación no procesadas a tiempo que impiden la generación de la ficha en el sistema.

---

### Subproceso 2: Selección y Registro de Cursos

#### 1. Objetivo del Subproceso

Permitir al estudiante seleccionar las asignaturas, secciones y horarios de su Plan de Estudios dentro de los límites de creditaje autorizados, registrando su propuesta académica en la Intranet DIRCE durante su turno asignado.

#### 2. Entradas (*Inputs*)

* **Estudiante acreditado y habilitado:** Alumno sin bloqueos administrativos ni financieros, con turno activo asignado por promedio ponderado (salida del Subproceso 1).
* **Oferta académica de la Facultad:** Horarios, secciones y vacantes programadas e ingresadas en el SIGA-ORCE por los Departamentos Académicos.
* **Tabla de límites de creditaje:** Cantidad máxima de créditos autorizados en función del promedio ponderado del estudiante.
* **Ficha de matrícula preconfigurada:** Plan de Estudios individual con el historial de asignaturas prerrequisito aprobadas.
* **Registro de cursos obligatorios:** Nómina de asignaturas pendientes del ciclo más atrasado y cursos en riesgo académico (Grupo Cero).

#### 3. Actividades (Pasos del Flujo de Transformación)

1. **Acceso a la Intranet en turno habilitado:** Ingreso al portal DIRCE dentro de la fecha y franja horaria asignada.
2. **Despliegue y visualización de la oferta habilitada:** Carga en pantalla de las asignaturas del Plan de Estudios cuyos prerrequisitos han sido convalidados por el sistema.
3. **Armado y selección de horario:** Elección de asignaturas, secciones y grupos por parte del estudiante conforme a la disponibilidad de vacantes.
4. **Validación interactiva de restricciones:** Verificación algorítmica en tiempo real del límite de créditos autorizados y de la inexistencia de cruces horarios prohibidos.
5. **Registro y envío de la propuesta:** Confirmación final de la selección por el alumno, generando la reserva temporal de cupos en el sistema.

#### 4. Actores (*Actors*)

* **Estudiante Regular:** Responsable de conformar su horario, seleccionar asignaturas dentro del marco crediticio permitido y registrar la propuesta.
* **Intranet DIRCE / Sistema SIGA-ORCE:** Motor tecnológico que controla la concurrencia, disponibilidad de cupos, prerrequisitos e incompatibilidades horarias.
* **Comisión de Matrícula y Departamentos Académicos:** Responsables de la parametrización de la oferta de cursos, secciones y docentes.

#### 5. Recursos (*Resources*)

* **Plataforma Tecnológica:** Intranet DIRCE (`https://dirce.uni.edu.pe/`).
* **Servidores y Base de Datos:** Sistema Integrado de Gestión Académica (SIGA-ORCE) para el procesamiento concurrente de transacciones.
* **Malla Curricular Digital:** Mapeo automatizado de planes de estudio y matrices de precedencias.

#### 6. Reglas de Negocio (*Business Rules*)

* **Regla del Límite de Créditos por Promedio (RR-0570-2022):** La cantidad máxima de créditos permitida se rige por el promedio ponderado de los dos semestres anteriores:
  * $[14.20, 20.00]$: hasta 28 créditos.
  * $[12.14, 14.20)$: hasta 26 créditos.
  * $[10.00, 12.14)$: hasta 24 créditos.
  * $[08.00, 10.00)$: hasta 18 créditos.
  * $[00.00, 08.00)$: hasta 15 créditos.
* **Regla de Creditaje Mínimo:** La matrícula regular exige un mínimo de doce ($12$) créditos semestrales, a excepción de los casos en que resten menos créditos para culminar la carrera.
* **Regla de Prioridad de Arrastre:** Es obligatoria la inscripción preferente en las asignaturas desaprobadas del ciclo más bajo y en cursos de riesgo académico.
* **Regla de Pre-requisito Obligatorio:** Queda prohibida la matrícula en asignaturas cuyos prerrequisitos académicos no figuren como aprobados en el historial del alumno.
* **Regla de Cruces de Horarios:** Prohibición absoluta de cruce de horario en sesiones de laboratorio o prácticas. De forma excepcional, se admite hasta un máximo de cuatro ($04$) horas de cruce de teoría con teoría entre dos asignaturas.
* **Regla de Control de Vacantes:** La asignación definitiva a una sección depende estrictamente del cupo disponible al momento de presionar la confirmación en el portal.

#### 7. Salidas (*Outputs*)

* **Pre-Ficha de Matrícula Registrada:** Comprobante provisional con el detalle de asignaturas, secciones y créditos seleccionados en la Intranet.
* **Reserva de Vacantes:** Bloqueo transaccional de cupo en el SIGA-ORCE para las secciones elegidas.

#### 8. Problemas Frecuentes / Puntos de Dolor (*Diagnóstico As-Is*)

* **Agotamiento acelerado de vacantes:** Secciones con alta demanda que saturan sus cupos al abrirse el turno, obligando a replantear el horario de forma imprevista.
* **Saturación del portal DIRCE:** Degradación del rendimiento de la plataforma o caídas del servicio por alta concurrencia simultánea en horas pico.
* **Cruces horarios estructurales:** Incompatibilidad de horarios entre asignaturas de ciclos contiguos o falta de apertura de secciones paralelas por parte de los Departamentos.
* **Asignaturas omitidas en la interfaz:** Cursos de la malla que no se muestran disponibles para selección por omisiones de programación académica.

---

### Subproceso 3.A: Verificación y Control de Reglas Académicas

#### 1. Objetivo del Subproceso

Auditar e inspeccionar la propuesta de matrícula (Pre-Ficha) registrada por el estudiante, validando el cumplimiento estricto de las normas académicas, resoluciones rectorales, estatus de riesgo académico e incompatibilidades horarias antes de proceder a la confirmación oficial.

#### 2. Entradas (*Inputs*)

* **Pre-Ficha de Matrícula Registrada:** Propuesta de asignaturas y secciones generada en el Subproceso 2.
* **Expediente e Historial Académico:** Registro consolidado de asignaturas aprobadas y desaprobaciones acumuladas gestionado por la ORCE.
* **Padrón del Grupo Cero (Riesgo Académico):** Listado oficial de estudiantes condicionados o que retornan de sanción, provisto por la Oficina de Tutoría.
* **Matriz de Compatibilidad y Malla Curricular:** Tabla de prerrequisitos, equivalencias y cuadro de horarios aprobado por la Facultad.
* **Solicitudes de Rectificación / Formulario Digital:** Requerimientos presentados por estudiantes por causales de vacantes agotadas, cruces teóricos permitidos o asignaturas no ofertadas.

#### 3. Actividades (Pasos del Flujo de Transformación)

1. **Auditoría automática de prerrequisitos y límites:** Verificación algorítmica de cumplimiento de precedencias y topes crediticios según promedio ponderado.
2. **Inscripción obligatoria de asignaturas en riesgo (Grupo Cero):** Validación de que los cursos desaprobados del ciclo más atrasado hayan sido incluidos con carácter mandatorio.
3. **Control e inspección de incompatibilidad horaria:** Filtro del sistema para bloquear solapamientos en prácticas/laboratorios y validar el rango máximo permitido para teoría.
4. **Procesamiento de rectificaciones y solicitudes excepcionales:** Evaluación individualizada por parte de la Comisión de Matrícula o Dirección de Escuela de los trámites ingresados mediante formulario digital.
5. **Emisión de alertas y notificaciones de observación:** Asignación del estado "Observada" a las fichas que presenten inconsistencias, notificando al alumno para subsanación durante la semana de depuración.

#### 4. Actores (*Actors*)

* **Estudiante Regular / Condicionado:** Responsable de hacer seguimiento a su estado y formalizar rectificaciones ante observaciones.
* **Comisión de Matrícula de la Facultad:** Órgano colegiado encargado de auditar la carga académica, evaluar solicitudes y supervisar el Grupo Cero.
* **Director de Escuela Profesional / Decano:** Autoridades competentes para emitir dictámenes sobre ampliación de vacantes, inclusiones o retiros.
* **Jefatura de Tutoría:** Unidad responsable del seguimiento y aval académico de los estudiantes en condición de riesgo.
* **Sistema SIGA-ORCE / Intranet DIRCE:** Plataforma tecnológica donde se ejecutan los filtros lógicos y el cambio de estados de las fichas.

#### 5. Recursos (*Resources*)

* **Plataforma Tecnológica:** Módulo de Auditoría y Verificación de Matrícula en la Intranet DIRCE.
* **Formulario Digital de Atención de Solicitudes:** Canal institucionalizado para gestionar reclamos y rectificaciones asociadas a la cuenta institucional `@uni.pe`.
* **Servidores SIGA-ORCE:** Infraestructura de cómputo donde se contrastan las pre-fichas con las reglas de negocio.

#### 6. Reglas de Negocio (*Business Rules*)

* **Regla de Inscripción Obligatoria por Riesgo Académico:** Las materias desaprobadas correspondientes al ciclo inferior se inscriben por defecto con obligatoriedad; el estudiante solo puede elegir sección.
* **Regla de Separación Temporal por Tercera Desaprobación (Art. 253° Estatuto / Ley 30220):** Desaprobar una misma materia por tercera vez conlleva la suspensión temporal de un ($01$) año académico. Al reintegrarse, el alumno únicamente podrá registrarse en un máximo de dos ($02$) asignaturas desaprobadas por tercera vez.
* **Regla de Retiro Definitivo por Cuarta Desaprobación:** La desaprobación por cuarta vez de una misma materia determina el retiro definitivo e irreversible del estudiante de la universidad.
* **Regla Estricta de Incompatibilidad Horaria:** Se prohíbe terminantemente cualquier cruce de horario en horas de práctica o laboratorio.
* **Excepción de Cruce Teórico:** Se autoriza un máximo de cuatro ($04$) horas pedagógicas de cruce exclusivamente de teoría con teoría entre dos asignaturas.
* **Regla de Solicitud Única Activa:** Ante dificultades en la matrícula, el estudiante solo puede mantener una solicitud vigente (el sistema procesa la última versión remitida desde el correo institucional `@uni.pe`).
* **Regla de Prohibición de Retiro Total Implícito:** Durante el periodo de depuración o rectificación, el alumno no puede desmatricularse de la totalidad de materias ni retirar los cursos de arrastre del ciclo más atrasado.

#### 7. Salidas (*Outputs*)

* **Dictamen de Auditoría:** Pre-Ficha Aprobada (expedita para confirmación) o Pre-Ficha Observada.
* **Padrón Auditado del Grupo Cero:** Relación final de alumnos condicionados enviada a la Dirección de Escuela y a Tutoría.
* **Resolución de Solicitudes de Rectificación:** Dictamen formal de inclusión, exclusión o cambio de sección emitido por la autoridad competente.

#### 8. Problemas Frecuentes / Puntos de Dolor (*Diagnóstico As-Is*)

* **Sobrecarga en la resolución de expedientes:** Alta concentración de solicitudes por falta de vacantes o cruces que deben resolverse manualmente en plazos acotados.
* **Duplicidad de solicitudes:** Estudiantes que remiten expedientes reiterativos ante la falta de respuesta inmediata, saturando la bandeja de revisión.
* **Detección desfasada de causales de sanción:** Casos de tercera o cuarta desaprobación procesados tardíamente por rezago en el cierre de actas, demandando anulaciones manuales de matrícula.

---

### Subproceso 3.B: Confirmación y Registro Transaccional Oficial

#### 1. Objetivo del Subproceso

Formalizar, consolidar y asentar con carácter legal y transaccional definitivo la matrícula del estudiante en las bases de datos centralizadas de la universidad (SIGA-ORCE), emitiendo los documentos oficiales de acreditación (Reporte y Boleta de Matrícula) y reportando la nómina oficial a organismos del Estado (SUNEDU y MINEDU).

#### 2. Entradas (*Inputs*)

* **Pre-Ficha Aprobada o Subsanada:** Carga académica validada por los controles automáticos y las comisiones de auditoría/rectificación.
* **Dictámenes de rectificación y autorizaciones especiales:** Resoluciones emitidas por la Dirección de Escuela que aprueban adiciones, bajas o permutas de asignaturas.
* **Archivo digital de consolidación:** Padrón depurado remitido por la Oficina de Estadística de cada Facultad al término de la semana de rectificaciones.

#### 3. Actividades (Pasos del Flujo de Transformación)

1. **Asentamiento transaccional definitivo:** Bloqueo de la fase de edición en la Intranet DIRCE y grabación de las cargas lectivas en la base de datos central de la ORCE.
2. **Generación del Reporte de Matrícula:** Emisión del documento digital preliminar que acredita las asignaturas registradas para el ciclo en curso.
3. **Cierre de Matrícula por Facultad:** Consolidación y remisión del archivo digital oficial por parte de la Oficina de Estadística de la Facultad hacia la ORCE al concluir la semana de depuración.
4. **Emisión de la Boleta de Matrícula Oficial:** Generación del registro legal en el sistema ORCE y aplicación del visado institucional por Estadística de la Facultad.
5. **Generación y distribución de padrones de clase:** Suministro de los padrones oficiales definitivos a los docentes de cada asignatura en el primer día útil de la segunda semana lectiva.
6. **Reporte institucional y tramitación externa:** Migración de datos oficiales a los sistemas de SUNEDU y MINEDU, y habilitación del trámite de expedición del carné universitario.

#### 4. Actores (*Actors*)

* **Estudiante Regular:** Receptor del Reporte de Matrícula, Boleta Oficial y acreditaciones correspondientes.
* **Oficina de Estadística de la Facultad:** Órgano encargado de procesar ajustes, visar documentos oficiales y formalizar el cierre del proceso.
* **Oficina Central de Registro y Estadística (ORCE / DIRCE):** Dependencia central que custodia la base de datos SIGA-ORCE, genera las boletas oficiales e interoperabilidad con entidades externas.
* **Docentes de Asignatura:** Receptores de los padrones de aula oficiales para el registro de asistencias y calificaciones.
* **Organismos Nacionales (SUNEDU / MINEDU):** Entidades supervisoras y receptoras de la nómina consolidada de matrícula universitaria.

#### 5. Recursos (*Resources*)

* **Sistema Integrado de Gestión Académica (SIGA-ORCE):** Base de datos relacional y plataforma transaccional donde se asienta el historial académico formal.
* **Módulo de Firma / Visado Digital:** Mecanismo en la Intranet DIRCE que certifica la validez legal del Reporte y Boleta de Matrícula.
* **Plataforma de Interoperabilidad con SUNEDU:** Canal de transferencia electrónica de datos para acreditación estudiantil y carnetización.

#### 6. Reglas de Negocio (*Business Rules*)

* **Regla de Aprobación Automática (TUPA PA5400954D - RR-3698-2024):** El procedimiento de Matrícula Regular ostenta la condición de aprobación automática en la Intranet DIRCE una vez ingresada la propuesta conforme a los requisitos vigentes.
* **Regla del Cierre de Matrícula:** Concluida la semana de depuración, la Oficina de Estadística efectúa el cierre definitivo; a partir de este hito no se admiten modificaciones, salvo resolución decanal o rectoral extemporánea.
* **Regla del Visado Obligatorio:** El Reporte y la Boleta de Matrícula adquieren plena validez jurídica únicamente tras el visado formal de la Oficina de Estadística de la Facultad respectiva.
* **Regla de Oportunidad en Padrones de Clase:** Las listas definitivas de aula deben encontrarse a disposición de los docentes obligatoriamente el primer día hábil de la segunda semana del periodo académico.
* **Regla de Plazo Legal de Reporte a SUNEDU/MINEDU:** La ORCE debe transferir la información de matrícula regular en un plazo no mayor a veinte ($20$) días calendario posteriores a su generación definitiva.

#### 7. Salidas (*Outputs*)

* **Reporte de Matrícula:** Documento informativo individual visado por Estadística.
* **Boleta de Matrícula Oficial:** Título formal emitido por ORCE que certifica la condición de alumno matriculado durante el semestre lectivo.
* **Padrones Oficiales de Asignatura y Sección:** Listas definitivas de asistencia y actas de evaluación para los docentes.
* **Padrón Nacional de Matriculados:** Base de datos remitida a SUNEDU y MINEDU.
* **Habilitación de Carné Universitario:** Base de postulantes validada para la emisión de documentos de identidad estudiantil ante SUNEDU.

#### 8. Problemas Frecuentes / Puntos de Dolor (*Diagnóstico As-Is*)

* **Desfase en la primera semana de clases:** Estudiantes que asisten a cátedra sin figurar en nóminas provisionales debido a rectificaciones o inclusiones pendientes de resolución.
* **Demoras en el visado de boletas:** Sobrecarga operativa en las Oficinas de Estadística de Facultad que posterga la entrega de boletas visadas, documento exigido para trámites de becas o seguros.
* **Inconsistencias en la migración de datos hacia SUNEDU:** Observaciones por inconsistencia de campos que demoran la validación del padrón global o el despacho del carné universitario.
