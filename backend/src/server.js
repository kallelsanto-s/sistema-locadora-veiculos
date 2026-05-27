const express = require('express');
const cors = require('cors');
require('dotenv').config();
require('./config/database');

const app = express();
const port = process.env.PORT || 3000;


app.use(cors());
app.use(express.json());


const veiculosRoutes = require('./routes/veiculosRoutes');


app.use('/api', veiculosRoutes);


app.get('/', (req, res) => {
    res.send('Servidor da Locadora rodando com sucesso!');
});

app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
});
