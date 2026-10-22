ZPRG_SALES_ORDER_78
📋 Descrição

Relatório ABAP desenvolvido para consulta de Pedidos de Venda (Sales Orders) no SAP.

O programa permite que o utilizador pesquise pedidos através do número do documento e visualize:

Dados de cabeçalho do pedido (VBAK)
Dados dos itens do pedido (VBAP)

A navegação é realizada através de um ALV Grid, permitindo acesso rápido aos itens de cada pedido selecionado.

🚀 Funcionalidades
Consulta de Pedidos

O utilizador pode informar um ou mais números de pedido através de uma SELECT-OPTION.

ABAP
SELECT-OPTIONS: s_vbeln FOR lv_vbeln.
 
Exibição do Cabeçalho do Pedido

Os dados são obtidos da tabela VBAK.

Campos apresentados:

Campo	DescriçãoVBELN	Número do Pedido
ERDAT	Data de Criação
ERZET	Hora de Criação
ERNAM	Utilizador Criador
VBTYP	Tipo de Documento
Navegação para os Itens

Ao selecionar uma linha do ALV principal, o programa executa o evento:

ABAP
FORM usr_command.
 

O número do pedido selecionado é utilizado para consultar os respetivos itens na tabela VBAP.

Exibição dos Itens do Pedido

Campos apresentados:

Campo	DescriçãoVBELN	Número do Pedido
POSNR	Número do Item
MATNR	Código do Material
🗄️ Tabelas SAP Utilizadas
VBAK - Cabeçalho do Documento de Vendas

Armazena informações gerais do pedido:

Número do documento
Data de criação
Hora de criação
Utilizador
Tipo de documento
VBAP - Itens do Documento de Vendas

Armazena os itens associados ao pedido:

Número do item
Material
Quantidades
Dados comerciais dos itens
🔄 Fluxo do Programa
Plain Text
Utilizador
│
▼
Informa Pedido(s)
│
▼
SELECT VBAK
│
▼
ALV Cabeçalho
│
▼
Selecionar Pedido
│
▼
SELECT VBAP
│
▼
ALV Itens
🛠️ Tecnologias Utilizadas
ABAP
SAP ECC / SAP S/4HANA
ALV Grid
Function Module:
ABAP
REUSE_ALV_GRID_DISPLAY
📌 Estrutura do Programa
Tipos Locais
ABAP
lty_vbak

Estrutura utilizada para armazenar os dados do cabeçalho.

ABAP
lty_vbap

Estrutura utilizada para armazenar os itens do pedido.

Forms
PF-STATUS

Responsável por atribuir o Status GUI ao ALV.

ABAP
FORM pf_status.
USR_COMMAND

Responsável pelo tratamento da ação do utilizador sobre o ALV principal.

ABAP
FORM usr_command.

Executa:

Leitura da linha selecionada.
Consulta dos itens do pedido.
Construção do Field Catalog dos itens.
Exibição do segundo ALV.
✅ Resultado Esperado
ALV Principal
Plain Text
+------------+------------+--------+----------+--------+
| VBELN | ERDAT | ERZET | ERNAM | VBTYP |
+------------+------------+--------+----------+--------+
| 5000000010 | 01.01.2024 | 09:30 | USER01 | C |
+------------+------------+--------+----------+--------+
ALV de Itens
Plain Text
+------------+--------+------------+
| VBELN | POSNR | MATNR |
+------------+--------+------------+
| 5000000010 | 000010 | MAT-1000 |
| 5000000010 | 000020 | MAT-2000 |
+------------+--------+------------+
👨‍💻 Autor

Desenvolvido para estudo e prática de:

Programação ABAP
ALV Grid
Eventos de ALV
Consulta de documentos SD
Navegação entre VBAK e VBAP
