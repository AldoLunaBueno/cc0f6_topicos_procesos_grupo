# Tópicos de Ciencia de la Computación III (CC0F6) — Trabajo Grupal

Repositorio del informe grupal de análisis y rediseño de procesos mediante BPMN.

- **Proceso general:** Procedimiento Administrativo de Matrícula Regular de Estudiantes de la UNI.
- **Subprocesos seleccionados (uno por integrante):**
  1. **Subproceso 1 (`subproceso_1`):** Acreditación y Pre-requisitos.
  2. **Subproceso 2 (`subproceso_2`):** Selección y Registro de Cursos.
  3. **Subproceso 3.A (`subproceso_3a`):** Verificación y Control de Reglas Académicas.
  4. **Subproceso 3.B (`subproceso_3b`):** Confirmación y Registro Transaccional Oficial.

> **Nota sobre terminología:** En el documento oficial de estructura del curso, lo que nosotros denominamos **Proceso** (Matrícula Regular) y **Subprocesos** (1, 2, 3.A y 3.B) figuran respectivamente como *Macroproceso* y *Procesos*. En todo nuestro informe y repositorio mantenemos nuestra terminología (**Proceso** y **Subprocesos**).

---

## 1. ¿Qué tenemos hasta ahora?

1. **Base de referencia preliminar (`docs/`):**
   - El archivo [`docs/proceso_y_subprocesos_desglose.md`](docs/proceso_y_subprocesos_desglose.md) contiene un desglose inicial de la cadena de valor y de los 4 subprocesos que sirve como insumo de consulta.
2. **Secciones ya redactadas en LaTeX (`trabajo_grupal/`):**
   - **Carátula, Metadatos e Índice General:** [`00_caratula.tex`](trabajo_grupal/sections/00_caratula.tex), [`00_metadatos.tex`](trabajo_grupal/sections/00_metadatos.tex) y [`main.tex`](trabajo_grupal/main.tex).
   - **Sección 1 — Introducción (`sections/01_introduccion/`):** Ya cuenta con el desarrollo de Situación Problemática (incluyendo el diagrama de Ishikawa en TikZ), Justificación, Objetivos, Alcance y Limitaciones.
3. **Secciones estructuradas con plantillas listas para rellenar:**
   - **Sección 2 — Organización (`sections/02_organizacion/`):** Información general, Estructura organizacional, Clasificación y Mapa de procesos.
   - **Sección 3 — Subproceso Seleccionado (`sections/03_subproceso_seleccionado/`):** Dividida en 9 subcarpetas (una por apartado) y 4 archivos por subcarpeta (uno por cada subproceso).
   - **Sección 4 — Levantamiento de Información (`sections/04_levantamiento_informacion/`):** Dividida en 5 subcarpetas (una por apartado) y 4 archivos por subcarpeta (uno por cada subproceso).

---

## 2. ¿Cómo está organizada la estructura del proyecto?

El documento de estructura del informe nos exige presentar las secciones **ordenadas por apartado** (por ejemplo: primero los *Objetivos* de todos los subprocesos, luego los *Alcances* de todos los subprocesos, etc.) y no agrupadas en un solo bloque por integrante.

Para que los 4 integrantes podamos trabajar en paralelo sin pisarnos el trabajo ni generar conflictos en Git (*merge conflicts*), cada apartado ha sido partido en **4 archivos `.tex` individuales**, identificados por el sufijo de cada subproceso:

- `*_subproceso_1.tex` $\rightarrow$ Subproceso 1: Acreditación y Pre-requisitos
- `*_subproceso_2.tex` $\rightarrow$ Subproceso 2: Selección y Registro de Cursos
- `*_subproceso_3a.tex` $\rightarrow$ Subproceso 3.A: Verificación y Control de Reglas Académicas
- `*_subproceso_3b.tex` $\rightarrow$ Subproceso 3.B: Confirmación y Registro Transaccional Oficial

### Árbol de directorios en `trabajo_grupal/`

```text
trabajo_grupal/
├── main.tex                              # Archivo principal que ensambla todo el informe
├── diagramas/
│   └── ishikawa_problema.tex             # Diagrama de Ishikawa en TikZ
├── images/
│   └── logo-uni.png
└── sections/
    ├── 00_caratula.tex                   # [Listo] Portada
    ├── 00_metadatos.tex                  # [Listo] Autores y título
    ├── 01_introduccion.tex               # [Listo] Sección 1: Introducción
    ├── 01_introduccion/                  # [Listo] Subsecciones de Introducción
    │
    ├── 02_organizacion.tex               # Sección 2: Organización
    ├── 02_organizacion/
    │   ├── 01_informacion_general.tex
    │   ├── 02_estructura_organizacional.tex
    │   ├── 03_clasificacion.tex
    │   └── 04_mapa_de_procesos.tex
    │
    ├── 03_subproceso_seleccionado.tex    # Sección 3: Subproceso Seleccionado
    ├── 03_subproceso_seleccionado/
    │   ├── 01_objetivo/                  # objetivo_subproceso_{1,2,3a,3b}.tex
    │   ├── 02_alcance/                   # alcance_subproceso_{1,2,3a,3b}.tex
    │   ├── 03_actores/                   # actores_subproceso_{1,2,3a,3b}.tex
    │   ├── 04_entradas/                  # entradas_subproceso_{1,2,3a,3b}.tex
    │   ├── 05_salidas/                   # salidas_subproceso_{1,2,3a,3b}.tex
    │   ├── 06_recursos/                  # recursos_subproceso_{1,2,3a,3b}.tex
    │   ├── 07_reglas/                    # reglas_subproceso_{1,2,3a,3b}.tex
    │   ├── 08_procedimientos/            # procedimientos_subproceso_{1,2,3a,3b}.tex
    │   └── 09_actividades/               # actividades_subproceso_{1,2,3a,3b}.tex
    │
    ├── 04_levantamiento_informacion.tex  # Sección 4: Levantamiento de Información
    └── 04_levantamiento_informacion/
        ├── 01_tecnica_utilizada/         # tecnica_subproceso_{1,2,3a,3b}.tex
        ├── 02_instrumento_utilizado/     # instrumento_subproceso_{1,2,3a,3b}.tex
        ├── 03_fuentes_consultadas/       # fuentes_subproceso_{1,2,3a,3b}.tex
        ├── 04_resultados/                # resultados_subproceso_{1,2,3a,3b}.tex
        └── 05_evidencias/                # evidencias_subproceso_{1,2,3a,3b}.tex
```

