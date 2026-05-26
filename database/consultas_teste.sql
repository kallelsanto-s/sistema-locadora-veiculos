-- ====================================================================
-- SCRIPT DE CONSULTAS PARA TESTE (DASHBOARD E LISTAGENS)
-- ====================================================================

-- 1. CONSULTAS DO DASHBOARD

SELECT 
    (SELECT COUNT(*) FROM veiculos) AS total_veiculos,
    (SELECT COUNT(*) FROM veiculos WHERE status = 'Disponivel') AS veiculos_disponiveis,
    (SELECT COUNT(*) FROM clientes) AS total_clientes;


-- 2. LISTAGEM DE LOCAÇÕES DETALHADA (INNER JOIN)

SELECT 
    l.id AS codigo_locacao,
    c.nome AS nome_cliente,
    c.cpf AS cpf_cliente,
    v.marca || ' ' || v.modelo AS veiculo,
    v.placa,
    l.data_retirada,
    l.data_devolucao,
    l.valor_total
FROM locacoes l
JOIN clientes c ON l.cliente_id = c.id
JOIN veiculos v ON l.veiculo_id = v.id;


-- 3. FILTRO DE VEÍCULOS DISPONÍVEIS

SELECT marca, modelo, placa, valor_diaria 
FROM veiculos 
WHERE status = 'Disponivel'
ORDER BY valor_diaria ASC;
