const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const getConnection = require('./db/db');

const app = express();
const port = 4000;

app.use(cors());
app.use(express.json({ limit: '25mb' }));

app.listen(port, () => {
  console.log(`Servidor iniciado escuchando en http://localhost:${port}`);
});

app.get("/api/friends", async (req, res) => {
  const conn = await getConnection();
  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });
    return;
  }

  let selectStmt = 'SELECT * FROM PersonajesFriends PF';
  const values = [];

  if (req.query.incluir_actor && req.query.incluir_actor === 'true') {
    selectStmt = selectStmt = `
        SELECT PF.*, AF.nombreActor 
        FROM PersonajesFriends PF 
        JOIN ActoresFriends AF ON (PF.idActoresFriends = AF.idActoresFriends)`;
  }

  if (req.query.search) {
    selectStmt += " WHERE nombre LIKE ?"
    values.push(`%${req.query.search}%`)
  }

  const [results] = await conn.query(selectStmt, values);

  res.json(results);

  await conn.close();
});

app.post('/api/friends', async (req, res) => {

  console.log(req.body);
  const conn = await getConnection();
  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });
    return;
  }

  if (!req.body.nombre) {
    res.json({ success: false, error: 'Falta el nombre' });
    return;
  }

  const [results] = await conn.execute(`
        INSERT PersonajesFriends (nombre, ocupación, edad)
        VALUES (?,?,?);`,
    [req.body.nombre, req.body.ocupación, req.body.edad]);

  console.log(results);

  if (results.affectedRows === 1) {
    res.json({ success: true, id: results.insertId });
  }
  else {
    res.json({ success: false, error: 'No insertado' });
  }

  await conn.close();

})

app.put('/api/friends/:id', async (req, res) => {
  console.log(req.params, req.body)
  const conn = await getConnection();
  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });
    return;
  }

  const [results] = await conn.execute(`
        UPDATE PersonajesFriends
        SET nombre=?, ocupación=?, edad=?
        WHERE idPersonajesFriends =?`,
    [req.body.nombre, req.body.ocupación, req.body.edad, req.params.id])

  console.log(results);
  if (results.changedRows === 0) {
    res.json({ success: false });
  }
  else {
    res.json({ success: true });
  }
  await conn.close();


})




app.delete('/api/friends/:id', async (req, res) => {
  const conn = await getConnection();
  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });
    return;
  }

  const [results] = await conn.execute(`
        DELETE FROM PersonajesFriends
        WHERE idPersonajesFriends =?`,
    [req.params.id])

  console.log(results);
  if (results.affectedRows === 0) {
    res.json({ success: false });
  }
  else {
    res.json({ success: true });
  }

  await conn.close();
})   
