[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/hdquHjtS)

Proyecto Sistema de seguimiento y control para parqueadores “ParkAssist”

integrantes: 
Edward Hernan Apaza Mamani 2018060915
Ronal Daniel Lupaca Mamani 2020067146
Carlos Andrés Escobar Rejas 2021070016
Aarón Pedro Paco Ramos 2018000654



Diagrama de Clases
![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/103132465/b2549729-1d57-4831-99a4-e9511681d963)


Diagrama de paquetes
![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/103132465/31a0b152-2f4e-48f6-a2e7-d49c2cb50fff)

Diagrama de Casos de Uso
![image](https://github.com/UPT-FAING-EPIS/proyecto-si784-2024-i-u1-cps_apaza_paco_lupaca_escobar/assets/103132465/be013e26-495c-45ff-a100-fe38fa2c6165)



## Escenarios de Caso de Uso (Narrativa)

## Caso de Uso: Iniciar Sesión (CU01)

| Caso de Uso | Iniciar Sesión |
| --- | --- |
| Actores | Administrador, Empleado |
| Descripción | Este caso de uso describe el proceso de inicio de sesión para los usuarios del sistema, ya sea administrador o empleado. |
| Precondiciones | El usuario tiene credenciales válidas para iniciar sesión. |
| Flujo Normal | 1. El actor (administrador o empleado) ingresa al sistema.2. El sistema muestra la interfaz de inicio de sesión. 3. El actor ingresa su nombre de usuario y contraseña. 4. El actor confirma la acción de inicio de sesión. 5. El sistema verifica las credenciales del usuario. 6. Si las credenciales son válidas, el sistema autentica al usuario y muestra el menú correspondiente (administrador o empleado).|

## Caso de Uso: Registrar Usuario (CU02)

| Caso de Uso | Registrar Usuario |
| --- | --- |
| Actores | Administrador |
| Descripción | Este caso de uso describe la funcionalidad que permite a un administrador registrar nuevos usuarios en el sistema, asignándoles roles de empleado o administrador. |
| Precondiciones | El administrador ha iniciado sesión en el sistema. |
| Flujo Normal | 1. El administrador selecciona la opción "Registrar Usuario" desde la opción del dashboard. 2. El sistema muestra el formulario de registro de usuario. 3. El administrador ingresa la información requerida, incluyendo nombre, apellido, usuario, contraseña y selecciona el rol (empleado o administrador). 4. El administrador confirma la acción de registro. 5. El sistema valida la información ingresada. 6. El sistema almacena la información del nuevo usuario en la base de datos. 7. El sistema notifica al administrador sobre el éxito del registro. |

## Caso de Uso: Listar Usuarios (CU03)

| Caso de Uso | Listar Usuarios |
| --- | --- |
| Actores | Administrador |
| Descripción | Este caso de uso describe la funcionalidad que permite a un administrador listar y gestionar los usuarios registrados en el sistema. |
| Precondiciones | El administrador ha iniciado sesión en el sistema. |
| Flujo Normal | 1. El administrador selecciona la opción "Listar Usuarios" desde el dashboard. 2. El sistema recopila la lista de usuarios registrados. 3. El sistema presenta la lista de usuarios con sus datos respectivos (nombre, apellido, usuario y rol) en la interfaz. 4. El administrador puede realizar acciones como buscar, modificar o eliminar usuarios en la lista. |

## Caso de Uso: Ingresar Vehículo (CU04)

| Caso de Uso | Ingresar Vehículo |
| --- | --- |
| Actores | Administrador, Empleado |
| Descripción | Este caso de uso describe la funcionalidad que permite a administradores y empleados registrar la entrada de vehículos al estacionamiento. |
| Precondiciones | El actor (administrador o empleado) ha iniciado sesión en el sistema. |
| Flujo Normal | 1. El actor selecciona la opción "Ingresar Vehículo" desde el dashboard. 2. El sistema muestra el formulario de ingreso de vehículo. 3. El actor ingresa la información requerida, incluyendo la placa del vehículo, nombre del propietario y tipo de vehículo (auto o motocicleta). 4. El actor confirma la acción de ingreso del vehículo. 5. El sistema verifica la unicidad de la placa del vehículo. 6. Si la placa es única, el sistema registra la entrada del vehículo y genera un registro con la fecha y hora de ingreso. |

## Caso de Uso: Retirar Vehículo (CU05)

| Caso de Uso | Retirar Vehículo |
| --- | --- |
| Actores | Administrador, Empleado |
| Descripción | Este caso de uso describe la funcionalidad que permite a administradores y empleados registrar la salida de un vehículo del estacionamiento. |
| Precondiciones | El actor (administrador o empleado) ha iniciado sesión en el sistema y hay al menos un vehículo registrado en el estacionamiento. |
| Flujo Normal | 1. El actor selecciona la opción "Retirar Vehículo" desde el menú. 2. El sistema muestra el formulario de retiro de vehículo. 3. El actor ingresa la placa del vehículo a retirar. 4. El actor confirma la acción de retirar el vehículo. 5. El sistema verifica la existencia de la placa en el registro de vehículos. 6. Si la placa existe, el sistema calcula la duración del estacionamiento y genera un registro con la fecha y hora de salida. 7. El sistema libera el espacio del parqueadero ocupado por el vehículo retirado. |

## Caso de Uso: Listar Vehículo (CU06)

| Caso de Uso | Listar Vehículo |
| --- | --- |
| Actores | Administrador, Empleado |
| Descripción | Este caso de uso describe la funcionalidad que permite a administradores y empleados visualizar una lista de los vehículos actualmente estacionados en el parqueadero. |
| Precondiciones | El actor (administrador o empleado) ha iniciado sesión en el sistema y hay al menos un vehículo registrado en el estacionamiento. |
| Flujo Normal |  1. El actor selecciona la opción "Listar Vehículos" desde el menú. 2. El sistema recopila la lista de vehículos actualmente estacionados. 3. El sistema presenta la lista de vehículos con sus datos respectivos (placa, nombre del propietario, tipo de vehículo, fecha y hora de entrada) en la interfaz. 4. El actor puede realizar acciones adicionales, como buscar o filtrar los vehículos en la lista. |
