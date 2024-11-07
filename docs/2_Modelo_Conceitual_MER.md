Para criar o Modelo Entidade-Relacionamento (MER) baseado nas entidades e relacionamentos definidos, 
as seguintes tabelas serão incluídas no diagrama:

1. **AnoAgricola**
   - PK: `id_ano_agricola`
   - Atributo: `ano_agricola`

2. **Safra**
   - PK: `id_safra`
   - Atributo: `descricao`

3. **UF (Unidade Federativa)**
   - PK: `id_uf`
   - Atributo: `uf`

4. **Produto**
   - PK: `id_produto`
   - Atributo: `nome_produto`

5. **Levantamento**
   - PK: `id_levantamento`
   - Atributo: `descricao_levantamento`

6. **Produção**
   - PK: `id_producao`
   - FK: `id_ano_agricola` (Referência para AnoAgricola)
   - FK: `id_safra` (Referência para Safra)
   - FK: `id_uf` (Referência para UF)
   - FK: `id_produto` (Referência para Produto)
   - FK: `id_levantamento` (Referência para Levantamento)
   - Atributos:
     - `area_plantada_mil_ha`
     - `producao_mil_t`
     - `produtividade_mil_ha_mil_t`
