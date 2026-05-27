const db = require('../config/database');


const listarVeiculos = async (req, res) => {
    try {
        const resultado = await db.query('SELECT * FROM veiculos ORDER BY id ASC');
        return res.status(200).json(resultado.rows);
    } catch (error) {
        console.error('Erro ao listar veículos:', error);
        return res.status(500).json({ erro: 'Erro interno ao buscar veículos.' });
    }
};


const cadastrarVeiculo = async (req, res) => {
    
    const { marca, modelo, placa, categoria, valor_diaria, status } = req.body;

    
    if (!marca || !modelo || !placa || !categoria || !valor_diaria) {
        return res.status(400).json({ erro: 'Todos os campos obrigatórios devem ser preenchidos.' });
    }

    try {
        
        const queryTexto = `
            INSERT INTO veiculos (marca, modelo, placa, categoria, valor_diaria, status)
            VALUES ($1, $2, $3, $4, $5, $6)
            RETURNING *;
        `;
        
        
        const valores = [marca, modelo, placa, categoria, valor_diaria, status || 'Disponível'];
        
        const resultado = await db.query(queryTexto, valores);

        
        return res.status(201).json({
            mensagem: 'Veículo cadastrado com sucesso!',
            veiculo: resultado.rows[0]
        });

    } catch (error) {
        console.error('Erro ao cadastrar veículo:', error);
        
        
        if (error.code === '23505') {
            return res.status(400).json({ erro: 'Já existe um veículo cadastrado com esta placa.' });
        }

        return res.status(500).json({ erro: 'Erro interno ao cadastrar veículo.' });
    }
};

// Não esqueça de exportar a nova função aqui no final!
module.exports = {
    listarVeiculos,
    cadastrarVeiculo
};