"use strict";

var mysql = require('mysql');

var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456',
  port: '3306',
  database: 'pqdata'
});
conn.connect();
var zhi = conn.query('select * from user');
console.log(zhi);