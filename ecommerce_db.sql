-- Criação das tabelas

-- Tabela de Endereço
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    logradouro VARCHAR(255),
    numero VARCHAR(50),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

-- Tabela de Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(14) UNIQUE,
    cnpj VARCHAR(18) UNIQUE,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(20),
    data_cadastro DATE
);

-- Tabela de Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255),
    cnpj VARCHAR(18) UNIQUE,
    endereco VARCHAR(255)
);

-- Tabela de Estoque
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    localizacao_estoque VARCHAR(255),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto) ON DELETE CASCADE
);

-- Tabela de Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor) ON DELETE CASCADE
);

-- Tabela de Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status ENUM('Em processamento', 'Enviado', 'Cancelado', 'Entregue') NOT NULL,
    data_entrega_prevista DATE,
    valor_total DECIMAL(10, 2),
    frete DECIMAL(10, 2),
    periodo_carencia_devolucao INT, -- Em dias
    endereco_entrega INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (endereco_entrega) REFERENCES Endereco(id_endereco) ON DELETE CASCADE
);

-- Tabela de Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    forma_pagamento ENUM('Cartão de crédito', 'Boleto', 'Pix') NOT NULL,
    status_pagamento ENUM('Aprovado', 'Pendente', 'Rejeitado') NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE
);

-- Tabela de Produto_Pedido (Relacionamento N:M entre Pedido e Produto)
CREATE TABLE Produto_Pedido (
    id_produto_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto) ON DELETE CASCADE
);

-- Tabela de Entrega
CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    status_entrega ENUM('Em trânsito', 'Entregue', 'Pendente') NOT NULL,
    codigo_rastreio VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE
);

