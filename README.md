1TIAOR-2024-GRP100 - Fase 3 - Cap 10 - Explorando SQL e tipos de dados na Oracle 
By Grupo 26 - Entrega até 13/11/2024

# Passos para cada entrega

1.	[Análise de Dados e Identificação de Entidades e Atributos](https://github.com/RM559712/fase3_cap10/blob/main/docs/1_Analise_de_Dados_e_Ident_Entidades_Atrib.md)  
    
2.	Criação do Modelo Conceitual (MER)  
- Criaremos um Modelo Entidade-Relacionamento (MER), destacando as entidades principais (como Produto, Safra, Producao_Anual e Producao_Historica) 
  e os relacionamentos entre elas.  
    ![Diagrama MER](https://github.com/RM559712/fase3_cap10/blob/main/imgs/MER_Logical_Image_07Nov24v1.png)

3.	[Aplicação das Regras de Normalização](https://github.com/RM559712/fase3_cap10/blob/main/docs/2_Modelo_Conceitual_MER.md)
   
4.	Conversão para o Modelo Lógico Relacional
- Baseando-se no MER normalizado, crie o Modelo Relacional, convertendo as entidades e relacionamentos do MER para um modelo lógico com tabelas relacionais.
![Diagrama do Modelo Relacional](https://github.com/RM559712/fase3_cap10/blob/main/imgs/Relational_Image_07Nov24v1.png)

5.	Definição da Nomenclatura Padronizada
- Criar uma padronização para os nomes das tabelas e colunas, como tb_produto, id_produto, nome_produto, etc., garantindo que a estrutura seja fácil de entender e   mantenha consistência.
- [Nomenclatura para cada entidade e seus atributos.](https://github.com/RM559712/fase3_cap10/blob/main/docs/5_Nomenclatura_Entidades_Atributos.md)

6.	Código SQL para Criação das Tabelas
- Escrever o código SQL para a criação das tabelas, definindo chaves primárias e estrangeiras, além das restrições de integridade para garantir consistência nos dados.
- [Códigos SQL baseado no modelo relacional.](https://github.com/RM559712/fase3_cap10/blob/main/sql_scripts/create_dat_producao_agricola.sql)

7.	Consultas SQL para Análise dos Dados  
- Baseado nas perguntas fornecidas, desenvolver consultas SQL para:
    Produção total de uma cultura por estado em uma safra.
    Evolução da área plantada de uma cultura ao longo dos anos.
    Ranking dos estados com maior produtividade em uma cultura específica.
- [Escrever e testar essas consultas SQL.](https://github.com/RM559712/fase3_cap10/blob/main/docs/7_Consultas_SQL_para_Analise_dos_Dados.md)

8.	Documentação com Dicionário de Dados
    o	Descrever cada tabela e seus atributos, incluindo tipos de dados, restrições e propósito de cada coluna.
    o	Próximo passo: Criar o dicionário de dados que documentará o modelo final.

# Resumo dos Entregáveis:  
•	Diagrama Entidade-Relacionamento (MER)  
•	Diagrama do Modelo Relacional  
•	Código SQL para criação das tabelas  
•	Consultas SQL para análise dos dados  
•	Dicionário de Dados  

# **Estrutura de Diretório**

**imgs** - Imagens disponiveis dos exercicios listados acima <br>
**source_data** - Origem dos dados <br>
    - LevantamentoGraos.txt - https://portaldeinformacoes.conab.gov.br/downloads/arquivos/LevantamentoGraos.txt<br>
    - SerieHistoricaGraos.txt - https://portaldeinformacoes.conab.gov.br/downloads/arquivos/SerieHistoricaGraos.txt <br>
    - source_data.zip - Arquivos acima compactados <br>
**sql_modeler_file** - Arquivos relacionados ao Oracle Data Modeler <br>
**sql_scripts** - Scripts utilizados para a criação do banco, consultas e deleção dos dados <br>
    - consulta_evolucao_de_area_plantada.sql - Arquivo relacionado ao item 7 <br>
    - consulta_producao_total_por_estado.sql - Arquivo relacionado ao item 7 <br>
    - consulta_produtividade_ano_estado.sql - Arquivo relacionado ao item 7<br>
    - data_modeler_producao_agricola.sql - Arquivo de criação do banco - Export do Data Modeler <br>
    - create_dat_producao_agricola.sql - Arquivo de criação do banco de dados antes da normalizacao<br>
**docs** - Arquivos com informações sobre cada exercicio por ordem listada na descricao dos exercicios<br>
    - Analise de dados e Identificacao de Entidades e Atributos [docs/1_Analise_de_Dados_e_Ident_Entidades_Atrib.md]

