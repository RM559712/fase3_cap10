SELECT 
    prod."idt_producao",                         -- Identificador único para cada registro de produção.
    prod."qtd_area_plantada_mil_ha",             -- Quantidade de área plantada em mil hectares.
    prod."qtd_producao_mil_t",                   -- Quantidade total de produção em mil toneladas.
    prod."qtd_produtividade_mil_ha_mil_t",       -- Produtividade em mil hectares por mil toneladas.
    prod."idt_ano_agricola",                     -- Identificador do ano agrícola, usado como chave estrangeira.
    ano."num_ano_inicio",                        -- Ano de início do ano agrícola, vindo de T_ANO_AGRICOLA.
    ano."num_ano_fim",                           -- Ano de fim do ano agrícola, também de T_ANO_AGRICOLA.
    prod."idt_safra",                            -- Identificador da safra, usado para categorizar o tipo de safra.
    prod."idt_uf",                               -- Identificador do estado, usado como chave estrangeira.
    prod."idt_produto",                          -- Identificador do produto, usado como chave estrangeira.
    produto."nom_produto"                        -- Nome do produto, vindo de T_PRODUTO.
FROM 
    T_PRODUCAO prod                               -- Tabela principal contendo os dados de produção.
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
    -- Realiza uma junção entre T_PRODUCAO e T_PRODUTO para obter o nome do produto.
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
    -- Realiza uma junção entre T_PRODUCAO e T_ANO_AGRICOLA para obter o ano de início e o ano de fim da safra.
WHERE 
    produto."nom_produto" LIKE '%MILHO%'          -- Filtra registros que contenham a palavra "MILHO" no nome do produto.
    AND ano."num_ano_inicio" = 2021               -- Filtra para o ano de início da safra igual a 2021.
    AND ano."num_ano_fim" = 2022;                 -- Filtra para o ano de fim da safra igual a 2022.
