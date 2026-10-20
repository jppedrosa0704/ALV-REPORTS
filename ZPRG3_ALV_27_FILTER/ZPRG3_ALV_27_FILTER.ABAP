REPORT ZPRG3_ALV_27_FILTER.   "Nome do programa ABAP

"------------------------------------------------------------
"* Objetivo:
"* Exibir documentos de venda (VBAK) + itens (VBAP) em ALV GRID,
"* combinando tudo na estrutura final ZSTR_SALE_27.
"* Este programa inclui FILTRO automático no ALV,
"* filtrando registros pelo campo ERNAM = 'CURA'.
"------------------------------------------------------------

"------------------------------------------------------------
"* Estruturas de filtro do ALV
"------------------------------------------------------------
DATA: lt_filter TYPE SLIS_T_FILTER_ALV,   "Tabela de filtros
      ls_filter TYPE slis_filter_alv.     "Linha de filtro

"------------------------------------------------------------
"* Estrutura para dados do cabeçalho (VBAK)
"------------------------------------------------------------
TYPES: BEGIN OF lty_vbak,
        VBELN TYPE VBELN_VA,   "Número do documento
        ERDAT TYPE ERDAT,      "Data de criação
        ERZET TYPE ERZET,      "Hora de criação
        ERNAM TYPE ERNAM,      "Usuário criador
        VBTYP TYPE VBTYP,      "Tipo de documento
       END OF lty_vbak.

DATA: LT_VBAK TYPE TABLE OF lty_vbak,     "Tabela interna VBAK
      LS_VBAK TYPE lty_vbak.              "Work area VBAK

"------------------------------------------------------------
"* Fieldcatalog do ALV
"------------------------------------------------------------
DATA: lt_fieldcat TYPE SLIS_T_FIELDCAT_ALV,
      ls_fieldcat TYPE slis_fieldcat_alv.

"------------------------------------------------------------
"* Estrutura para itens (VBAP)
"------------------------------------------------------------
TYPES: BEGIN OF lty_vbab,
        VBELN TYPE VBELN_VA,   "Número do documento
        POSNR TYPE POSNR_VA,   "Número do item
        MATNR TYPE MATNR,      "Código do material
       END OF lty_vbab.

DATA: LT_VBAB TYPE TABLE OF lty_vbab,     "Tabela interna VBAP
      LS_VBAB TYPE lty_vbab.              "Work area VBAP

"------------------------------------------------------------
"* Estrutura final (ZSTR_SALE_27)
"* Junta cabeçalho + itens em uma única linha
"------------------------------------------------------------
DATA: LT_FINAL TYPE TABLE OF ZSTR_SALE_27,
      LS_FINAL TYPE ZSTR_SALE_27.

"------------------------------------------------------------
"* Select-options para seleção de pedidos
"------------------------------------------------------------
DATA: lv_vbeln TYPE VBELN_VA.
SELECT-OPTIONS: s_vbeln FOR lv_vbeln.

"------------------------------------------------------------
"* Seleção dos dados do cabeçalho (VBAK)
"------------------------------------------------------------
SELECT VBELN ERDAT ERZET ERNAM VBTYP
  FROM VBAK
  INTO TABLE LT_VBAK
  WHERE VBELN IN s_vbeln.

"------------------------------------------------------------
"* Seleção dos itens (VBAP)
"* FOR ALL ENTRIES evita SELECT dentro de LOOP
"------------------------------------------------------------
IF LT_VBAK IS NOT INITIAL.
  SELECT VBELN POSNR MATNR
    FROM VBAP
    INTO TABLE LT_VBAB
    FOR ALL ENTRIES IN LT_VBAK
    WHERE VBELN = LT_VBAK-VBELN.
ENDIF.

"------------------------------------------------------------
"* Montagem da tabela final LT_FINAL
"* Combina dados de VBAK + VBAP
"------------------------------------------------------------
LOOP AT LT_VBAK INTO LS_VBAK.
  LOOP AT LT_VBAB INTO LS_VBAB WHERE VBELN = LS_VBAK-VBELN.

    LS_FINAL-VBELN = LS_VBAK-VBELN.
    LS_FINAL-ERDAT = LS_VBAK-ERDAT.
    LS_FINAL-ERZET = LS_VBAK-ERZET.
    LS_FINAL-ERNAM = LS_VBAK-ERNAM.
    LS_FINAL-VBTYP = LS_VBAK-VBTYP.

    LS_FINAL-POSNR = LS_VBAB-POSNR.
    LS_FINAL-MATNR = LS_VBAB-MATNR.

    APPEND LS_FINAL TO LT_FINAL.
    CLEAR LS_FINAL.

  ENDLOOP.
ENDLOOP.

"------------------------------------------------------------
"* Construção manual do Fieldcatalog
"* Define colunas do ALV
"------------------------------------------------------------
ls_fieldcat-COL_POS = '1'.
ls_fieldcat-FIELDNAME = 'VBELN'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Sales Document Number'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-COL_POS = '2'.
ls_fieldcat-FIELDNAME = 'ERDAT'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Creation Date'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-COL_POS = '3'.
ls_fieldcat-FIELDNAME = 'ERZET'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Time'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-COL_POS = '4'.
ls_fieldcat-FIELDNAME = 'ERNAM'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'User Name'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-COL_POS = '5'.
ls_fieldcat-FIELDNAME = 'VBTYP'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Document Type'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-COL_POS = '6'.
ls_fieldcat-FIELDNAME = 'POSNR'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Item Number'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-COL_POS = '7'.
ls_fieldcat-FIELDNAME = 'MATNR'.
ls_fieldcat-TABNAME = 'lt_final'.
ls_fieldcat-seltext_l = 'Material Code'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

"------------------------------------------------------------
"* FILTRO AUTOMÁTICO DO ALV
"* Exibe somente registros onde ERNAM = 'CURA'
"------------------------------------------------------------
ls_filter-FIELDNAME = 'ERNAM'.      "Campo a filtrar
ls_filter-tabname = 'lt_final'.     "Tabela do ALV
ls_filter-sign0 = 'E'.              "Include (E = incluir)
ls_filter-optio = 'EQ'.             "Operador = igual
ls_filter-valuf_int = 'CURA'.       "Valor do filtro
APPEND ls_filter TO lt_filter.

"------------------------------------------------------------
"* Exibição do ALV GRID
"* Inclui fieldcatalog + filtro
"------------------------------------------------------------
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    IT_FIELDCAT = LT_FIELDCAT
    IT_FILTER   = LT_FILTER
  TABLES
    T_OUTTAB    = LT_FINAL
  EXCEPTIONS
    PROGRAM_ERROR = 1
    OTHERS        = 2.

IF SY-SUBRC <> 0.
  "Tratamento de erro simples
ENDIF.
