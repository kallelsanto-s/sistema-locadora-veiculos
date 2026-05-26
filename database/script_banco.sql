-- Tabela de Usuários (Acesso ao Sistema / Login)
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Tabela de Veículos
CREATE TABLE IF NOT EXISTS veiculos (
    id SERIAL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    placa VARCHAR(7) UNIQUE NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    valor_diaria NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Disponivel' NOT NULL
);

-- Tabela de Locações (Relaciona Cliente e Veículo)
CREATE TABLE IF NOT EXISTS locacoes (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    valor_total NUMERIC(10, 2) NOT NULL,
    
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT,
    CONSTRAINT fk_locacao_veiculo FOREIGN KEY (veiculo_id) REFERENCES veiculos(id) ON DELETE RESTRICT
);

-- ==========================================
-- INSERÇÃO DE DADOS DE TESTE
-- ==========================================

-- Usuário Administrador padrão
INSERT INTO usuarios (nome, email, senha) VALUES 
('Administrador', 'admin@locadora.com', 'admin123');

-- Clientes iniciais
INSERT INTO clientes (nome, cpf, telefone, email) VALUES 
('João Silva', '12345678901', '(41) 99999-1111', 'joao.silva@email.com'),
('Maria Santos', '98765432100', '(11) 98888-2222', 'maria.santos@email.com');

-- Frota inicial de veículos
INSERT INTO veiculos (marca, modelo, placa, categoria, valor_diaria, status) VALUES 
('Volkswagen', 'Gol', 'ABC1D23', 'Hatch', 90.00, 'Disponivel'),
('Chevrolet', 'Onix', 'XYZ9H87', 'Hatch', 110.00, 'Disponivel'),
('Toyota', 'Corolla', 'BRA2E19', 'Sedã', 220.00, 'Disponivel'),
('Jeep', 'Compass', 'LOC3R44', 'SUV', 280.00, 'Alugado');

-- Uma locação inicial registrada
INSERT INTO locacoes (cliente_id, veiculo_id, data_retirada, data_devolucao, valor_total) VALUES 
(1, 4, '2026-05-20', '2026-05-27', 1960.00);
