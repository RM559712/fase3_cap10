# Aplicação das Regras de Normalização

Aplique as regras de normalização para garantir que o modelo não tenha redundâncias e esteja livre de anomalias de atualização.

## 1ª Forma Normal (1FN): Remover atributos multivalorados e garantir que cada campo contenha valores atômicos.

- **Tabela T_ANO_AGRICOLA**: O campo `txt_ano_agricola` representa, em alguns casos, um ano de início e um ano de fim, sendo considerado multivalorado.
- Na tabela `T_ANO_AGRICOLA`, o atributo `ano_agricola` possui o ano agrícola no formato `"yyyy/yy"` (por exemplo, "2017/18"), representando um intervalo entre um ano inicial e um ano final. Embora o valor seja armazenado como uma única string, ele carrega mais de uma informação (ano inicial e ano final).
- Podemos considerar isso como uma violação da 1ª Forma Normal (1FN), pois o valor não é completamente atômico. Este tipo de informação pode ser decomposto em duas colunas separadas para evitar a mistura de dados.

**Solução para Tornar o Valor Atômico**  
Para tornar o atributo `ano_agricola` totalmente atômico e evitar que seja tratado como multivalorado, podemos dividi-lo em duas colunas distintas:
- `ano_inicio`: Representa o ano inicial (primeiro ano do período).
- `ano_fim`: Representa o ano final (último ano do período).

**Atualização do Modelo**  
Após essa alteração, a tabela `T_ANO_AGRICOLA` ficaria assim:  
----------------------------------------------------------------
| Coluna            | Descrição                                |
|-------------------|------------------------------------------|
| `idt_ano_agricola`| Identificador único (PK)                 |
| `num_ano_inicio`  | Ano inicial do período (NUMBER(4))       |
| `num_ano_fim`     | Ano final do período (NUMBER(4))         |
----------------------------------------------------------------

**Exemplo**  
Se o valor original fosse `"2017/18"`, ele seria dividido em:
- `ano_inicio`: 2017
- `ano_fim`: 2018

**Atualização no Script de Criação da Tabela**

```sql
-- 1. Adicionar as novas colunas num_ano_inicio e num_ano_fim como NUMBER(4)
ALTER TABLE T_ANO_AGRICOLA ADD ("num_ano_inicio" NUMBER(4));
ALTER TABLE T_ANO_AGRICOLA ADD ("num_ano_fim" NUMBER(4));

-- 2. Atualizar as colunas num_ano_inicio e num_ano_fim a partir do valor atual de txt_ano_agricola
UPDATE T_ANO_AGRICOLA
SET 
    "num_ano_inicio" = TO_NUMBER(SUBSTR("txt_ano_agricola", 1, 4)), -- Extrai os primeiros 4 caracteres e converte para NUMBER
    "num_ano_fim" = TO_NUMBER('20' || SUBSTR("txt_ano_agricola", -2, 2)); -- Extrai os últimos 2 caracteres, completa com '20' e converte para NUMBER

-- 3. Remover a coluna txt_ano_agricola após a migração
ALTER TABLE T_ANO_AGRICOLA DROP COLUMN "txt_ano_agricola";
```sql

## 2ª Forma Normal (2FN): Eliminar dependências parciais

Para garantir que tabelas com chaves compostas tenham todos os atributos dependentes completamente de sua chave primária.

- **Revisão das Tabelas**:
  - Nenhuma das tabelas atuais possui chave composta (todas têm uma chave primária simples), então não há dependências parciais.
  - Com isso, o modelo já está em 2ª Forma Normal.

## 3ª Forma Normal (3FN): Eliminar dependências transitivas

Elimine dependências onde um atributo não chave depende de outro atributo não chave.

- **Revisão das Tabelas**:
  - Na tabela `T_PRODUCAO`, todos os atributos dependem diretamente da chave primária `idt_producao` ou de chaves estrangeiras que fazem referência a outras tabelas. Não há atributos não-chave que dependem de outros atributos não-chave.
  - Assim, o modelo também está em 3ª Forma Normal.
