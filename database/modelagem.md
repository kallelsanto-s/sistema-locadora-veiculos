# 🗄️ Modelagem do Banco de Dados (PostgreSQL)

Este documento descreve a estrutura de tabelas, colunas, tipos de dados e os relacionamentos do banco de dados do Sistema de Locadora de Veículos.

---

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


