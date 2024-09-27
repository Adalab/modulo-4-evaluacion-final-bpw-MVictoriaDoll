const express = require("express");
const mysql = require("mysql2/promise");

const cors = require("cors");

const app = express();
const port = 4000;

app.use( cors() );
app.use( express,json({limit: '25mb'}));

const getConnection = require('./db/dbnpm');