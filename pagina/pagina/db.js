const mysql = require('mysql2');

const conexion = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'mc_tech_db'
});

conexion.connect((err) => {
  if (err) return console.error('❌ Error MySQL:', err.message);
  console.log('✅ Conectado a MySQL (mc_tech_db)');
});

module.exports = conexion;