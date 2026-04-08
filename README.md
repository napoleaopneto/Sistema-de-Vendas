# Sistema-de-Vendas

# 🧾 Sistema de Pedidos de Venda (Delphi + MySQL)

Projeto desenvolvido como teste técnico para vaga de **Programador Delphi**, com foco em:
- Manipulação de dados via SQL
- Modelagem de banco de dados
- Interface com usuário (VCL)
- Boas práticas de código e orientação a objetos

---

## 📌 Objetivo

Desenvolver uma tela de **Pedidos de Venda**, permitindo:
- Seleção de cliente
- Inserção, edição e remoção de produtos
- Cálculo automático de totais
- Persistência dos dados em banco MySQL com integridade e transações

---

## 🛠️ Tecnologias Utilizadas

- **Delphi (VCL)**
- **MySQL**
- SQL (ênfase em comandos diretos)
- Programação Orientada a Objetos (POO)

---

## 🗄️ Estrutura do Banco de Dados

### 📍 Tabela: `clientes`
| Campo   | Tipo        | Descrição          |
|--------|------------|--------------------|
| codigo | INT (PK)   | Código do cliente  |
| nome   | VARCHAR    | Nome               |
| cidade | VARCHAR    | Cidade             |
| uf     | CHAR(2)    | Estado             |

---

### 📍 Tabela: `produtos`
| Campo        | Tipo      | Descrição              |
|-------------|----------|------------------------|
| codigo      | INT (PK) | Código do produto      |
| descricao   | VARCHAR  | Descrição              |
| preco_venda | DECIMAL  | Preço de venda         |

---

### 📍 Tabela: `pedidos`
| Campo          | Tipo      | Descrição              |
|---------------|----------|------------------------|
| numero_pedido | INT (PK) | Número do pedido       |
| data_emissao  | DATE     | Data de emissão        |
| codigo_cliente| INT (FK) | Cliente                |
| valor_total   | DECIMAL  | Valor total do pedido  |

---

### 📍 Tabela: `pedidos_produtos`
| Campo          | Tipo        | Descrição                  |
|---------------|------------|----------------------------|
| id            | INT (PK AI)| Identificador              |
| numero_pedido | INT (FK)   | Número do pedido           |
| codigo_produto| INT        | Código do produto          |
| quantidade    | DECIMAL    | Quantidade                 |
| valor_unitario| DECIMAL    | Valor unitário             |
| valor_total   | DECIMAL    | Total do item              |

---

## 🔗 Relacionamentos

- `pedidos.codigo_cliente` → `clientes.codigo`
- `pedidos_produtos.numero_pedido` → `pedidos.numero_pedido`

---

## ⚙️ Funcionalidades

### 🧍 Cliente
- Informar código do cliente (sem necessidade de cadastro na tela)

---

### 📦 Produtos no Pedido
- Inserção via:
  - Código do produto
  - Quantidade
  - Valor unitário
- Exibição em **grid** com:
  - Código
  - Descrição
  - Quantidade
  - Valor unitário
  - Valor total

---

### ✏️ Edição e Exclusão
- **ENTER**: editar item selecionado
- **DEL**: excluir item com confirmação
- Permite produtos repetidos

---

### 🧮 Cálculo
- Soma automática do valor total do pedido (rodapé)

---

### 💾 Gravação do Pedido
- Botão **GRAVAR PEDIDO**
- Salva:
  - Tabela `pedidos`
  - Tabela `pedidos_produtos`
- Utiliza **transação** para garantir integridade
- Número do pedido:
  - Sequencial
  - Sem duplicidade (PK)

---

### 🔄 Carregar Pedido
- Disponível quando **cliente não informado**
- Solicita número do pedido
- Carrega:
  - Cliente
  - Produtos no grid

---

### ❌ Excluir Pedido
- Disponível quando **cliente não informado**
- Solicita número do pedido
- Remove dados de:
  - `pedidos`
  - `pedidos_produtos`

---

## 📊 Regras Técnicas

- Uso obrigatório de **SQL direto** para:
  - INSERT
  - UPDATE
  - DELETE
- Criação de:
  - **PKs**
  - **FKs**
  - **Índices**
- Tabelas `clientes` e `produtos` devem conter **mínimo 20 registros para teste**
- Uso de **transações** com tratamento de erros
- Código estruturado com **POO**
