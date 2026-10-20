📌 README.md — ALV Hierárquico SAP ABAP
📖 Sobre o Projeto
Este repositório contém um programa ABAP desenvolvido para exibir dados de documentos de vendas (VBAK) e itens de vendas (VBAP) utilizando um ALV Hierárquico através da função REUSE_ALV_HIERSEQ_LIST_DISPLAY.

O objetivo é demonstrar:

Seleção de dados com SELECT-OPTIONS

Uso de FOR ALL ENTRIES

Construção de catálogo de campos (Field Catalog)

Configuração de chave hierárquica (Header → Item)

Exibição estruturada em ALV clássico

Este exemplo é ideal para iniciantes em SAP ABAP, especialmente para quem está a aprender ALV e manipulação de tabelas internas.

🧩 Funcionalidades
✔️ Seleção de documentos de vendas (VBAK)
O programa lê documentos com base no intervalo informado pelo utilizador.

✔️ Seleção dos itens correspondentes (VBAP)
Utiliza FOR ALL ENTRIES para garantir que apenas itens dos documentos selecionados sejam carregados.

✔️ Construção dinâmica do Field Catalog
Define colunas, textos, posições e tabelas associadas.

✔️ Exibição em ALV Hierárquico
Mostra:

Cabeçalho (documento)

Itens (linhas associadas)

Com expansão e colapso automático.

🏗️ Estrutura do Código
O programa está dividido em:

Declaração de tipos e tabelas internas

Seleção de dados (VBAK e VBAP)

Montagem do catálogo de campos (Field Catalog)

Configuração da chave hierárquica (Keyinfo)

Chamada do ALV Hierárquico

▶️ Como Executar
Acessar a transação SE38 ou SE80

Criar o programa ZALV_HIERARCHY_27

Colar o código-fonte

Ativar o objeto

Executar (F8)

Informar o intervalo de documentos em S_VBELN

Visualizar o ALV hierárquico

📂 Tabelas Utilizadas
Tabela	Descrição
VBAK	Cabeçalho de documentos de vendas
VBAP	Itens de documentos de vendas


🧠 Conceitos Demonstrados
ALV Hierárquico (Header + Item)

Field Catalog manual

Keyinfo para ligação entre tabelas

Seleção condicional com FOR ALL ENTRIES

Boas práticas de organização ABAP

🛠️ Tecnologias
SAP ABAP

ALV Clássico

Função REUSE_ALV_HIERSEQ_LIST_DISPLAY

📎 Exemplo de Saída
O ALV exibe:

Código
Documento  | Data | Hora | Usuário | Categoria
 └── Item  | Nº Item | Material
Com expansão automática por documento.

🤝 Contribuições
Sugestões, melhorias e correções são bem-vindas!
Sinta-se à vontade para abrir um Issue ou enviar um Pull Request.

📬 Contato
João Paulo Pedrosa Soares  
Desenvolvedor SAP ABAP (Iniciante)
Porto, Portugal
