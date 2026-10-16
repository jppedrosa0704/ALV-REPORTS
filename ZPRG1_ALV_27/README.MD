ALV Report – ZPRG1_ALV_27
Este repositório contém o programa ZPRG1_ALV_27, desenvolvido como parte do meu estudo de ALV Reports em ABAP. O objetivo é demonstrar a construção completa de um relatório ALV utilizando dados das tabelas VBAK (cabeçalho de vendas) e VBAP (itens de vendas), consolidando tudo em uma estrutura final para exibição.

📌 Objetivo do Programa
Criar um relatório ALV que:

Seleciona documentos de vendas (VBAK) conforme intervalo informado pelo usuário.

Busca itens correspondentes (VBAP) utilizando FOR ALL ENTRIES.

Monta uma tabela final combinando cabeçalho + itens.

Gera automaticamente o Field Catalog com REUSE_ALV_FIELDCATALOG_MERGE.

Exibe os dados em formato ALV usando REUSE_ALV_LIST_DISPLAY.

📁 Estruturas Utilizadas
lty_vbak
Estrutura para armazenar dados do cabeçalho do documento (VBAK):

Número do documento

Data e hora de criação

Usuário

Tipo de documento

lty_vbab
Estrutura para armazenar dados dos itens (VBAP):

Número do documento

Número do item

Material

ZSTR_SALE_27
Estrutura final que combina cabeçalho + itens para exibição no ALV.

🔍 Lógica do Programa
Recebe o intervalo de documentos via SELECT-OPTIONS.

Seleciona registros da tabela VBAK conforme o intervalo informado.

Caso existam registros, seleciona itens da VBAP usando FOR ALL ENTRIES.

Combina os dados de VBAK e VBAP em uma tabela final (LT_FINAL).

Gera o Field Catalog automaticamente com REUSE_ALV_FIELDCATALOG_MERGE.

Exibe o relatório ALV com REUSE_ALV_LIST_DISPLAY.

🧰 Funções ALV Utilizadas
Criação do Field Catalog
REUSE_ALV_FIELDCATALOG_MERGE

Exibição do ALV
REUSE_ALV_LIST_DISPLAY

📚 Conteúdo Didático
Este programa segue os passos clássicos para criação de ALV:

Criar Field Catalog

Automático via Function Module

Manual (alternativa)

Vincular dados ao Field Catalog

GRID, LIST ou Hierárquico

Funcionalidades não baseadas em eventos

Ordenação

Filtros

Funcionalidades baseadas em eventos

Double-click

Hotspot

🎯 Finalidade do Repositório
Este repositório foi criado para:

Registrar meu progresso no curso online de ALV Reports em ABAP.

Servir como referência para futuros projetos ABAP.

Demonstrar boas práticas na construção de relatórios ALV.

Consolidar conhecimento sobre Field Catalog, ALV GRID/LIST e manipulação de tabelas internas.
