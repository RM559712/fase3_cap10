SELECT 
    ano."num_ano_inicio" AS "Ano",  -- Seleciona o ano de início da safra, renomeando a coluna como "Ano" para facilitar a leitura.
    uf."sig_uf" AS "Estado",        -- Seleciona a sigla do estado (UF) e a renomeia como "Estado".
    ROUND(AVG(prod."qtd_produtividade_mil_ha_mil_t"), 2) AS "Produtividade Média (Mil Hectares/Mil Toneladas)"
    -- Calcula a produtividade média de cada estado em cada ano, arredondando o valor para 2 casas decimais
    -- e renomeia a coluna como "Produtividade Média (Mil Hectares/Mil Toneladas)".
FROM 
    T_PRODUCAO prod                -- Tabela que contém os dados de produção, incluindo área plantada e produtividade.
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
    -- Realiza uma junção com a tabela T_ANO_AGRICOLA para obter o ano de início e fim da safra.
    -- Relaciona as tabelas usando a coluna idt_ano_agricola como chave estrangeira.
JOIN 
    T_UF uf ON prod."idt_uf" = uf."idt_uf"
    -- Realiza uma junção com a tabela T_UF para obter a sigla do estado.
    -- Relaciona as tabelas usando a coluna idt_uf como chave estrangeira.
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
    -- Realiza uma junção com a tabela T_PRODUTO para obter o nome do produto.
    -- Relaciona as tabelas usando a coluna idt_produto como chave estrangeira.
WHERE 
    produto."nom_produto" LIKE '%MILHO%'  -- Filtra os registros para incluir apenas aqueles onde o nome do produto contém "MILHO".
GROUP BY 
    ano."num_ano_inicio", uf."sig_uf"     -- Agrupa os resultados por ano e estado para calcular a produtividade média de cada combinação.
ORDER BY 
    "Ano" ASC,                            -- Ordena os resultados por ano em ordem crescente.
    "Produtividade Média (Mil Hectares/Mil Toneladas)" DESC; -- Dentro de cada ano, ordena os estados pela produtividade média em ordem decrescente.
