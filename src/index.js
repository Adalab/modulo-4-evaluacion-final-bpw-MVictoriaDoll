const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const getConnection = require('./db/db');

const app = express();
const port = 4000;

app.use( cors() );
app.use( express.json({limit: '25mb'}));

app.listen(port, () => {
    console.log(`Servidor iniciado escuchando en http://localhost:${port}`);
  });

  app.get("/api/friends", async (req, res) => {
    // Obtener conn con MySQL
    const conn = await getConnection();
    if (!conn) {
      res.status(500).json({ success: false, error: "Error con la conexion." });
      return;
    }

    const [results] = await conn.query('SELECT * FROM PersonajesFriends;');

    res.json(results);

    await conn.close();
  });

  
    
