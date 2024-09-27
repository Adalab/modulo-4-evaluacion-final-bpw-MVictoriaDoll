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

  app.post ('/api/friends', async (req,res) => {

    console.log(req.body);
    const conn = await getConnection();
    if (!conn) {
        res.status(500).json({ success: false, error: "Error con la conexion." });
        return;
      }

      if( !req.body.nombre ) {
        res.json({success: false, error: 'Falta el nombre'});
        return;
      }
      if( !req.body.actor ) {
        res.json({success: false, error: 'Falta el actor'});
        return;
      }

      const [results] = await conn.execute (`
        INSERT friends.PersonajesFriends (nombre, actor, ocupación, edad)
        VALUES (?,?,?,?);`,
        [req.body.nombre, req.body.actor, req.body.ocupación, req.body.edad]);

     console.log(results);   
      
     if( results.affectedRows === 1 ) {
        res.json({success: true, id: results.insertId});
      }
      else {
        res.json({success: false, error: 'No insertado'});
      }      

      await conn.close();

  })

  
    
