Descripción del Proyecto 

Esta es una API RESTful que permite gestionar información sobre los personajes de la serie "Friends". Los usuarios pueden realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) sobre la entidad principal.

Tecnologías Usadas
Node.js
Express.js
MySQL
Endpoints

1. Obtener todos los personajes
Método: GET
Ruta: /api/friends
Descripción: Obtiene una lista de todos los personajes.
Parámetros opcionales:
incluir_actor: Incluye el nombre del actor.
search: Filtra los personajes por nombre.

2. Crear un nuevo personaje
Método: POST
Ruta: /api/friends
Descripción: Inserta un nuevo personaje.
Cuerpo de la solicitud (JSON):
{
  "nombre": "",
  "actor": "",
  "ocupación": "",
  "edad": ""
}

3. Actualizar un personaje existente
Método: PUT
Ruta: /api/friends/:id
Descripción: Actualiza la información de un personaje existente.
Parámetros:
id: ID del personaje a actualizar.
Cuerpo de la solicitud (JSON):

{
  "nombre": "",
  "actor": "",
  "ocupación": "",
  "edad": ""
}
4. Eliminar un personaje
Método: DELETE
Ruta: /api/friends/:id
Descripción: Elimina un personaje existente.
Parámetros:
id: ID del personaje a eliminar.

Intrucciones para clonar la API

Clona el repositorio:
git clone https://github.com/Adalab/modulo-4-evaluacion-final-bpw-MVictoriaDoll.git

Instalación de independencias
npm i express corse mysql2

Configura la base de datos: Asegúrate de que la base de datos MySQL está corriendo y la configuración de conexión está en su lugar.

Ejecuta la Api


