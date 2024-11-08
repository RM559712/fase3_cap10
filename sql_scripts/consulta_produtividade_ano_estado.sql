-- Título: Produtividade Média de MILHO por Estado e Ano com Anos como Colunas
-- Descrição: Este script calcula a produtividade média de MILHO por estado,
--            organiza os anos em colunas e exibe a média por ano e estado.
-- Data: 08/11/2024
-- Hora: 18:00

-- Exibe o título da tabela
SELECT 'Produtividade Ano x Estado - Mil HA x Mil T' AS "Título" FROM dual;

-- Cálculo da produtividade média de MILHO por estado e ano
SELECT 
    uf."sig_uf" AS "Estado",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2017 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2017",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2018 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2018",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2019 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2019",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2020 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2020",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2021 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2021",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2022 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2022",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2023 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2023",
    ROUND(AVG(CASE WHEN ano."num_ano_inicio" = 2024 THEN prod."qtd_produtividade_mil_ha_mil_t" END), 2) AS "2024"
FROM 
    T_PRODUCAO prod
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
JOIN 
    T_UF uf ON prod."idt_uf" = uf."idt_uf"
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
WHERE 
    produto."nom_produto" LIKE '%MILHO%'  -- Filtra registros para incluir apenas MILHO
GROUP BY 
    uf."sig_uf"  -- Agrupa os resultados por estado para mostrar a média por ano e estado
ORDER BY 
    uf."sig_uf";  -- Ordena os resultados alfabeticamente por estado
