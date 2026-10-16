ZPRG2_ALV_27 – ALV GRID Report
Este repositório contém o programa ZPRG2_ALV_27, desenvolvido como parte do meu estudo de ALV Reports em ABAP. O objetivo é demonstrar a construção completa de um relatório ALV utilizando ALV GRID, com dados combinados das tabelas VBAK (cabeçalho de vendas) e VBAP (itens de vendas).

📌 Objetivo do Programa
O programa realiza:

Seleção de documentos de vendas via SELECT-OPTIONS.

Leitura dos cabeçalhos (VBAK).

Leitura dos itens correspondentes (VBAP) usando FOR ALL ENTRIES.

Montagem de uma tabela final (LT_FINAL) com cabeçalho + itens.

Criação automática do Field Catalog via REUSE_ALV_FIELDCATALOG_MERGE.

Exibição dos dados em ALV GRID usando REUSE_ALV_GRID_DISPLAY.

📁 Estruturas Utilizadas
lty_vbak
Estrutura para dados do cabeçalho (VBAK):

VBELN

ERDAT

ERZET

ERNAM

VBTYP

lty_vbab
Estrutura para dados dos itens (VBAP):

VBELN

POSNR

MATNR

ZSTR_SALE_27
Estrutura final contendo todos os campos necessários para exibição no ALV.

🔍 Lógica do Programa
Entrada do usuário

Intervalo de documentos via SELECT-OPTIONS.

Seleção dos cabeçalhos (VBAK)

Busca documentos conforme o intervalo informado.

Seleção dos itens (VBAP)

Utiliza FOR ALL ENTRIES para evitar SELECT dentro de LOOP.

Montagem da tabela final (LT_FINAL)

Combina dados de VBAK e VBAP em uma única estrutura.

Criação do Field Catalog

Automático via REUSE_ALV_FIELDCATALOG_MERGE.

Exibição do ALV GRID

Utiliza REUSE_ALV_GRID_DISPLAY.

🧰 Funções ALV Utilizadas
Field Catalog
REUSE_ALV_FIELDCATALOG_MERGE

Exibição ALV GRID
REUSE_ALV_GRID_DISPLAY

📚 Conteúdo Didático
Este programa segue os passos clássicos para criação de ALV:

1) Criação do Field Catalog
Automático via Function Module

Manual (alternativa)

2) Bind dos dados ao Field Catalog
GRID

LIST

Hierárquico

3) Funcionalidades não baseadas em eventos
Ordenação

Filtros

4) Funcionalidades baseadas em eventos
Double-click

Hotspot

🎯 Finalidade do Repositório
Este repositório foi criado para:

Registrar meu progresso no curso online de ALV Reports em ABAP.

Servir como referência para futuros projetos ABAP.

Consolidar boas práticas de criação de ALV GRID.

Documentar exemplos reais de manipulação de tabelas internas e Field Catalog.
