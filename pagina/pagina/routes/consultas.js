const express = require('express');
const router = express.Router();
const db = require('../db');

const sesiones = new Set();

function autenticado(req, res, next) {
  const token = req.headers['authorization'];
  if (token && sesiones.has(token)) return next();
  return res.status(401).json({ error: 'No autorizado' });
}

// LOGIN
router.post('/login', (req, res) => {
  const { usuario, password } = req.body;
  if (!usuario || !password) return res.status(400).json({ error: 'Faltan datos' });

  db.query(
    'SELECT id, usuario FROM administradores WHERE usuario = ? AND password = ?',
    [usuario, password],
    (err, filas) => {
      if (err) return res.status(500).json({ error: err.message });
      if (filas.length === 0) return res.status(401).json({ error: 'Credenciales inválidas' });
      const token = 'tok_' + Date.now() + '_' + Math.random().toString(36).slice(2);
      sesiones.add(token);
      res.json({ ok: true, token, usuario: filas[0].usuario });
    }
  );
});

// LOGOUT
router.post('/logout', (req, res) => {
  const token = req.headers['authorization'];
  if (token) sesiones.delete(token);
  res.json({ ok: true });
});

// SERVICIOS (público)
router.get('/servicios', (req, res) => {
  db.query('SELECT * FROM servicios ORDER BY id', (err, filas) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(filas);
  });
});

// CREAR CONSULTA (público)
router.post('/consultas', (req, res) => {
  const { nombre, email, telefono, asunto, mensaje } = req.body;
  if (!nombre || !email || !asunto || !mensaje)
    return res.status(400).json({ error: 'Campos obligatorios faltantes' });

  db.query(
    'INSERT INTO consultas (nombre, email, telefono, asunto, mensaje) VALUES (?, ?, ?, ?, ?)',
    [nombre, email, telefono || null, asunto, mensaje],
    (err, resultado) => {
      if (err) return res.status(500).json({ error: err.message });
      res.status(201).json({ ok: true, id: resultado.insertId });
    }
  );
});

// LISTAR (protegido)
router.get('/consultas', autenticado, (req, res) => {
  db.query('SELECT * FROM consultas ORDER BY fecha DESC', (err, filas) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(filas);
  });
});

// DETALLE (protegido)
router.get('/consultas/:id', autenticado, (req, res) => {
  db.query('SELECT * FROM consultas WHERE id = ?', [req.params.id], (err, filas) => {
    if (err) return res.status(500).json({ error: err.message });
    if (filas.length === 0) return res.status(404).json({ error: 'No encontrada' });
    res.json(filas[0]);
  });
});

// MARCAR LEÍDA (protegido)
router.patch('/consultas/:id/leida', autenticado, (req, res) => {
  db.query('UPDATE consultas SET leida = 1 WHERE id = ?', [req.params.id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ ok: true });
  });
});

module.exports = router;