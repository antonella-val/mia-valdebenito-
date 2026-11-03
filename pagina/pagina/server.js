const express = require('express');
const cors = require('cors');
const path = require('path');

const app = express();
const PUERTO = 3000;

// Middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Conectar las rutas de la API
app.use('/api', require('./routes/consultas'));

// Ruta comodín para el frontend (SPA)
app.use((req, res) => {
  if (!req.path.startsWith('/api')) {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
  } else {
    res.status(404).json({ error: 'Ruta de API no encontrada' });
  }
});

// Arrancar servidor
app.listen(PUERTO, () => {
  console.log(`🚀 Servidor MC TECH en http://localhost:${PUERTO}`);
});
