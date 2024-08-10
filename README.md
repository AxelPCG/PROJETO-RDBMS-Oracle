# Projeto: Melhores Compras SGV (Sistema de Gerenciamento de Vídeos)

## Visão Geral

Este repositório contém a implementação do modelo de banco de dados para o sistema de gerenciamento de vídeos "Melhores Compras". O objetivo deste sistema é gerenciar clientes, produtos, categorias de produtos, funcionários, endereços e outras entidades relacionadas ao funcionamento de uma loja de e-commerce focada em vídeos.

## Estrutura do Banco de Dados

### Tabelas Principais

#### 1. MC_CIDADE
Armazena informações sobre as cidades.

- **CD_CIDADE**: Identificador único da cidade.
- **SG_ESTADO**: Sigla do estado.
- **NM_CIDADE**: Nome da cidade.
- **CD_IBGE**: Código IBGE da cidade.
- **NR_DDD**: Código de DDD.

#### 2. MC_DEPTO
Armazena informações sobre os departamentos da empresa.

- **CD_DEPTO**: Identificador único do departamento.
- **NM_DEPTO**: Nome do departamento.
- **ST_DEPTO**: Status do departamento (ativo/inativo).

#### 3. MC_CLI_FISICA
Armazena informações de clientes pessoas físicas.

- **NR_CLIENTE**: Identificador único do cliente.
- **DT_NASCIMENTO**: Data de nascimento do cliente.
- **FL_SEXO_BIOLOGICO**: Sexo biológico do cliente.
- **DS_GENERO**: Descrição do gênero.
- **NR_CPF**: CPF do cliente.

#### 4. MC_END_CLI
Armazena informações de endereços dos clientes.

- **NR_CLIENTE**: Identificador do cliente.
- **CD_LOGRADOURO_CLI**: Identificador do logradouro.
- **NR_END**: Número do endereço.
- **DS_COMPLEMENTO_END**: Complemento do endereço.
- **DT_INICIO**: Data de início de vigência do endereço.
- **DT_TERMINO**: Data de término de vigência do endereço.
- **ST_END**: Status do endereço (ativo/inativo).

#### 5. MC_FUNCIONARIO
Armazena informações sobre os funcionários da empresa.

- **CD_FUNCIONARIO**: Identificador único do funcionário.
- **CD_DEPTO**: Identificador do departamento ao qual o funcionário pertence.
- **CD_GERENTE**: Identificador do gerente do funcionário.
- **NM_FUNCIONARIO**: Nome do funcionário.
- **DT_NASCIMENTO**: Data de nascimento do funcionário.
- **FL_SEXO_BIOLOGICO**: Sexo biológico do funcionário.
- **DS_GENERO**: Descrição do gênero.
- **DS_CARGO**: Cargo ocupado pelo funcionário.
- **VL_SALARIO**: Salário do funcionário.
- **DS_EMAIL**: E-mail do funcionário.
- **ST_FUNC**: Status do funcionário (ativo/inativo).
- **DT_CADASTRAMENTO**: Data de cadastramento do funcionário.
- **DT_DESLIGAMENTO**: Data de desligamento do funcionário.

#### 6. MC_CLIENTE
Armazena informações gerais sobre os clientes.

- **NR_CLIENTE**: Identificador único do cliente.
- **NM_CLIENTE**: Nome do cliente.
- **QT_ESTRELAS**: Quantidade de estrelas do cliente.
- **VL_MEDIO_COMPRA**: Valor médio das compras do cliente.
- **ST_CLIENTE**: Status do cliente (ativo/inativo).
- **DS_EMAIL**: E-mail do cliente.
- **NR_TELEFONE**: Telefone do cliente.
- **NM_LOGIN**: Nome de login do cliente.
- **DS_SENHA**: Senha do cliente.

#### 7. MC_PRODUTO
Armazena informações sobre os produtos.

- **CD_PRODUTO**: Identificador único do produto.
- **CD_CATEGORIA**: Identificador da categoria do produto.
- **NR_CD_BARRAS_PROD**: Código de barras do produto.
- **DS_PRODUTO**: Descrição do produto.
- **VL_UNITARIO**: Valor unitário do produto.
- **TP_EMBALAGEM**: Tipo de embalagem do produto.
- **ST_PRODUTO**: Status do produto (ativo/inativo).
- **VL_PERC_LUCRO**: Percentual de lucro do produto.
- **DS_COMPLETA_PROD**: Descrição completa do produto.

#### 8. MC_CATEGORIA_PROD
Armazena informações sobre as categorias de produtos.

- **CD_CATEGORIA**: Identificador único da categoria.
- **TP_CATEGORIA**: Tipo de categoria.
- **DS_CATEGORIA**: Descrição da categoria.
- **DT_INICIO**: Data de início da categoria.
- **DT_TERMINO**: Data de término da categoria.
- **ST_CATEGORIA**: Status da categoria (ativa/inativa).

#### 9. MC_SGV_SAC
Armazena informações sobre os registros de atendimento ao cliente (SAC).

- **NR_SAC**: Identificador único do SAC.
- **NR_CLIENTE**: Identificador do cliente.
- **CD_PRODUTO**: Identificador do produto.
- **CD_FUNCIONARIO**: Identificador do funcionário.
- **DS_DETALHADA_SAC**: Descrição detalhada do SAC.
- **DT_ABERTURA_SAC**: Data de abertura do SAC.
- **HR_ABERTURA_SAC**: Hora de abertura do SAC.
- **DT_ATENDIMENTO**: Data de atendimento do SAC.
- **HR_ATENDIMENTO_SAC**: Hora de atendimento do SAC.
- **NR_TEMPO_TOTAL_SAC**: Tempo total do SAC.
- **DS_DETALHADA_RETORNO_SAC**: Descrição detalhada do retorno do SAC.
- **TP_SAC**: Tipo de SAC.
- **ST_SAC**: Status do SAC.
- **NR_INDICE_SATISFACAO**: Índice de satisfação do SAC.

### Relacionamentos

Os relacionamentos entre as tabelas foram definidos com base nas chaves primárias e estrangeiras, garantindo a integridade referencial dos dados.

### Scripts

- **Criação de Tabelas**: Scripts para a criação de todas as tabelas descritas acima.
- **Consultas DML**: Scripts para inserção, atualização e exclusão de dados.
- **Consultas Anônimas**: Exemplos de consultas SQL utilizando blocos PL/SQL anônimos para manipulação dos dados.

## Descrição dos Arquivos

1. **comandos_DQL.sql**: Contém scripts de consulta DQL (Data Query Language) para realizar operações de seleção de dados.

2. **Gabarito_ProjetoFisico_SGV_MelhoresCompras.pdf**: Documento que contém a descrição detalhada da estrutura física do banco de dados, incluindo tabelas, campos, e relacionamentos.

3. **Gabarito_ProjetoLogico_SGV_MelhoresCompras.pdf**: Documento que detalha o projeto lógico do banco de dados, especificando as entidades, atributos e seus relacionamentos.

4. **script_bloco_anonimo.sql**: Contém scripts PL/SQL que utilizam blocos anônimos para operações lógicas e manipulação de dados no banco de dados.

5. **script_DDL.sql**: Script de criação de tabelas e outros objetos de banco de dados (Data Definition Language).

6. **script_DML.sql**: Script para operações de inserção, atualização e exclusão de dados (Data Manipulation Language).

7. **script_funcao_icms.sql**: Contém a criação de uma função específica para o cálculo de ICMS (Imposto sobre Circulação de Mercadorias e Serviços) dentro do banco de dados.

## Instruções de Uso

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/melhores-compras-sgv.git
