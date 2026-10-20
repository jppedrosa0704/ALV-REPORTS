📘 README — Programa ZPRG3_ALV_27_FILTER
📌 Descrição Geral
O programa ZPRG3_ALV_27_FILTER tem como objetivo listar documentos de vendas (VBAK) e seus itens (VBAP) em um ALV Grid, combinando dados de cabeçalho e itens em uma tabela final estruturada (ZSTR_SALE_27).

Além da exibição padrão em ALV, o programa implementa um filtro automático, permitindo que apenas registros específicos sejam exibidos — neste caso, documentos criados pelo usuário CURA.

🧩 Componentes Principais
1. Estruturas Internas
O programa utiliza três estruturas principais:

lty_vbak → Dados do cabeçalho (VBAK)

lty_vbab → Dados dos itens (VBAP)

ZSTR_SALE_27 → Estrutura final exibida no ALV

Cada estrutura contém campos essenciais como:

Número do documento

Data e hora de criação

Usuário criador

Tipo de documento

Número do item

Material

2. Seleção de Dados
O programa permite ao utilizador filtrar documentos via:

abap
SELECT-OPTIONS: s_vbeln FOR lv_vbeln.
Passo 1 — Buscar cabeçalhos (VBAK)
abap
SELECT VBELN ERDAT ERZET ERNAM VBTYP
  FROM VBAK
  INTO TABLE LT_VBAK
  WHERE VBELN IN s_vbeln.
Passo 2 — Buscar itens (VBAP) usando FOR ALL ENTRIES
Evita SELECT dentro de LOOP:

abap
IF LT_VBAK IS NOT INITIAL.
  SELECT VBELN POSNR MATNR
    FROM VBAP
    INTO TABLE LT_VBAB
    FOR ALL ENTRIES IN LT_VBAK
    WHERE VBELN = LT_VBAK-VBELN.
ENDIF.
3. Montagem da Tabela Final
O programa combina os dados de cabeçalho e itens:

abap
LOOP AT LT_VBAK INTO LS_VBAK.
  LOOP AT LT_VBAB INTO LS_VBAB WHERE VBELN = LS_VBAK-VBELN.
    LS_FINAL-... = ...
    APPEND LS_FINAL TO LT_FINAL.
    CLEAR LS_FINAL.
  ENDLOOP.
ENDLOOP.
Cada linha da tabela final contém:

Dados do documento (VBAK)

Dados do item (VBAP)

🧱 4. Catálogo de Campos (Fieldcatalog)
O catálogo de campos é criado manualmente, definindo:

Ordem das colunas

Nome técnico do campo

Nome exibido no ALV

Exemplo:

abap
ls_fieldcat-COL_POS = '1'.
ls_fieldcat-FIELDNAME = 'VBELN'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Sales Document Number'.
APPEND ls_fieldcat TO lt_fieldcat.
Campos incluídos:

VBELN

ERDAT

ERZET

ERNAM

VBTYP

POSNR

MATNR

🔽 5. Filtro Automático no ALV — NOVO
O programa inclui um filtro automático que exibe apenas registros onde:

✔ ERNAM = 'CURA'
Implementação:

abap
ls_filter-FIELDNAME = 'ERNAM'.
ls_filter-tabname = 'lt_final'.
ls_filter-sign0 = 'E'.
ls_filter-optio = 'EQ'.
ls_filter-valuf_int = 'CURA'.
APPEND ls_filter TO lt_filter.
Este filtro é aplicado diretamente no ALV, sem necessidade de interação do utilizador.

📊 6. Exibição ALV
O programa utiliza:

abap
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    IT_FIELDCAT = LT_FIELDCAT
    IT_FILTER   = LT_FILTER
  TABLES
    T_OUTTAB    = LT_FINAL.
O ALV Grid permite:

Filtros

Ordenação

Exportação

Layouts personalizados

🧪 7. Tratamento de Erros
Após a chamada do ALV:

abap
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.
📦 Resumo Técnico
Parte	Função
SELECT-OPTIONS	Filtrar documentos
SELECT VBAK	Buscar cabeçalhos
SELECT VBAP	Buscar itens
FOR ALL ENTRIES	Evitar SELECT dentro de LOOP
LOOPs	Montar tabela final
Fieldcatalog manual	Definir colunas do ALV
Filtro ALV (NOVO)	Exibir apenas registros de ERNAM = 'CURA'
REUSE_ALV_GRID_DISPLAY	Exibir ALV GRID


🎯 Objetivo Final
Gerar uma lista ALV completa contendo:

Documento de venda

Data e hora

Usuário criador

Tipo de documento

Itens

Materiais

Com filtro automático aplicado, exibindo apenas documentos criados pelo usuário CURA.