---

## 3. ¿Qué debe hacer cada integrante?

Cada integrante es responsable de un subproceso (`1`, `2`, `3a` o `3b`). Para completar tu parte, **edita únicamente los archivos que terminen con el sufijo de tu subproceso** (`_subproceso_X.tex`).

Dentro de cada archivo encontrarás:
1. El título del subproceso (`\subsubsection{...}`), que **debes mantener**.
2. Un comentario `% TODO: ...` y una línea `\textit{[Pendiente: ...]}` que debes **reemplazar** con tu contenido redactado en LaTeX.

### 3.1. Archivos a completar en `03_subproceso_seleccionado/` (9 archivos por integrante)

| Carpeta | Archivo a editar (`X` = `1`, `2`, `3a` o `3b`) | ¿Qué se debe desarrollar? |
| :--- | :--- | :--- |
| `01_objetivo/` | `objetivo_subproceso_X.tex` | Explicar para qué existe este subproceso y cuál es su propósito principal. |
| `02_alcance/` | `alcance_subproceso_X.tex` | Indicar dónde empieza, qué incluye, dónde termina y qué queda fuera del subproceso. |
| `03_actores/` | `actores_subproceso_X.tex` | Personas, áreas o sistemas que participan en el subproceso y su rol. |
| `04_entradas/` | `entradas_subproceso_X.tex` | Elementos, datos o requisitos que necesita el subproceso para comenzar a ejecutarse. |
| `05_salidas/` | `salidas_subproceso_X.tex` | Resultados, registros o documentos que genera el subproceso al finalizar. |
| `06_recursos/` | `recursos_subproceso_X.tex` | Elementos utilizados para ejecutar el subproceso (personas, tecnología y documentos/formatos). |
| `07_reglas/` | `reglas_subproceso_X.tex` | Condiciones y normas institucionales que determinan cómo debe realizarse el subproceso. |
| `08_procedimientos/` | `procedimientos_subproceso_X.tex` | Explicación narrativa y secuencial de cómo se ejecuta el subproceso (relata las actividades en prosa sin desarrollarlas al detalle). |
| `09_actividades/` | `actividades_subproceso_X.tex` | Lista de acciones concretas que se realizan dentro del subproceso, indicando el responsable de cada una. |

### 3.2. Archivos a completar en `04_levantamiento_informacion/` (5 archivos por integrante)

| Carpeta | Archivo a editar (`X` = `1`, `2`, `3a` o `3b`) | ¿Qué se debe desarrollar? |
| :--- | :--- | :--- |
| `01_tecnica_utilizada/` | `tecnica_subproceso_X.tex` | Explicar cómo se obtuvo la información del subproceso (entrevista, observación, cuestionario, revisión documental, etc.) y por qué fue adecuada. |
| `02_instrumento_utilizado/` | `instrumento_subproceso_X.tex` | Recurso concreto con el que se aplicó la técnica y se registró la información del subproceso (guía de entrevista, ficha de observación, ficha de revisión, etc.). |
| `03_fuentes_consultadas/` | `fuentes_subproceso_X.tex` | De dónde provino la información del subproceso (personas, áreas, reglamentos, documentos o sistemas consultados). |
| `04_resultados/` | `resultados_subproceso_X.tex` | Principales hallazgos obtenidos en el subproceso al aplicar la técnica e instrumento (actividades observadas, tiempos de espera, problemas encontrados). |
| `05_evidencias/` | `evidencias_subproceso_X.tex` | Elementos que respaldan o comprueban los resultados del subproceso (capturas, formatos, comunicados, registros, etc.). |

---

## 4. Recomendaciones al editar y subir cambios

- **No modifiques `main.tex` ni los archivos principales de sección (`02_organizacion.tex`, `03_subproceso_seleccionado.tex`, `04_levantamiento_informacion.tex`)** a menos que sea estrictamente necesario, ya que estos archivos ya importan automáticamente todos los subarchivos mediante `\input{...}`.
- Si necesitas agregar imágenes para tus evidencias o diagramas, guárdalas en `trabajo_grupal/images/` con un nombre identificable (por ejemplo, `evidencia_subproceso_2_portal.png`).
- Antes de hacer `git commit` y `git push`, verifica que solo estés agregando tus archivos correspondientes (`git status`) y que el documento compile sin errores de LaTeX.
