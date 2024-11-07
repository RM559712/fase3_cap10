1TIAOR-2024-GRP100 - Fase 3 - Cap 10 - Explorando SQL e tipos de dados na Oracle 
By Grupo 26 - Entrega até 13/11/2024

1.	Análise de Dados e Identificação de Entidades e Atributos

2.	Criação do Modelo Conceitual (MER)
    o	Criaremos um Modelo Entidade-Relacionamento (MER), destacando as entidades principais (como Produto, Safra, Producao_Anual e Producao_Historica) 
        e os relacionamentos entre elas.
    o	Desenvolver o diagrama MER.

3.	Aplicação das Regras de Normalização
    o	Aplique as regras de normalização para garantir que o modelo não tenha redundâncias e esteja livre de anomalias de atualização.
    o	1ª Forma Normal (1FN): Remover atributos multivalorados e garantir que cada campo contém valores atômicos.
    o	2ª Forma Normal (2FN): Eliminar dependências parciais, garantindo que tabelas com chaves compostas tenham todos os atributos dependentes completamente de sua chave primária.
    o	3ª Forma Normal (3FN): Eliminar dependências transitivas, onde um atributo não chave depende de outro atributo não chave.
    o	Próximo passo: Revisar o modelo MER aplicando essas regras.

4.	Conversão para o Modelo Lógico Relacional
    o	Baseando-se no MER normalizado, crie o Modelo Relacional, convertendo as entidades e relacionamentos do MER para um modelo lógico com tabelas relacionais.
    o	Próximo passo: Desenvolver o diagrama do modelo relacional.

5.	Definição da Nomenclatura Padronizada
    o	Criar uma padronização para os nomes das tabelas e colunas, como tb_produto, id_produto, nome_produto, etc., garantindo que a estrutura seja fácil de entender e mantenha consistência.
    o	Próximo passo: Definir a nomenclatura para cada entidade e seus atributos.

6.	Código SQL para Criação das Tabelas
    o	Escrever o código SQL para a criação das tabelas, definindo chaves primárias e estrangeiras, além das restrições de integridade para garantir consistência nos dados.
    o	Próximo passo: Criar o código SQL baseado no modelo relacional.

7.	Consultas SQL para Análise dos Dados
    o	Baseado nas perguntas fornecidas, desenvolver consultas SQL para:
        	Produção total de uma cultura por estado em uma safra.
        	Evolução da área plantada de uma cultura ao longo dos anos.
        	Ranking dos estados com maior produtividade em uma cultura específica.
    o	Próximo passo: Escrever e testar essas consultas SQL.

8.	Documentação com Dicionário de Dados
    o	Descrever cada tabela e seus atributos, incluindo tipos de dados, restrições e propósito de cada coluna.
    o	Próximo passo: Criar o dicionário de dados que documentará o modelo final.
________________________________________

Entregáveis:
•	Diagrama Entidade-Relacionamento (MER)
•	Diagrama do Modelo Relacional
•	Código SQL para criação das tabelas
•	Consultas SQL para análise dos dados
•	Dicionário de Dados

**Estrutura de Diretório**

**imgs** - Imagens disponiveis dos exercicios listados acima 
**source_data** - Origem dos dados
    - LevantamentoGraos.txt - https://portaldeinformacoes.conab.gov.br/downloads/arquivos/LevantamentoGraos.txt
    - SerieHistoricaGraos.txt - https://portaldeinformacoes.conab.gov.br/downloads/arquivos/SerieHistoricaGraos.txt
    - source_data.zip - Arquivos acima compactados
**sql_modeler_file** - Arquivos relacionados ao Oracle Data Modeler 
**sql_scripts** - Scripts utilizados para a criação do banco, consultas e deleção dos dados
    - consulta_evolucao_de_area_plantada.sql - Arquivo relacionado ao item 7 
    - consulta_producao_total_por_estado.sql - Arquivo relacionado ao item 7 
    - consulta_produtividade_ano_estado.sql - Arquivo relacionado ao item 7
    - data_modeler_producao_agricola.sql - Arquivo de criação do banco - Export do Data Modeler 
    - create_dat_producao_agricola.sql - Arquivo de criação do banco de dados antes da normalizacao
    
