📄 README – ZSALES_ORDER_BLOCK_ALV
📌 Descrição do Projeto
Este repositório contém o relatório ABAP ZSALES_ORDER_BLOCK_ALV, desenvolvido para exibir dados de cabeçalho (VBAK) e itens (VBAP) de pedidos de venda utilizando o ALV Block List, permitindo múltiplos ALVs na mesma tela.

O programa realiza:

Seleção de documentos de venda via SELECT-OPTIONS

Leitura de dados das tabelas VBAK e VBAP

Construção manual de fieldcatalogs

Exibição de dois blocos ALV independentes (cabeçalho + itens)

Organização clara e profissional dos dados

🧩 Funcionalidades
✔ Seleção de Pedidos
O usuário informa um intervalo de documentos através de s_vbeln.

✔ Consulta ao Banco de Dados
VBAK: Cabeçalho do pedido

VBAP: Itens do pedido (usando FOR ALL ENTRIES)

✔ ALV Block List
O relatório utiliza as funções:

REUSE_ALV_BLOCK_LIST_INIT

REUSE_ALV_BLOCK_LIST_APPEND

REUSE_ALV_BLOCK_LIST_DISPLAY

Permitindo exibir dois ALVs na mesma execução, cada um com seu próprio layout e fieldcatalog.

📂 Estrutura do Código
1. Tipos e Tabelas Internas
lty_vbak → Estrutura para cabeçalho

lty_vbab → Estrutura para itens

lt_vbak → Tabela interna com cabeçalhos

lt_vbap → Tabela interna com itens

2. Fieldcatalogs
lt_fieldcat_vbak → Campos do ALV de cabeçalho

lt_fieldcat_vbap → Campos do ALV de itens

3. Layouts e Eventos
Declarados para futura expansão (cores, zebra, hotspots, etc.).

🖥️ Como Executar
Acesse a transação SE38 ou SE80

Abra o programa ZSALES_ORDER_BLOCK_ALV

Execute (F8)

Informe o intervalo de pedidos em s_vbeln

Visualize os dois ALVs exibidos em blocos:

Bloco 1: Cabeçalho (VBAK)

Bloco 2: Itens (VBAP)

🛠️ Tecnologias Utilizadas
ABAP

ALV Block List (REUSE_ALV_)*

Tabelas SAP SD: VBAK, VBAP

📘 Objetivo Educacional
Este relatório foi criado como parte de estudos e prática de:

Construção de ALV avançado

Manipulação de tabelas internas

Documentação técnica

Boas práticas de desenvolvimento ABAP

📎 Autor
Paulo  
Porto, Portugal
Estudante de Técnico de Informática – Sistemas
Focado em ABAP, Python, HTML/CSS
