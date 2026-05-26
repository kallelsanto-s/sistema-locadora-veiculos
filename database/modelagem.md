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

📐 Dicionário de Dados (Tabelas)1. Tabela: usuariosResponsável por armazenar as credenciais de acesso para a tela de Login.CampoTipoDescriçãoid (PK)SERIALIdentificador único do usuário e autoincrementável.nomeVARCHAR(100)Nome completo do funcionário/administrador.emailVARCHAR(100)E-mail utilizado para login (Deve ser ÚNICO).senhaVARCHAR(255)Hash da senha criptografada para segurança do acesso.2. Tabela: clientesArmazena as informações cadastrais dos locatários (CRUD Clientes).CampoTipoDescriçãoid (PK)SERIALIdentificador único do cliente e autoincrementável.nomeVARCHAR(100)Nome completo do cliente.cpfVARCHAR(11)CPF do cliente, armazenando apenas os 11 números (Deve ser ÚNICO).telefoneVARCHAR(15)Número de contato com DDD.emailVARCHAR(100)E-mail principal de contato do cliente.3. Tabela: veiculosArmazena os dados da frota da locadora e o controle de disponibilidade (CRUD Veículos).CampoTipoDescriçãoid (PK)SERIALIdentificador único do veículo e autoincrementável.marcaVARCHAR(50)Fabricante do automóvel (Ex: Volkswagen, Chevrolet).modeloVARCHAR(50)Modelo do carro (Ex: Gol, Onix).placaVARCHAR(7)Placa de identificação veicular no padrão Mercosul/Antigo (Deve ser ÚNICO).categoriaVARCHAR(30)Categoria do automóvel (Ex: Hatch, Sedã, SUV).valor_diariaNUMERIC(10,2)Preço cobrado por cada diária de aluguel.statusVARCHAR(20)Estado de disponibilidade (Padrão: 'Disponivel', 'Alugado', 'Manutencao').4. Tabela: locacoesRegistra a movimentação dos contratos de aluguel, vinculando os clientes aos veículos.CampoTipoDescriçãoid (PK)SERIALIdentificador único da locação e autoincrementável.cliente_id (FK)INTChave Estrangeira que aponta para o ID do cliente que realizou o aluguel.veiculo_id (FK)INTChave Estrangeira que aponta para o ID do veículo utilizado.data_retiradaDATEData exata em que o veículo foi retirado pelo cliente.data_devolucaoDATEData agendada ou real da devolução do automóvel.valor_totalNUMERIC(10,2)Custo total final do contrato calculado pelo sistema.

