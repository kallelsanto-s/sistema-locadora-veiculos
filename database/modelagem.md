# Modelagem do Banco de Dados

## Tabela: usuarios

| Campo | Tipo | Descrição |
|---|---|---|
| id | SERIAL | Identificador do usuário |
| nome | VARCHAR(100) | Nome do usuário |
| email | VARCHAR(100) | E-mail do usuário |
| senha | VARCHAR(255) | Senha criptografada |
| tipo_usuario | VARCHAR(20) | Tipo do usuário |

---

## Tabela: clientes

| Campo | Tipo | Descrição |
|---|---|---|
| id | SERIAL | Identificador do cliente |
| nome | VARCHAR(100) | Nome completo |
| cpf | VARCHAR(14) | CPF do cliente |
| telefone | VARCHAR(20) | Telefone |
| email | VARCHAR(100) | E-mail |
| cnh | VARCHAR(20) | Número da CNH |

---

## Tabela: veiculos

| Campo | Tipo | Descrição |
|---|---|---|
| id | SERIAL | Identificador do veículo |
| marca | VARCHAR(50) | Marca do veículo |
| modelo | VARCHAR(50) | Modelo do veículo |
| ano | INT | Ano do veículo |
| placa | VARCHAR(10) | Placa |
| categoria | VARCHAR(30) | Categoria |
| valor_diaria | DECIMAL(10,2) | Valor da diária |
| status | VARCHAR(20) | Disponibilidade |

---

## Tabela: locacoes

| Campo | Tipo | Descrição |
|---|---|---|
| id | SERIAL | Identificador da locação |
| cliente_id | INT | Cliente responsável |
| veiculo_id | INT | Veículo alugado |
| data_retirada | DATE | Data retirada |
| data_devolucao | DATE | Data devolução |
| valor_total | DECIMAL(10,2) | Valor total |
| status | VARCHAR(20) | Status da locação |
