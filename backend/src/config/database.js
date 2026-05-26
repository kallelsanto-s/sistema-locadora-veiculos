const { Pool } = require('pg');
require('dotenv').config();

// Configura a conexão usando as variáveis do arquivo .env
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

// Testa a conexão assim que o arquivo for carregado
pool.connect((err, client, release) => {
  if (err) {
    return console.error('❌ Erro ao conectar ao PostgreSQL:', err.stack);
  }
  console.log('✅ Conexão com o PostgreSQL estabelecida com sucesso!');
  release();
});

module.exports = pool;