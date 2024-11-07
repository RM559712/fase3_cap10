

**Origem dos Dados** 
CONAB - Link de acesso a area de downloads 
https://portaldeinformacoes.conab.gov.br/download-arquivos.html

Os arquivos coletados para a implementação da base de dados foram: 
    https://portaldeinformacoes.conab.gov.br/downloads/arquivos/LevantamentoGraos.txt
    https://portaldeinformacoes.conab.gov.br/downloads/arquivos/SerieHistoricaGraos.txt
    Os arquivos também estão salvos em [../source_data/]

**Analise de dados**
Arquivo: Levantamento de Grãos
•	ano_agricola: Ano agrícola (objeto)
•	safra: Tipo de safra (objeto)
•	uf: Unidade federativa (estado) (objeto)
•	produto: Nome do produto agrícola (objeto)
•	id_produto: Identificador numérico do produto (inteiro)
•	id_levantamento: Identificador numérico do levantamento (inteiro)
•	dsc_levantamento: Descrição do levantamento (objeto)
•	area_plantada_mil_ha: Área plantada em mil hectares (float)
•	producao_mil_t: Produção em mil toneladas (float)
•	produtividade_mil_ha_mil_t: Produtividade em mil hectares por mil toneladas (float)
       Arquivo: Série Histórica de Grãos
•	ano_agricola: Ano agrícola (objeto)
•	dsc_safra_previsao: Descrição da safra ou previsão (objeto)
•	uf: Unidade federativa (estado) (objeto)
•	produto: Nome do produto agrícola (objeto)
•	id_produto: Identificador numérico do produto (inteiro)
•	area_plantada_mil_ha: Área plantada em mil hectares (float)
•	producao_mil_t: Produção em mil toneladas (float)
•	produtividade_mil_ha_mil_t: Produtividade em mil hectares por mil toneladas (float)

Para definir as principais entidades e seus relacionamentos, partimos das colunas presentes nos arquivos "Levantamento de Grãos" e 
"Série Histórica de Grãos". As entidades serão estruturadas para representar as informações de maneira eficiente e permitir consultas 
relevantes para análise agrícola.

### 1. Entidades e Atributos

#### **Entidade: AnoAgricola**
- **Descrição**: Representa o ano agrícola, pois ele serve como uma base temporal para os dados.
- **Atributos**:
  - `id_ano_agricola`: Identificador único (PK)
  - `ano_agricola`: Ano agrícola no formato "yyyy/yy" (string)

#### **Entidade: Safra**
- **Descrição**: Contém as informações sobre o tipo de safra, que varia entre "Única", "1ª Safra", "2ª Safra", etc.
- **Atributos**:
  - `id_safra`: Identificador único (PK)
  - `descricao`: Tipo de safra, como "UNICA", "1ª SAFRA" (string)

#### **Entidade: UF (Unidade Federativa)**
- **Descrição**: Representa o estado onde os dados agrícolas foram coletados.
- **Atributos**:
  - `id_uf`: Identificador único (PK)
  - `uf`: Sigla da unidade federativa, como "BA", "CE" (string)

#### **Entidade: Produto**
- **Descrição**: Descreve o tipo de produto agrícola.
- **Atributos**:
  - `id_produto`: Identificador único do produto (PK)
  - `nome_produto`: Nome do produto, como "Algodão em Pluma" (string)

#### **Entidade: Levantamento**
- **Descrição**: Representa os levantamentos realizados sobre a produção agrícola, com uma descrição adicional sobre o levantamento específico.
- **Atributos**:
  - `id_levantamento`: Identificador único (PK)
  - `descricao_levantamento`: Descrição detalhada do levantamento, como "10º Levantamento" (string)

#### **Entidade: Produção**
- **Descrição**: Armazena os dados quantitativos sobre a produção agrícola, incluindo área plantada, produção e produtividade.
- **Atributos**:
  - `id_producao`: Identificador único (PK)
  - `area_plantada_mil_ha`: Área plantada em mil hectares (float)
  - `producao_mil_t`: Produção em mil toneladas (float)
  - `produtividade_mil_ha_mil_t`: Produtividade em mil hectares por mil toneladas (float)
  - `id_ano_agricola`: Chave estrangeira para a entidade `AnoAgricola` (FK)
  - `id_safra`: Chave estrangeira para a entidade `Safra` (FK)
  - `id_uf`: Chave estrangeira para a entidade `UF` (FK)
  - `id_produto`: Chave estrangeira para a entidade `Produto` (FK)
  - `id_levantamento`: Chave estrangeira para a entidade `Levantamento` (FK)

### 2. Relacionamentos

- **AnoAgricola - Produção**: Relacionamento 1:N, onde um ano agrícola pode ter múltiplas entradas de produção.
- **Safra - Produção**: Relacionamento 1:N, onde uma safra pode estar associada a várias produções de diferentes produtos e regiões.
- **UF - Produção**: Relacionamento 1:N, onde um estado (UF) pode ter múltiplas produções.
- **Produto - Produção**: Relacionamento 1:N, onde um produto pode ter múltiplas produções em diferentes estados e safras.
- **Levantamento - Produção**: Relacionamento 1:N, onde um levantamento pode ter múltiplas produções registradas.

Essas entidades e seus relacionamentos proporcionam uma estrutura lógica e organizada para análise agrícola, facilitando consultas detalhadas sobre safras, regiões e produtos ao longo dos anos agrícolas.
