const express = require('express');
const app = express();
require('./config/database'); 

const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
    res.json({ mensagem: "Backend da Locadora rodando com sucesso!" });
});

app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando na porta http://localhost:${PORT}`);
});
