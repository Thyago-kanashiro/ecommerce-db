# E-commerce Database Project

Este projeto consiste em um banco de dados para um sistema de e-commerce, desenvolvido como parte de um bootcamp de banco de dados. O sistema inclui funcionalidades para gerenciar produtos, clientes, pedidos, fornecedores, pagamentos, e entregas.

## Estrutura do Banco de Dados

O banco de dados foi projetado para suportar as seguintes entidades e relacionamentos:

1. **Produto**: Contém informações sobre os produtos vendidos no e-commerce, incluindo vendedores (terceiros), fornecedores e estoque.
2. **Cliente**: Pode ser uma pessoa física (PF) ou jurídica (PJ), com informações de endereço e formas de pagamento.
3. **Pedido**: Representa uma compra feita por um cliente. Um pedido pode conter múltiplos produtos e possui informações sobre entrega e status.
4. **Fornecedor**: Fornecedores que fornecem os produtos vendidos no e-commerce. Cada fornecedor tem uma razão social e CNPJ.
5. **Estoque**: Controle do estoque de produtos, incluindo quantidade e local.
6. **Pagamento**: Formas de pagamento cadastradas para os clientes, como cartão de crédito, boleto, etc.
7. **Entrega**: Informações sobre o status da entrega e código de rastreamento do pedido.

## Melhorias Implementadas

Durante o desenvolvimento do banco de dados, várias melhorias e refinamentos foram implementados para tornar o sistema mais robusto e flexível:

### 1. **Clientes PJ e PF**
   - Agora, a plataforma suporta tanto clientes pessoa física (PF) quanto pessoa jurídica (PJ). Cada cliente pode ser de apenas um tipo, e não ambos ao mesmo tempo.
   
### 2. **Gestão de Pagamento**
   - Foi implementado o suporte para múltiplas formas de pagamento. Isso permite que os clientes escolham entre diferentes métodos de pagamento no momento da compra.

### 3. **Controle de Entrega**
   - O sistema agora permite o acompanhamento de pedidos, incluindo o status da entrega e o código de rastreamento. Isso melhora a experiência do cliente, que pode acompanhar o progresso da entrega de seus pedidos.

### 4. **Estoque e Fornecedores**
   - Foi adicionada uma tabela de **estoque** para controlar a quantidade de produtos disponíveis para venda e o local de armazenamento. Além disso, a tabela de **fornecedores** foi aprimorada com dados completos, como razão social e CNPJ.

## Diagrama do Banco de Dados

O modelo do banco de dados foi desenhado para atender aos requisitos de um sistema de e-commerce, com um relacionamento eficiente entre as tabelas de **Produto**, **Cliente**, **Pedido**, **Fornecedor**, **Estoque**, **Pagamento** e **Entrega**. O diagrama ER (Entidade-Relacionamento) foi elaborado para garantir a integridade e a normalização dos dados.

![Diagrama do Banco de Dados](diagrama_er.png)
