# 📋 Planejamento e Requisitos do Sistema

Este documento apresenta o escopo das telas e as regras funcionais que guiarão o desenvolvimento do Sistema de Locadora de Veículos.

---

## 💻 Telas e Funcionalidades

### 1. Login
* **Objetivo:** Garantir o acesso restrito e seguro ao sistema.
* **Funcionalidades:**
  * [ ] Autenticação de usuários cadastrados (E-mail/Senha).

### 2. Dashboard
* **Objetivo:** Apresentar uma visão analítica e rápida do negócio para o administrador.
* **Métricas exibidas:**
  * [ ] Quantidade total de veículos na frota.
  * [ ] Quantidade de veículos disponíveis no momento.
  * [ ] Quantidade total de clientes cadastrados.

### 3. Gerenciamento de Clientes (CRUD)
* **Objetivo:** Manter o histórico e controle dos locatários.
* **Funcionalidades:**
  * [ ] Cadastro de novos clientes.
  * [ ] Edição de dados cadastrais.
  * [ ] Exclusão de registros.
  * [ ] Listagem de todos os clientes da base.

### 4. Gerenciamento de Veículos (CRUD)
* **Objetivo:** Controlar os automóveis pertencentes à frota da locadora.
* **Funcionalidades:**
  * [ ] Cadastro de novos veículos.
  * [ ] Edição de informações do veículo.
  * [ ] Exclusão de registros.
  * [ ] Controle de disponibilidade (Status: Disponível, Alugado, Manutenção).

### 5. Controle de Locações
* **Objetivo:** Gerenciar o ciclo de vida dos contratos de aluguel.
* **Funcionalidades:**
  * [ ] Registro de novas locações (vínculo entre cliente e veículo).
  * [ ] Controle de devolução (atualização do status do carro).
  * [ ] Cálculo automático do valor total com base no período da locação.

---

## 🔍 Requisitos Funcionais (RF)

Para a especificação técnica do projeto, as funcionalidades acima foram mapeadas nos seguintes requisitos:

| ID | Requisito Funcional | Descrição |
| :--- | :--- | :--- |
| **RF01** | Autenticação | O sistema deve permitir o login de usuários do sistema. |
| **RF02** | Indicadores do Painel | O sistema deve calcular e exibir o total de veículos, carros livres e clientes ativos no Dashboard. |
| **RF03** | CRUD de Clientes | O sistema deve permitir cadastrar, ler, atualizar e deletar clientes. |
| **RF04** | CRUD de Veículos | O sistema deve permitir cadastrar, ler, atualizar e deletar veículos. |
| **RF05** | Controle de Status | O sistema deve alterar o status do veículo automaticamente para "Alugado" ao confirmar uma locação. |
| **RF06** | Registro de Contrato | O sistema deve registrar a data de retirada, data de devolução e calcular o valor final da locação. |
