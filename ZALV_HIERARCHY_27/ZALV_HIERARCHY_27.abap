REPORT ZALV_HIERARCHY_27.

DATA: lt_fieldcat TYPE SLIS_T_FIELDCAT_ALV,
      ls_fieldcat TYPE slis_fieldcat_alv.

DATA: ls_keyinfo TYPE SLIS_KEYINFO_ALV.

"------------------------------------------------------
TYPES: BEGIN OF lty_vbak,
         VBELN TYPE VBELN_VA,
         ERDAT  TYPE ERDAT,
         ERZET  TYPE ERZET,
         ERNAM  TYPE ERNAM,
         VBTYP TYPE VBTYP,
       END OF lty_vbak.

DATA: lt_vbak TYPE TABLE OF lty_vbak,
      ls_vbak TYPE lty_vbak.
"------------------------------------------------------

TYPES: BEGIN OF lty_vbap,
        VBELN TYPE VBELN_VA,
        POSNR	TYPE POSNR_VA,
        MATNR	TYPE MATNR,
      END OF LTY_VBAP.

DATA: lt_vbap TYPE TABLE OF lty_vbap,
      ls_vbap TYPE lty_vbap.
"------------------------------------------------------

DATA: lv_vbeln TYPE VBELN_VA.
SELECT-OPTIONS: s_vbeln FOR lv_vbeln.
"------------------------------------------------------

SELECT VBELN ERDAT ERZET ERNAM VBTYP
  FROM VBAK
  INTO TABLE lt_vbak
  WHERE vbeln in s_vbeln.

IF lt_vbak IS NOT INITIAL.
  SELECT VBELN POSNR MATNR
    FROM VBAP
    INTO TABLE LT_VBAP
    FOR ALL ENTRIES IN LT_VBAK
    WHERE VBELN = LT_VBAK-VBELN.

ENDIF.

ls_fieldcat-col_pos = '1'.
ls_fieldcat-fieldname  = 'VBELN'.
ls_fieldcat-tabname = 'LT_VBAK'.
ls_fieldcat-seltext_l = 'Sales Documnent Number'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '2'.
ls_fieldcat-fieldname  = 'ERDAT'.
ls_fieldcat-tabname = 'LT_VBAK'.
ls_fieldcat-seltext_l = 'Creation Date'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '3'.
ls_fieldcat-fieldname  = 'ERZET'.
ls_fieldcat-tabname = 'LT_VBAK'.
ls_fieldcat-seltext_l = 'TIME'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '4'.
ls_fieldcat-fieldname  = 'ERNAM'.
ls_fieldcat-tabname = 'LT_VBAK'.
ls_fieldcat-seltext_l = 'User'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '5'.
ls_fieldcat-fieldname  = 'VBTYP'.
ls_fieldcat-tabname = 'LT_VBAK'.
ls_fieldcat-seltext_l = 'Category'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '1'.
ls_fieldcat-fieldname  = 'VBELN'.
ls_fieldcat-tabname = 'LT_VBAP'.
ls_fieldcat-seltext_l = 'Sales Documnent Number'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '2'.
ls_fieldcat-fieldname  = 'POSNR'.
ls_fieldcat-tabname = 'LT_VBAP'.
ls_fieldcat-seltext_l = 'ITEM NUMBER'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_fieldcat-col_pos = '3'.
ls_fieldcat-fieldname  = 'MATNR'.
ls_fieldcat-tabname = 'LT_VBAP'.
ls_fieldcat-seltext_l = 'Material Number'.
APPEND ls_fieldcat TO lt_fieldcat.
CLEAR ls_fieldcat.

ls_keyinfo-header01 = 'VBELN'.
ls_keyinfo-item01 = 'VBELN'.

CALL FUNCTION 'REUSE_ALV_HIERSEQ_LIST_DISPLAY'
  EXPORTING
*   I_INTERFACE_CHECK              = ' '
*   I_CALLBACK_PROGRAM             =
*   I_CALLBACK_PF_STATUS_SET       = ' '
*   I_CALLBACK_USER_COMMAND        = ' '
*   IS_LAYOUT                      =
   IT_FIELDCAT                    = lt_fieldcat
*   IT_EXCLUDING                   =
*   IT_SPECIAL_GROUPS              =
*   IT_SORT                        =
*   IT_FILTER                      =
*   IS_SEL_HIDE                    =
*   I_SCREEN_START_COLUMN          = 0
*   I_SCREEN_START_LINE            = 0
*   I_SCREEN_END_COLUMN            = 0
*   I_SCREEN_END_LINE              = 0
*   I_DEFAULT                      = 'X'
*   I_SAVE                         = ' '
*   IS_VARIANT                     =
*   IT_EVENTS                      =
*   IT_EVENT_EXIT                  =
    I_TABNAME_HEADER               = 'LT_VBAK'
    I_TABNAME_ITEM                 = 'LT_VBAP'
*   I_STRUCTURE_NAME_HEADER        =
*   I_STRUCTURE_NAME_ITEM          =
    IS_KEYINFO                     = ls_keyinfo
*   IS_PRINT                       =
*   IS_REPREP_ID                   =
*   I_BYPASSING_BUFFER             =
*   I_BUFFER_ACTIVE                =
*   IR_SALV_HIERSEQ_ADAPTER        =
*   IT_EXCEPT_QINFO                =
*   I_SUPPRESS_EMPTY_DATA          = ABAP_FALSE
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER        =
*   ES_EXIT_CAUSED_BY_USER         =
  TABLES
    T_OUTTAB_HEADER                = LT_VBAK
    T_OUTTAB_ITEM                  = LT_VBAP
 EXCEPTIONS
   PROGRAM_ERROR                  = 1
   OTHERS                         = 2
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.
