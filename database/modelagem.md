# 🗄️ Modelagem do Banco de Dados (PostgreSQL)

Este documento descreve a estrutura de tabelas, colunas, tipos de dados e os relacionamentos do banco de dados do Sistema de Locadora de Veículos.

---
## 📐 Dicionário de Dados (Tabelas)

### 1. Tabela: `usuarios`
Responsável por armazenar as credenciais de acesso para a tela de Login.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| **id** (PK) | SERIAL | Identificador único do usuário e autoincrementável. |
| nome | VARCHAR(100) | Nome completo do funcionário/administrador. |
| email | VARCHAR(100) | E-mail utilizado para login (Deve ser ÚNICO). |
| senha | VARCHAR(255) | Hash da senha criptografada para segurança do acesso. |

---

### 2. Tabela: `clientes`
Armazena as informações cadastrais dos locatários (CRUD Clientes).

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| **id** (PK) | SERIAL | Identificador único do cliente e autoincrementável. |
| nome | VARCHAR(100) | Nome completo do cliente. |
| cpf | VARCHAR(11) | CPF do cliente, armazenando apenas os 11 números (Deve ser ÚNICO). |
| telefone | VARCHAR(15) | Número de contato com DDD. |
| email | VARCHAR(100) | E-mail principal de contato do cliente. |

---

### 3. Tabela: `veiculos`
Armazena os dados da frota da locadora e o controle de disponibilidade (CRUD Veículos).

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| **id** (PK) | SERIAL | Identificador único do veículo e autoincrementável. |
| marca | VARCHAR(50) | Fabricante do automóvel (Ex: Volkswagen, Chevrolet). |
| modelo | VARCHAR(50) | Modelo do carro (Ex: Gol, Onix). |
| placa | VARCHAR(7) | Placa de identificação veicular no padrão Mercosul/Antigo (Deve ser ÚNICO). |
| categoria | VARCHAR(30) | Categoria do automóvel (Ex: Hatch, Sedã, SUV). |
| valor_diaria | NUMERIC(10,2) | Preço cobrado por cada diária de aluguel. |
| status | VARCHAR(20) | Estado de disponibilidade (Padrão: 'Disponivel', 'Alugado', 'Manutencao'). |

---

### 4. Tabela: `locacoes`
Registra a movimentação dos contratos de aluguel, vinculando os clientes aos veículos.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| **id** (PK) | SERIAL | Identificador único da locação e autoincrementável. |
| **cliente_id** (FK) | INT | Chave Estrangeira que aponta para o ID do cliente que realizou o aluguel. |
| **veiculo_id** (FK) | INT | Chave Estrangeira que aponta para o ID do veículo utilizado. |
| data_retirada | DATE | Data exata em que o veículo foi retirado pelo cliente. |
| data_devolucao | DATE | Data agendada ou real da devolução do automóvel. |
| valor_total | NUMERIC(10,2) | Custo total final do contrato calculado pelo sistema. |

## 📊 Diagrama Entidade-Relacionamento (ER)

O gráfico abaixo mostra graficamente como as tabelas se relacionam através das chaves primárias (PK) e estrangeiras (FK). O GitHub renderiza este desenho de forma automática:

```mermaid
erDiagram
    usuarios {
        int id PK
        string nome
        string email UK
        string senha
    }

    clientes {
        int id PK
        string nome
        string cpf UK
        string telefone
        string email
    }

    veiculos {
        int id PK
        string marca
        string modelo
        string placa UK
        string categoria
        numeric valor_diaria
        string status
    }

    locacoes {
        int id PK
        int cliente_id FK
        int veiculo_id FK
        date data_retirada
        date data_devolucao
        numeric valor_total
    }

    clientes ||--o{ locacoes : "possui"
    veiculos ||--o{ locacoes : "recebe"


