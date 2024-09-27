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

    let selectStmt = 'SELECT * FROM friends.PersonajesFriends PF';
    const values = [];

    if ( req.query.incluir_actor && req.query.incluir_actor === 'true') {
        selectStmt = selectStmt = `
        SELECT PF.*, AF.nacionalidad 
        FROM friends.PersonajesFriends PF 
        JOIN friends.ActoresFriends AF ON (PF.idActoresFriends = AF.idActoresFriends)`;    
    }

    if( req.query.search ) {
        selectStmt += " WHERE nombre LIKE ?"
        values.push(`%${req.query.search}%`)
      }    

    const [results] = await conn.query(selectStmt, values);

    res.json(results);

    await conn.close();
  });

  app.post ('api/friends', async (req,res) => {

    if (!conn) {
        res.status(500).json({ success: false, error: "Error con la conexion." });
        return;
      }

      const [results] = await conn.execute (`
        INSERT PersonajesFriends (nombre, actor, ocupación, edad)
        VALUES ('Rachel Green', '', '','');`);

      await conn.close();

  })

  
    
