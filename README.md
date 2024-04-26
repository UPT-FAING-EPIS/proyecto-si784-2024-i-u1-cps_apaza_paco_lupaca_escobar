[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/hdquHjtS)

## **Proyecto de agenda virtual para la I.E.P. Steve Jobs**

Integrantes: 
- Edward Hernan Apaza Mamani  2018060915

- Ronal Daniel Lupaca Mamani  2020067146

- Carlos Andrés Escobar Rejas 2021070016

- Aarón Pedro Paco Ramos 2018000654



Diagrama de Clases

![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/112984449/8a24e33b-00ee-4419-9b94-8e0d699052e6)

Diagrama de paquetes

![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/112984449/41eb01d0-054f-4ea6-9e08-d3603c06a598)

Diagrama de Casos de Uso

![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/112984449/ccd6d150-5472-4195-a155-09b1bb2c3971)

Diagrama de componentes

![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/112984449/5b8033ed-ed04-4c64-bc1b-f21dff039a37)

Diagrama de despliegue

![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/112984449/c441c7f7-82ff-4881-9cb7-6b57e66242f9)

Diagrama de base de datos

![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/112984449/994234c0-e6e6-42c9-9653-3c3ec4fb7008)


## Escenarios de Caso de Uso (Narrativa)

# Casos de Uso

| Caso de Uso | Crear registro de asistencia /CU-1 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede crear el registro de asistencia. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección asistencias. 2. El sistema muestra la página de asistencias de los salones. 3. El personal cliquea en el botón de crear nuevo registro de asistencias. 4. El sistema muestra la página para crear un nuevo registro de asistencia. 5. El personal selecciona el grado, sección y la fecha y le da al botón de crear registro. 6. El sistema creará un registro con los datos especificados. |
| **Flujo alternativo 1** | Si no se selecciona el grado, la sección o la fecha, el sistema se quedará en la misma página de creación. |
| **Postcondición** | El sistema mostrará los datos de los estudiantes para poder tomar la asistencia. |

---

| Caso de Uso | Visualizar registro de asistencia /CU-2 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede visualizar los registros de asistencia. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección asistencias. 2. El sistema muestra la página de asistencias de los salones. 3. El personal elige la sección en la cual desea visualizar las asistencias. 4. El sistema muestra el registro de asistencias de aquella sección. |
| **Flujo alternativo 1** | Si no se selecciona la sección, el sistema se quedará en la misma página de asistencias. |
| **Postcondición** | El sistema mostrará el registro de asistencia de dicha sección. |

---

| Caso de Uso | Actualizar la asistencia /CU-3 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede actualizar los registros de asistencia. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección asistencias. 2. El sistema muestra la página de asistencias de los salones. 3. El personal elige la sección en la cual desea visualizar las asistencias. 4. El sistema muestra el registro de asistencias de aquella sección. |
| **Flujo alternativo 1** | Si no se selecciona la sección, el sistema se quedará en la misma página de asistencias. |
| **Postcondición** | El sistema mostrará el registro de asistencia de dicha sección. |

---

| Caso de Uso | Crear comunicado /CU-4 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede crear un comunicado institucional. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección comunicados. 2. El sistema muestra la página de comunicados. 3. El personal cliquea en el botón de comunicado institucional. 4. El sistema muestra la página para crear un nuevo comunicado institucional. 5. El personal redacta el comunicado y le da al botón de Publicar. 6. El sistema creará el comunicado institucional. |
| **Flujo alternativo 1** | Si no se redacta ningún comunicado, el sistema se quedará en la misma página de creación. |
| **Postcondición** | El sistema mostrará a todos los usuarios el comunicado que se ha publicado. |

---

| Caso de Uso | Visualizar comunicado /CU-5 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede visualizar los comunicados. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección comunicados. 2. El sistema muestra la página de comunicados. 3. El personal clickea en mostrar todos los comunicados. 4. El sistema muestra todos los comunicados que se han publicado. |
| **Flujo alternativo 1** | Si no se selecciona la opción, el sistema se quedará en la misma página de comunicados. |
| **Postcondición** | El sistema mostrará todos los comunicados. |

---

| Caso de Uso | Actualizar comunicado /CU-6 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede modificar los comunicados. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección comunicados. 2. El sistema muestra la página de comunicados. 3. El personal clickea en mostrar todos los comunicados. 4. El sistema muestra todos los comunicados que se han publicado. 5. El personal selecciona en el botón modificar del comunicado seleccionado. 6. El sistema permite modificar el comunicado seleccionado. |
| **Postcondición** | El sistema modificará el comunicado seleccionado. |

---

| Caso de Uso | Agregar actividad en calendario /CU-7 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede crear una actividad en el calendario. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en el calendario. 2. El sistema muestra la página del calendario. 3. El personal cliquea en el botón de crear actividad. 4. El sistema muestra la página para crear una actividad en el calendario. 5. El personal crea una actividad y le da al botón de Publicar. 6. El sistema publicará la actividad en el calendario. |
| **Flujo alternativo 1** | Si no se redacta ninguna actividad, el sistema se quedará en la misma página de creación. |
| **Postcondición** | El sistema mostrará a todos los usuarios la actividad creada en el calendario. |

---

| Caso de Uso | Visualizar actividades del calendario /CU-8 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede visualizar las actividades en el calendario. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en el calendario. 2. El sistema muestra la página del calendario, con las actividades. |
| **Postcondición** | El sistema mostrará todos los comunicados en el calendario. |

---

| Caso de Uso | Actualizar actividades del calendario /CU-9 |
| --- | --- |
| **Actor** | Personal administrativo |
| **Descripción** | El personal puede modificar las actividades creadas en el calendario. |
| **Precondiciones** | Haber iniciado sesión. |
| **Flujo Normal** | 1. El personal administrativo, estando en la interfaz principal, cliquea en la sección calendario. 2. El sistema muestra la página de actividades del calendario. 3. El personal clickea en mostrar todos las actividades del calendario. 4. El sistema muestra todas las actividades que se han publicado. 5. El personal selecciona en el botón actualizar del comunicado seleccionado. 6. El sistema permite modificar el comunicado seleccionado. |
| **Postcondición** | El sistema modificará el comunicado seleccionado. |
