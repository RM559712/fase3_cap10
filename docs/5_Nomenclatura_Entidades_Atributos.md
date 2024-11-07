# Estrutura de Dados Agrícolas

## Entidades e Atributos

| Entidade            | Atributo                        | Nomenclatura           | Descrição                                                             |
|---------------------|---------------------------------|-------------------------|-----------------------------------------------------------------------|
| **T_ANO_AGRICOLA**  | `idt_ano_agricola`              | Identificador           | Identificador único para cada ano agrícola                            |
|                     | `num_ano_inicio`               | Número                  | Ano de início do período agrícola                                     |
|                     | `num_ano_fim`                  | Número                  | Ano de fim do período agrícola                                        |
| **T_SAFRA**         | `idt_safra`                    | Identificador           | Identificador único para cada tipo de safra                           |
|                     | `des_safra`                    | Descrição               | Descrição da safra                                                    |
| **T_UF**            | `idt_uf`                       | Identificador           | Identificador único para cada unidade federativa                      |
|                     | `sig_uf`                       | Sigla                   | Sigla da unidade federativa (estado)                                  |
| **T_PRODUTO**       | `idt_produto`                  | Identificador           | Identificador único para cada tipo de produto agrícola                |
|                     | `nom_produto`                  | Nome                    | Nome do produto agrícola                                              |
| **T_LEVANTAMENTO**  | `idt_levantamento`             | Identificador           | Identificador único para cada levantamento agrícola                   |
|                     | `des_levantamento`             | Descrição               | Descrição do levantamento agrícola                                    |
| **T_PRODUCAO**      | `idt_producao`                 | Identificador           | Identificador único para cada registro de produção                    |
|                     | `qtd_area_plantada_mil_ha`     | Quantidade              | Quantidade de área plantada em mil hectares                           |
|                     | `qtd_producao_mil_t`           | Quantidade              | Quantidade de produção em mil toneladas                               |
|                     | `qtd_produtividade_mil_ha_mil_t` | Quantidade            | Produtividade (mil hectares por mil toneladas)                        |
|                     | `idt_ano_agricola`             | Chave Estrangeira       | Referência ao ano agrícola (FK para T_ANO_AGRICOLA)                   |
|                     | `idt_safra`                    | Chave Estrangeira       | Referência ao tipo de safra (FK para T_SAFRA)                         |
|                     | `idt_uf`                       | Chave Estrangeira       | Referência à unidade federativa (FK para T_UF)                        |
|                     | `idt_produto`                  | Chave Estrangeira       | Referência ao tipo de produto (FK para T_PRODUTO)                     |
|                     | `idt_levantamento`             | Chave Estrangeira       | Referência ao levantamento agrícola (FK para T_LEVANTAMENTO)          |

## Explicação das Nomenclaturas

- **Identificador (`idt_`)**: Usado para colunas que representam identificadores únicos.
- **Número (`num_`)**: Usado para valores numéricos específicos, como anos ou quantidades.
- **Descrição (`des_`)**: Usado para colunas que contêm descrições textuais.
- **Sigla (`sig_`)**: Usado para siglas ou abreviações, como unidades federativas.
- **Nome (`nom_`)**: Usado para nomes de entidades, como produtos.
- **Quantidade (`qtd_`)**: Usado para quantidades de valores medidos em unidades específicas.
