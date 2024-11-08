```markdown
# Dicionário de Dados

## Tabela: T_PRODUCAO
**Descrição:** Armazena os dados de produção agrícola, incluindo área plantada, produção, produtividade e referências ao ano 
agrícola, safra, estado e produto.

| Coluna                           | Tipo de Dados | Tamanho | Constraint | Descrição                                                               |
|----------------------------------|---------------|---------|------------|-------------------------------------------------------------------------|
| `idt_producao`                   | NUMÉRICO      | 10      | PK         | Identificador único para cada registro de produção.                     |
| `qtd_area_plantada_mil_ha`       | NUMÉRICO      | -       | NN         | Quantidade de área plantada em mil hectares.                            |
| `qtd_producao_mil_t`             | NUMÉRICO      | -       | NN         | Quantidade total de produção em mil toneladas.                          |
| `qtd_produtividade_mil_ha_mil_t` | NUMÉRICO      | -       | NN         | Produtividade em mil hectares por mil toneladas.                        |
| `idt_ano_agricola`               | NUMÉRICO      | 10      | FK, NN     | Referência para o identificador do ano agrícola na tabela `T_ANO_AGRICOLA`. |
| `idt_safra`                      | NUMÉRICO      | 10      | FK, NN     | Referência para o identificador da safra na tabela `T_SAFRA`.           |
| `idt_uf`                         | NUMÉRICO      | 10      | FK, NN     | Referência para o identificador do estado na tabela `T_UF`.             |
| `idt_produto`                    | NUMÉRICO      | 10      | FK, NN     | Referência para o identificador do produto na tabela `T_PRODUTO`.       |

---

## Tabela: T_ANO_AGRICOLA
**Descrição:** Define os anos agrícolas, incluindo o ano de início e fim de cada período.

| Coluna             | Tipo de Dados | Tamanho | Constraint | Descrição                                                          |
|--------------------|---------------|---------|------------|----------------------------------------------------------------------|
| `idt_ano_agricola` | NUMÉRICO      | 10      | PK         | Identificador único para cada ano agrícola.                          |
| `num_ano_inicio`   | NUMÉRICO      | 4       | NN         | Ano de início do período agrícola.                                   |
| `num_ano_fim`      | NUMÉRICO      | 4       | NN, CK     | Ano de fim do período agrícola (verificação: `num_ano_fim >= num_ano_inicio`). |

---

## Tabela: T_SAFRA
**Descrição:** Armazena os tipos de safra utilizados para categorizar os registros de produção agrícola.

| Coluna             | Tipo de Dados | Tamanho | Constraint | Descrição                                |
|--------------------|---------------|---------|------------|------------------------------------------|
| `idt_safra`        | NUMÉRICO      | 10      | PK         | Identificador único para cada tipo de safra. |
| `des_safra`        | TEXTO         | 100     | NN         | Descrição do tipo de safra.              |

---

## Tabela: T_UF
**Descrição:** Armazena informações sobre as unidades federativas (estados) brasileiros.

| Coluna             | Tipo de Dados | Tamanho | Constraint | Descrição                                    |
|--------------------|---------------|---------|------------|----------------------------------------------|
| `idt_uf`           | NUMÉRICO      | 10      | PK         | Identificador único para cada unidade federativa. |
| `sig_uf`           | TEXTO         | 2       | NN, UN     | Sigla da unidade federativa (ex: SP, RJ).    |

---

## Tabela: T_PRODUTO
**Descrição:** Define os produtos agrícolas, como "MILHO", "SOJA", etc.

| Coluna             | Tipo de Dados | Tamanho | Constraint | Descrição                                   |
|--------------------|---------------|---------|------------|---------------------------------------------|
| `idt_produto`      | NUMÉRICO      | 10      | PK         | Identificador único para cada tipo de produto agrícola. |
| `nom_produto`      | TEXTO         | 100     | NN         | Nome do produto agrícola.                   |

---

## Resumo das Constraints

| Constraint | Significado                                                                                 |
|------------|---------------------------------------------------------------------------------------------|
| PK         | Chave primária (Primary Key) – Identificador único.                                         |
| FK         | Chave estrangeira (Foreign Key) – Relaciona esta tabela com outra tabela.                   |
| NN         | Não nulo (Not Null) – Preenchimento obrigatório.                                            |
| NULL       | Nulo – Campo de preenchimento opcional.                                                     |
| UN         | Único (Unique) – Conteúdo sem repetição.                                                    |
| CK         | Check – Validação de domínio (ex: `num_ano_fim >= num_ano_inicio` para garantir consistência). |

---
```