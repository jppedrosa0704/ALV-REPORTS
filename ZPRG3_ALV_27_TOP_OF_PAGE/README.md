Sales Order ALV Report
📋 Descrição

Este projeto consiste num relatório ABAP que exibe informações de Pedidos de Venda (Sales Orders) utilizando ALV Grid Display.

O programa permite filtrar documentos de vendas através de um Select-Option, consultar os dados das tabelas VBAK (cabeçalho) e VBAP (itens), consolidar as informações numa estrutura final e apresentá-las num relatório ALV com cabeçalho personalizado (TOP-OF-PAGE).

🚀 Funcionalidades
Seleção de pedidos de vendas através de intervalo de documentos.
Consulta dos dados do cabeçalho na tabela VBAK.
Consulta dos itens correspondentes na tabela VBAP.
Utilização de FOR ALL ENTRIES para otimização de performance.
Construção manual do Field Catalog.
Exibição dos resultados em ALV Grid.
Cabeçalho personalizado utilizando o evento TOP-OF-PAGE.
Exibição da quantidade total de registos encontrados.
🏗️ Estrutura do Programa
1. Seleção de Dados

O utilizador informa um ou mais números de pedido através do parâmetro:

ABAP
SELECT-OPTIONS: s_vbeln FOR lv_vbeln.
 
2. Leitura do Cabeçalho dos Pedidos

Os dados são obtidos da tabela VBAK:

Campo	DescriçãoVBELN	Número do documento
ERDAT	Data de criação
ERZET	Hora de criação
ERNAM	Utilizador criador
VBTYP	Tipo de documento
ABAP
SELECT VBELN ERDAT ERZET ERNAM VBTYP
FROM VBAK
INTO TABLE LT_VBAK
WHERE VBELN IN s_vbeln.
3. Leitura dos Itens

Após encontrar os cabeçalhos, os itens são consultados na tabela VBAP.

ABAP
SELECT VBELN POSNR MATNR
FROM VBAP
INTO TABLE LT_VBAB
FOR ALL ENTRIES IN LT_VBAK
WHERE VBELN = LT_VBAK-VBELN.
4. Construção da Tabela Final

Os dados de cabeçalho e itens são combinados numa única tabela interna para exibição.

Campos finais apresentados:

VBELN
ERDAT
ERZET
ERNAM
VBTYP
POSNR
MATNR
5. Construção do Field Catalog

O ALV utiliza um Field Catalog criado manualmente para definir:

Ordem das colunas
Nomes técnicos
Textos de visualização

Exemplo:

ABAP
ls_fieldcat-fieldname = 'VBELN'.
ls_fieldcat-seltext_l = 'Sales Document Number'.
6. Exibição do ALV

A apresentação é realizada através da função:

ABAP
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'

Permite:

Ordenação
Filtros
Exportação
Layout padrão SAP ALV
📊 Cabeçalho Personalizado (TOP-OF-PAGE)

O relatório apresenta informações adicionais acima do ALV:

Título
Plain Text
Sales Order Display
 
Intervalo Selecionado
Plain Text
Sales Input: 100000 TO 100010
Número Total de Registos
Plain Text
The Number of Lines 25

Implementação através da função:

ABAP
REUSE_ALV_COMMENTARY_WRITE
🗂️ Tabelas SAP Utilizadas
Tabela	DescriçãoVBAK	Cabeçalho dos documentos de vendas
VBAP	Itens dos documentos de vendas
🔧 Tecnologias Utilizadas
SAP ABAP
ALV Grid
Function Module REUSE_ALV_GRID_DISPLAY
Function Module REUSE_ALV_COMMENTARY_WRITE
Internal Tables
Structures
FOR ALL ENTRIES
📈 Exemplo de Saída
Sales Document	Creation Date	Creation Time	Created By	Document Type	Item	Material500000001	01.01.2024	08:15:00	USER01	C	000010	MAT001
500000001	01.01.2024	08:15:00	USER01	C	000020	MAT002
✅ Objetivos de Aprendizagem

Este projeto demonstra conceitos fundamentais de ABAP:

Leitura de dados com SELECT
Utilização de FOR ALL ENTRIES
Manipulação de tabelas internas
Construção manual de Field Catalog
Desenvolvimento de relatórios ALV
Utilização de eventos ALV (TOP_OF_PAGE)
Boas práticas de performance em consultas SAP
👨‍💻 Autor

Desenvolvido para fins de estudo e prática de programação SAP ABAP ALV Reports.
