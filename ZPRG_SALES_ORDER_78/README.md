ZPRG_SALES_ORDER_78

Relatório ABAP para consultar pedidos de venda e visualizar os respetivos itens num ALV.

## Funcionalidades

- Permite filtrar por um ou vários números de pedido de venda.
- Apresenta os dados do cabeçalho do pedido, lidos da tabela `VBAK`:
  - Número do pedido (`VBELN`)
  - Data de criação (`ERDAT`)
  - Hora de criação (`ERZET`)
  - Utilizador que criou o pedido (`ERNAM`)
  - Categoria do documento SD (`VBTYP`)
- Ao executar a ação `DISPLAY` numa linha, consulta e apresenta os itens desse pedido, lidos da tabela `VBAP`:
  - Número do pedido (`VBELN`)
  - Número do item (`POSNR`)
  - Material (`MATNR`)
- O número do pedido é apresentado como hotspot. Ao clicar, o relatório abre a transação `VA03` para visualizar o pedido.

## Requisitos

- Sistema SAP com os dados de vendas disponíveis nas tabelas `VBAK` e `VBAP`.
- Autorização para consultar os pedidos e executar a transação `VA03`.
- Objetos de interface do programa configurados no SAP:
  - PF-STATUS `SALES`, incluindo o código de função `DISPLAY` usado pelo relatório.
  - O programa usa os módulos de função clássicos `REUSE_ALV_GRID_DISPLAY` e estruturas `SLIS`.

## Utilização

1. Crie ou ative o programa ABAP `ZPRG_SALES_ORDER_78` no sistema SAP.
2. Execute o relatório.
3. Informe um número de pedido ou um intervalo na seleção `S_VBELN` e execute.
4. No ALV de cabeçalhos, use a ação `DISPLAY` numa linha para abrir os itens do pedido.
5. Clique no número do pedido para navegar para a `VA03`.

## Tabelas consultadas

| Tabela | Conteúdo | Campos usados |
| --- | --- | --- |
| `VBAK` | Cabeçalho dos pedidos de venda | `VBELN`, `ERDAT`, `ERZET`, `ERNAM`, `VBTYP` |
| `VBAP` | Itens dos pedidos de venda | `VBELN`, `POSNR`, `MATNR` |

## Observações

- O relatório não altera dados; executa apenas consultas e navegação para visualização.
- Os textos das colunas do ALV estão definidos em inglês no código ABAP.
- A ação `DISPLAY` depende do PF-STATUS `SALES` e do respetivo código de função estarem configurados corretamente.
- O código fornecido não inclui objetos de transporte, configuração do PF-STATUS nem documentação de autorizações. Esses elementos devem ser preparados no ambiente SAP de destino.
