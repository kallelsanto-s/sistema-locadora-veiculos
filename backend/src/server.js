const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// 🚀 IMPORTAR AS ROTAS DE VEÍCULOS
const veiculosRoutes = require('./routes/veiculosRoutes');

// 🔌 USAR AS ROTAS NO SERVIDOR
app.use('/api', veiculosRoutes);

// Rota de teste inicial (pode manter se já existia)
app.get('/', (req, res) => {
    res.send('Servidor da Locadora rodando com sucesso!');
});

app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
});