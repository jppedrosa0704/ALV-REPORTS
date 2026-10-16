📘 README — Programa ZPRG3_ALV_27
📌 Descrição Geral
O programa ZPRG3_ALV_27 tem como objetivo listar documentos de vendas (VBAK) e seus itens (VBAP) em um ALV Grid, combinando dados de cabeçalho e itens em uma tabela final estruturada (ZSTR_SALE_27).

Ele permite ao utilizador selecionar um intervalo de pedidos via SELECT-OPTIONS e exibe o resultado em formato ALV com catálogo de campos criado manualmente.

🧩 Componentes Principais
1. Estruturas Internas
O programa define três estruturas:

lty_vbak → Cabeçalho do documento (VBAK)

lty_vbab → Itens do documento (VBAP)

ZSTR_SALE_27 → Estrutura final exibida no ALV

Cada estrutura possui campos essenciais como número do documento, data, hora, usuário, tipo de documento, item e material.

2. Seleção de Dados
O programa utiliza:

abap
SELECT-OPTIONS: s_vbeln FOR lv_vbeln.
Permite ao usuário filtrar documentos por número.

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
O programa combina os dados de VBAK e VBAP:

abap
LOOP AT LT_VBAK INTO LS_VBAK.
  LOOP AT LT_VBAB INTO LS_VBAB WHERE VBELN = LS_VBAK-VBELN.
    LS_FINAL-... = ...
    APPEND LS_FINAL TO LT_FINAL.
    CLEAR LS_FINAL.
  ENDLOOP.
ENDLOOP.
Resultado: cada linha contém cabeçalho + item.

🧱 4. Catálogo de Campos (Fieldcatalog)
Criado manualmente, campo por campo:

Exemplo:

abap
ls_fieldcat-COL_POS = '1'.
ls_fieldcat-FIELDNAME = 'VBELN'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Sales Document Number'.
APPEND ls_fieldcat TO lt_fieldcat.
Campos incluídos:

VBELN — Número do documento

ERDAT — Data de criação

ERZET — Hora

ERNAM — Usuário

VBTYP — Tipo de documento

POSNR — Número do item

MATNR — Código do material

📊 5. Exibição ALV
O programa usa REUSE_ALV_GRID_DISPLAY para exibir os dados:

abap
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    IT_FIELDCAT = LT_FIELDCAT
  TABLES
    T_OUTTAB    = LT_FINAL.
O ALV é exibido em formato GRID, permitindo:

Ordenação

Filtros

Exportação

Layouts personalizados

🧪 6. Erros e Tratamento
O programa verifica SY-SUBRC após chamadas críticas:

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
REUSE_ALV_GRID_DISPLAY	Exibir ALV GRID


🎯 Objetivo Final
Gerar uma lista ALV completa contendo:

Documento de venda

Data e hora

Usuário criador

Tipo de documento

Itens

Materiais

Tudo organizado em uma tabela final estruturada e exibido em ALV Grid.
