ORG 0

MAIN:
;========================================
; inicializa DISPLAY e desenha TABULEIRO
;========================================
    LDA #20
    TRAP VIDEO_CONFIG
    OR #0
    JNZ ERRO
    LDA #21
    TRAP BACKGROUND
    LDA #23
    TRAP jogo1V
    LDA #23
    TRAP jogo2V
    LDA #23
    TRAP jogo1H
    LDA #23
    TRAP jogo2H

;========================================
; inicializa cursor visual na casa 1
;========================================
    LDA #1
    STA POS_CURSOR
    LDA #24
    TRAP cursor1

    JMP LEITURA

ERRO:
    HLT ; caso de erro na inicializacao do display

;========================================
; LEITURA do input do usuário
;========================================
LEITURA:
    IN 0
    OR #0
    JZ LEITURA
    IN 0
    STA OPCAO
    LDA OPCAO

; verifica teclas de MOVIMENTO do CURSOR
    SUB #0x8
    JZ MOVE_CIMA
    LDA OPCAO

    SUB #0x2
    JZ MOVE_BAIXO
    LDA OPCAO

    SUB #0x4
    JZ MOVE_ESQUERDA
    LDA OPCAO

    SUB #0x6
    JZ MOVE_DIREITA
    LDA OPCAO

; confirma a jogada depois do MOVIMENTO do CURSOR
    SUB #0X3
    JZ JOG_CONFIRMADA
    JMP LEITURA

;===================================
; SUBROTINA de jogada confirmada
;===================================
JOG_CONFIRMADA:
    LDA TURNO
    SUB #1
    JZ OPCAO_JOG_XIS

    LDA TURNO
    SUB #2
    JZ OPCAO_JOG_CIRCULO
    JMP LEITURA

;========================================
;SUBROTINAS do cursor
;========================================
;o pos_cursor é o numero da posição, antes de mover
;a subrotina checa de a proxima posição será válida
MOVE_CIMA:
    LDA POS_CURSOR
    SUB #1
    JZ LEITURA
    LDA POS_CURSOR
    SUB #2
    JZ LEITURA
    LDA POS_CURSOR
    SUB #3
    JZ LEITURA
    STA NOVA_POS
    JMP ATUALIZA_TELA

MOVE_BAIXO:
    LDA POS_CURSOR
    SUB #7
    JZ LEITURA
    LDA POS_CURSOR
    SUB #8
    JZ LEITURA
    LDA POS_CURSOR
    SUB #9
    JZ LEITURA
    LDA POS_CURSOR
    ADD #3
    STA NOVA_POS
    JMP ATUALIZA_TELA

MOVE_ESQUERDA:
    LDA POS_CURSOR
    SUB #1
    JZ LEITURA
    LDA POS_CURSOR
    SUB #4
    JZ LEITURA
    LDA POS_CURSOR
    SUB #7
    JZ LEITURA
    LDA POS_CURSOR
    SUB #1
    STA NOVA_POS
    JMP ATUALIZA_TELA

MOVE_DIREITA:
    LDA POS_CURSOR
    SUB #3
    JZ LEITURA
    LDA POS_CURSOR
    SUB #6
    JZ LEITURA
    LDA POS_CURSOR
    SUB #9
    JZ LEITURA
    LDA POS_CURSOR
    ADD #1
    STA NOVA_POS
    JMP ATUALIZA_TELA

OPCAO_JOG_CIRCULO:
    LDA POS_CURSOR
    SUB #1
    JZ JOG_C1
    LDA POS_CURSOR


    SUB #2
    JZ JOG_C2
    LDA OPCAO

    SUB #3
    JZ JOG_C3
    LDA POS_CURSOR

    SUB #4
    JZ JOG_C4
    LDA POS_CURSOR

    SUB #5
    JZ JOG_C5
    LDA POS_CURSOR

    SUB #6
    JZ JOG_C6
    LDA POS_CURSOR

    SUB #7
    JZ JOG_C7
    LDA POS_CURSOR

    SUB #8
    JZ JOG_C8
    LDA POS_CURSOR

    SUB #9
    JZ JOG_C9
    LDA POS_CURSOR

OPCAO_JOG_XIS:
    ; verifica OPCAO DE JOGADA do jogador XIS
    LDA POS_CURSOR
    SUB #1
    JZ JOG_X1
    LDA POS_CURSOR

    SUB #2
    JZ JOG_X2
    LDA POS_CURSOR

    SUB #3
    JZ JOG_X3
    LDA POS_CURSOR

    SUB #4
    JZ JOG_X4
    LDA POS_CURSOR

    SUB #5
    JZ JOG_X5
    LDA POS_CURSOR

    SUB #6
    JZ JOG_X6
    LDA POS_CURSOR

    SUB #7
    JZ JOG_X7
    LDA POS_CURSOR

    SUB #8
    JZ JOG_X8
    LDA POS_CURSOR

    SUB #9
    JZ JOG_X9
    LDA POS_CURSOR

    JMP LEITURA ; caso a opcao digitada pelo usuário é inválida


;=========================================
; ATUALIZAÇÃO VISUAL TELA (DESENHA CURSOR)
;=========================================
ATUALIZA_TELA:
    LDA POS_CURSOR
    SUB #1
    JZ APAGA_C1
    LDA POS_CURSOR
    SUB #2
    JZ APAGA_C2
    LDA POS_CURSOR
    SUB #3
    JZ APAGA_C3
    LDA POS_CURSOR
    SUB #4
    JZ APAGA_C4
    LDA POS_CURSOR
    SUB #5
    JZ APAGA_C5
    LDA POS_CURSOR
    SUB #6
    JZ APAGA_C6
    LDA POS_CURSOR
    SUB #7
    JZ APAGA_C7
    LDA POS_CURSOR
    SUB #8
    JZ APAGA_C8
    LDA POS_CURSOR
    SUB #9
    JZ APAGA_C9
    JMP EFETIVA_POS

APAGA_C1:
    LDA corb
    STA cor1
    LDA #24
    TRAP cursor1
    LDA #0xFC
    STA cor1
    JSR FORMA1
    JMP EFETIVA_POS
APAGA_C2:
    LDA corb
    STA cor2
    LDA #24
    TRAP cursor2
    LDA #0xFC
    STA cor2
    JSR FORMA2
    JMP EFETIVA_POS
APAGA_C3:
    LDA corb
    STA cor3
    LDA #24
    TRAP cursor3
    LDA #0xFC
    STA cor3
    JSR FORMA3
    JMP EFETIVA_POS
APAGA_C4:
    LDA corb
    STA cor4
    LDA #24
    TRAP cursor4
    LDA #0xFC
    STA cor4
    JSR FORMA4
    JMP EFETIVA_POS
APAGA_C5:
    LDA corb
    STA cor5
    LDA #24
    TRAP cursor5
    LDA #0xFC
    STA cor5
    JSR FORMA5
    JMP EFETIVA_POS
APAGA_C6:
    LDA corb
    STA cor6
    LDA #24
    TRAP cursor6
    LDA #0xFC
    STA cor6
    JSR FORMA6
    JMP EFETIVA_POS
APAGA_C7:
    LDA corb
    STA cor7
    LDA #24
    TRAP cursor7
    LDA #0xFC
    STA cor7
    JSR FORMA7
    JMP EFETIVA_POS
APAGA_C8:
    LDA corb
    STA cor8
    LDA #24
    TRAP cursor8
    LDA #0xFC
    STA cor8
    JSR FORMA8
    JMP EFETIVA_POS
APAGA_C9:
    LDA corb
    STA cor9
    LDA #24
    TRAP cursor9
    LDA #0xFC
    STA cor9
    JSR FORMA9
    JMP EFETIVA_POS

EFETIVA_POS:
    ; Efetiva a nova posição
    LDA NOVA_POS
    STA POS_CURSOR

    LDA POS_CURSOR
    SUB #1
    JZ DESENHA_C1
    LDA POS_CURSOR
    SUB #2
    JZ DESENHA_C2
    LDA POS_CURSOR
    SUB #3
    JZ DESENHA_C3
    LDA POS_CURSOR
    SUB #4
    JZ DESENHA_C4
    LDA POS_CURSOR
    SUB #5
    JZ DESENHA_C5
    LDA POS_CURSOR
    SUB #6
    JZ DESENHA_C6
    LDA POS_CURSOR
    SUB #7
    JZ DESENHA_C7
    LDA POS_CURSOR
    SUB #8
    JZ DESENHA_C8
    LDA POS_CURSOR
    SUB #9
    JZ DESENHA_C9
    JMP LEITURA

DESENHA_C1:
    LDA #24
    TRAP cursor1
    JSR FORMA1
    JMP LEITURA
DESENHA_C2:
    LDA #24
    TRAP cursor2
    JSR FORMA2
    JMP LEITURA
DESENHA_C3:
    LDA #24
    TRAP cursor3
    JSR FORMA3
    JMP LEITURA
DESENHA_C4:
    LDA #24
    TRAP cursor4
    JSR FORMA4
    JMP LEITURA
DESENHA_C5:
    LDA #24
    TRAP cursor5
    JSR FORMA5
    JMP LEITURA
DESENHA_C6:
    LDA #24
    TRAP cursor6
    JSR FORMA6
    JMP LEITURA
DESENHA_C7:
    LDA #24
    TRAP cursor7
    JSR FORMA7
    JMP LEITURA
DESENHA_C8:
    LDA #24
    TRAP cursor8
    JSR FORMA8
    JMP LEITURA
DESENHA_C9:
    LDA #24
    TRAP cursor9
    JSR FORMA9
    JMP LEITURA

;========================================
; SUBROTINAS de desenho das formas
;========================================
F_FIM:
    RET

FORMA1:
    LDA TAB
    SUB #1          ; checa se é um circulo
    JNZ F1_XIS      ; se não for desenha o xis
    LDA #25
    TRAP circulo1S  ; sombra 1 circulo
    LDA #25
    TRAP circulo1SS ; sombra 2 circulo
    LDA #25
    TRAP circulo1   ; circulo básico
    RET

F1_XIS:
    LDA TAB
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis11SS    ; sombra 2 traço direito do X
    LDA #23
    TRAP xis12SS    ; sombra 2 traço esquero do X
    LDA #23
    TRAP xis11S     ; sombra 1 traço direito do X
    LDA #23
    TRAP xis12S     ; sombra 1 traço esquero do X
    LDA #23
    TRAP xis11      ; traço direito do X
    LDA #23
    TRAP xis12      ; traço esquero do X
    JMP F_FIM

FORMA2:
    LDA TAB+1
    SUB #1          
    JNZ F2_XIS      
    LDA #25
    TRAP circulo2S  
    LDA #25
    TRAP circulo2SS 
    LDA #25
    TRAP circulo2   
    RET

F2_XIS:
    LDA TAB+1
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis21SS    
    LDA #23
    TRAP xis22SS    
    LDA #23
    TRAP xis21S     
    LDA #23
    TRAP xis22S     
    LDA #23
    TRAP xis21      
    LDA #23
    TRAP xis22      
    JMP F_FIM

FORMA3:
    LDA TAB+2
    SUB #1          
    JNZ F3_XIS      
    LDA #25
    TRAP circulo3S  
    LDA #25
    TRAP circulo3SS 
    LDA #25
    TRAP circulo3   
    RET


F3_XIS:
    LDA TAB+2
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis31SS    
    LDA #23
    TRAP xis32SS    
    LDA #23
    TRAP xis31S     
    LDA #23
    TRAP xis32S     
    LDA #23
    TRAP xis31      
    LDA #23
    TRAP xis32      
    JMP F_FIM

FORMA4:
    LDA TAB+3
    SUB #1          
    JNZ F4_XIS      
    LDA #25
    TRAP circulo4S  
    LDA #25
    TRAP circulo4SS 
    LDA #25
    TRAP circulo4   
    RET

F4_XIS:
    LDA TAB+3
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis41SS    
    LDA #23
    TRAP xis42SS    
    LDA #23
    TRAP xis41S     
    LDA #23
    TRAP xis42S     
    LDA #23
    TRAP xis41      
    LDA #23
    TRAP xis42      
    JMP F_FIM

FORMA5:
    LDA TAB+4
    SUB #1          
    JNZ F5_XIS      
    LDA #25
    TRAP circulo5S  
    LDA #25
    TRAP circulo5SS 
    LDA #25
    TRAP circulo5   
    RET

F5_XIS:
    LDA TAB+4
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis51SS    
    LDA #23
    TRAP xis52SS    
    LDA #23
    TRAP xis51S     
    LDA #23
    TRAP xis52S     
    LDA #23
    TRAP xis51      
    LDA #23
    TRAP xis52      
    JMP F_FIM

FORMA6:
    LDA TAB+5
    SUB #1          
    JNZ F6_XIS      
    LDA #25
    TRAP circulo6S  
    LDA #25
    TRAP circulo6SS 
    LDA #25
    TRAP circulo6   
    RET

F6_XIS:
    LDA TAB+5
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis61SS    
    LDA #23
    TRAP xis62SS    
    LDA #23
    TRAP xis61S     
    LDA #23
    TRAP xis62S     
    LDA #23
    TRAP xis61      
    LDA #23
    TRAP xis62      
    JMP F_FIM

FORMA7:
    LDA TAB+6
    SUB #1          
    JNZ F7_XIS      
    LDA #25
    TRAP circulo7S  
    LDA #25
    TRAP circulo7SS 
    LDA #25
    TRAP circulo7   
    RET

F7_XIS:
    LDA TAB+6
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis71SS    
    LDA #23
    TRAP xis72SS    
    LDA #23
    TRAP xis71S     
    LDA #23
    TRAP xis72S     
    LDA #23
    TRAP xis71      
    LDA #23
    TRAP xis72      
    JMP F_FIM

FORMA8:
    LDA TAB+7
    SUB #1          
    JNZ F8_XIS      
    LDA #25
    TRAP circulo8S  
    LDA #25
    TRAP circulo8SS 
    LDA #25
    TRAP circulo8   
    RET

F8_XIS:
    LDA TAB+7
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis81SS    
    LDA #23
    TRAP xis82SS    
    LDA #23
    TRAP xis81S     
    LDA #23
    TRAP xis82S     
    LDA #23
    TRAP xis81      
    LDA #23
    TRAP xis82      
    JMP F_FIM

FORMA9:
    LDA TAB+8
    SUB #1          
    JNZ F9_XIS      
    LDA #25
    TRAP circulo9S  
    LDA #25
    TRAP circulo9SS 
    LDA #25
    TRAP circulo9   
    RET

F9_XIS:
    LDA TAB+8
    SUB #4
    JNZ F_FIM
    LDA #23
    TRAP xis91SS    
    LDA #23
    TRAP xis92SS    
    LDA #23
    TRAP xis91S     
    LDA #23
    TRAP xis92S     
    LDA #23
    TRAP xis91      
    LDA #23
    TRAP xis92      
    JMP F_FIM




;========================================
; SUBROTINAS do jogador CÍRCULO
;========================================
JOG_C1:
    LDA TAB
    JNZ LEITURA
    LDA #1
    STA TAB   ;grava circulo na memoria
    JSR FORMA1

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C2:
    LDA TAB+1
    JNZ LEITURA
    LDA #1
    STA TAB+1
    JSR FORMA2

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C3:
    LDA TAB+2
    JNZ LEITURA
    LDA #1
    STA TAB+2
    JSR FORMA3

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C4:
    LDA TAB+3
    JNZ LEITURA
    LDA #1
    STA TAB+3 
    JSR FORMA4

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C5:
    LDA TAB+4
    JNZ LEITURA
    LDA #1
    STA TAB+4 
    JSR FORMA5

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C6:
    LDA TAB+5
    JNZ LEITURA
    LDA #1
    STA TAB+5 
    JSR FORMA6

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C7:
    LDA TAB+6
    JNZ LEITURA
    LDA #1
    STA TAB+6 
    JSR FORMA7

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C8:
    LDA TAB+7
    JNZ LEITURA
    LDA #1
    STA TAB+7 
    JSR FORMA8

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_C9:
    LDA TAB+8
    JNZ LEITURA
    LDA #1
    STA TAB+8 
    JSR FORMA9

    LDA #2
    STA TURNO
    JMP CHECA_FIM_RODADA

;==========================
; SUBROTINAS do jogador XIS
;==========================
JOG_X1:
    LDA TAB
    JNZ LEITURA
    LDA #4
    STA TAB
    JSR FORMA1

    ; troca turno para JOG CIRCULO
    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X2:
    LDA TAB+1
    JNZ LEITURA
    LDA #4
    STA TAB+1
    JSR FORMA2

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X3:
    LDA TAB+2
    JNZ LEITURA
    LDA #4
    STA TAB+2
    JSR FORMA3

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X4:
    LDA TAB+3
    JNZ LEITURA
    LDA #4
    STA TAB+3
    JSR FORMA4

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X5:
    LDA TAB+4
    JNZ LEITURA
    LDA #4
    STA TAB+4
    JSR FORMA5

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X6:
    LDA TAB+5
    JNZ LEITURA
    LDA #4
    STA TAB+5
    JSR FORMA6

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X7:
    LDA TAB+6
    JNZ LEITURA
    LDA #4
    STA TAB+6
    JSR FORMA7

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X8:
    LDA TAB+7
    JNZ LEITURA
    LDA #4
    STA TAB+7
    JSR FORMA8

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

JOG_X9:
    LDA TAB+8
    JNZ LEITURA
    LDA #4
    STA TAB+8
    JSR FORMA9

    LDA #1
    STA TURNO
    JMP CHECA_FIM_RODADA

;=============================
; CHECAGEM APÓS UMA JOGADA
;=============================
CHECA_FIM_RODADA:
    JSR VERIFICA_VITORIA ; checa as 8 trincas (3 linhas, 3 colunas e 2 diagonais)
    STA RESULTADO_VIT ; salva o retorno de VERIFICA_VITORIA: 0 se ngm venceu, 1 se círculo venceu e 2 se xis venceu (o que foi pro AC com o RET de VERIFICA_VITORIA)

    ; Teste pra ver se círculo venceu (retorno foi 1)
    SUB #1
    JZ VITORIA_CIRCULO

    ; Teste pra ver se xis venceu (retorno foi 2)
    LDA RESULTADO_VIT
    SUB #2
    JZ VITORIA_XIS

    ; Se ninguém venceu, jogo segue com a LEITURA
    JMP LEITURA

;===========================
; ROTINAS DE ENCERRAMENTO
;===========================
VITORIA_CIRCULO:
    LDA #1 ; vitória do circulo 
    OUT 0 ; exibe o 1 no display hex de saída
    HLT

VITORIA_XIS:
    LDA #2
    OUT 0
    HLT

RESULTADO_VIT: DB 0 ; recebe o número referente a quem ganhou

;===================================
; SUB-ROTINA DE VERIFICAR A VITÓRIA
;===================================
VERIFICA_VITORIA: 
; Verifica se teve vitória em alguma das trincas utilizando CHECA_TRINCA: se a soma de cada das posições da trinca der 3, é vitória do círculo (já que o número do círculo é 1) e retorna 1,
; se der 12, é vitória do xis (já que seu número é 4) e retorna 2
   
    ; --- LINHA 1 (posições 1, 2, 3: TAB, TAB+1. TAB+2) ---
    LDA TAB
    ADD TAB+1
    ADD TAB+2
    JSR CHECA_TRINCA ; se a trinca teve vencedor, CHECA_TRINCA retorna 1 ou 2 no AC, se não tiver, retorna 0
    JNZ FIM_CHECAGEM ; se houve vitória, salta pra FIM_CHECAGEM, que encerra a sub-rotina com RET, que envia o código do vencedor pra AC

    ; --- LINHA 2 (posições 4, 5, 6: TAB+3, TAB+4, TAB+5)
    LDA TAB+3 
    ADD TAB+4 
    ADD TAB+5 
    JSR CHECA_TRINCA 
    JNZ FIM_CHECAGEM

    ; --- LINHA 3 (posições 7, 8, 9: TAB+6, TAB+7, TAB+8)
    LDA TAB+6
    ADD TAB+7
    ADD TAB+8
    JSR CHECA_TRINCA
    JNZ FIM_CHECAGEM

    ; ---COLUNA 1 (posições 1, 4, 7) --- 
    LDA TAB 
    ADD TAB+3 
    ADD TAB+6 
    JSR CHECA_TRINCA 
    JNZ FIM_CHECAGEM

    ; --- COLUNA 2 (posições 2, 5, 8) --- 
    LDA TAB+1 
    ADD TAB+4 
    ADD TAB+7 
    JSR CHECA_TRINCA 
    JNZ FIM_CHECAGEM

    ; --- COLUNA 3 (posições 3, 6, 9) --- 
    LDA TAB+2 
    ADD TAB+5 
    ADD TAB+8 
    JSR CHECA_TRINCA 
    JNZ FIM_CHECAGEM

    ; --- DIAGONAL 1 (posições 1, 5, 9) --- 
    LDA TAB 
    ADD TAB+4 
    ADD TAB+8 
    JSR CHECA_TRINCA 
    JNZ FIM_CHECAGEM

    ; --- DIAGONAL 2 (posições 3, 5, 7) --- 
    LDA TAB+2 
    ADD TAB+4 
    ADD TAB+6 
    JSR CHECA_TRINCA 
    JNZ FIM_CHECAGEM

    ; Se nenhuma trinca tiver vitória (soma 3 ou 12)
    LDA #0 
    RET

FIM_CHECAGEM:
    RET

;======================================
; CHECAR SE TRINCA TEVE SOMA 3 OU 12
;======================================
CHECA_TRINCA:
    STA SOMA_TEMP

    ; Testa se soma == 3
    SUB #3
    JZ VIT_CIRCULO ; se, ao subtrair 3, fica = 0, é pq soma era 3 e foi vitória do círculo

    ; Testa se soma == 12
    LDA SOMA_TEMP
    SUB #12
    JZ VIT_XIS

    ; Se não deu nem 3 nem 12
    LDA #0
    RET

; Responde pra VERIFICA_VITORIA qual dos jogadores completou a trinca
VIT_CIRCULO:
    LDA #1 ; retorna 1 no AC se círculo tiver ganhado
    RET

VIT_XIS:
    LDA #2 ; retorna 2 no AC se xis tiver ganhado
    RET

SOMA_TEMP: DB 0

;==========================
; VARIAVEIS
;==========================
; VARIÁVEL do DISPLAY
BACKGROUND:
    corb: DB 243
VIDEO_CONFIG:
    DW VIDEO_BASE
LIMPAR:
    DB 3

; VARIAVEL ordem dos jogadores
TURNO:
    DB 1;

; VARIÁVEL da JOGADA escolhida pelo jogador
OPCAO:
    DB 0;
POS_CURSOR:
    DB 1
NOVA_POS:
    DB 1

; VARIAVEIS DE MEMORIA DO TABULEIRO
TAB:
    DS 9

;VARIAVEIS cursor
cursor1:
    DB 32, 0, 20, 20
cor1: DB 0xFC
cursor2:
    DB 53, 0, 21, 20
cor2: DB 0xFC
cursor3:
    DB 75, 0, 20, 20
cor3: DB 0xFC
cursor4:
    DB 32, 21, 20, 21
cor4: DB 0xFC
cursor5:
    DB 53, 21, 21, 21
cor5: DB 0xFC
cursor6:
    DB 75, 21, 20, 21
cor6: DB 0xFC
cursor7:
    DB 32, 43, 20, 21
cor7: DB 0xFC
cursor8:
    DB 53, 43, 21, 21
cor8: DB 0xFC
cursor9:
    DB 75, 43, 20, 21
cor9: DB 0xFC

; VARIÁVEIS do tabuleiro
jogo1V:
    DB 52, 0, 52, 63, 0
jogo2V:
    DB 74, 0, 74, 63, 0
jogo1H:
    DB 32, 20, 94, 20, 0
jogo2H:
    DB 32, 42, 94, 42, 0

; VARIÁVEIS (jogadas possíveis) do jogador CIRCULO
; coordenadas e cor
circulo1:
    DB 40, 9, 8, 0, 0
circulo1S:
    DB 41, 9, 8, 73, 0
circulo1SS:
    DB 42, 9, 8, 73, 0

circulo2:
    DB 62, 9, 8, 0, 0
circulo2S:
    DB 63, 9, 8, 73, 0
circulo2SS:
    DB 64, 9, 8, 73, 0

circulo3:
    DB 84, 9, 8, 0, 0
circulo3S:
    DB 85, 9, 8, 73, 0
circulo3SS:
    DB 86, 9, 8, 73, 0

circulo4:
    DB 40, 31, 8, 0,  0
circulo4S:
    DB 41, 31, 8, 73, 0
circulo4SS:
    DB 42, 31, 8, 73, 0

circulo5:
    DB 62, 31, 8, 0,  0
circulo5S:
    DB 63, 31, 8, 73, 0
circulo5SS:
    DB 64, 31, 8, 73, 0

circulo6:
    DB 84, 31, 8, 0,  0
circulo6S:
    DB 85, 31, 8, 73, 0
circulo6SS:
    DB 86, 31, 8, 73, 0

circulo7:
    DB 40, 53, 8, 0,  0
circulo7S:
    DB 41, 53, 8, 73, 0
circulo7SS:
    DB 42, 53, 8, 73, 0

circulo8:
    DB 62, 53, 8, 0,  0
circulo8S:
    DB 63, 53, 8, 73, 0
circulo8SS:
    DB 64, 53, 8, 73, 0

circulo9:
    DB 84, 53, 8, 0,  0
circulo9S:
    DB 85, 53, 8, 73, 0
circulo9SS:
    DB 86, 53, 8, 73, 0

; VARIÁVEIS (jogadas possíveis) do jogador XIS
; coordenadas e cor
xis11:
    DB 34, 3, 47, 16, 0
xis11S:
    DB 35, 3, 48, 16, 0
xis11SS:
    DB 36, 3, 49, 16, 73
xis12:
    DB 34, 16, 47, 3, 0
xis12S:
    DB 35, 16, 48, 3, 0
xis12SS:
    DB 36, 16, 49, 3, 73

xis21:
    DB 56, 3, 69, 16, 0
xis21S:
    DB 57, 3, 70, 16, 0
xis21SS:
    DB 58, 3, 71, 16, 73
xis22:
    DB 56, 16, 69, 3, 0
xis22S:
    DB 57, 16, 70, 3, 0
xis22SS:
    DB 58, 16, 71, 3, 73

xis31:
    DB 78, 3, 91, 16, 0
xis31S:
    DB 79, 3, 92, 16, 0
xis31SS:
    DB 80, 3, 93, 16, 73
xis32:
    DB 78, 16, 91, 3, 0
xis32S:
    DB 79, 16, 92, 3, 0
xis32SS:
    DB 80, 16, 93, 3, 73

xis41:
    DB 34, 25, 47, 38, 0
xis41S:
    DB 35, 25, 48, 38, 0
xis41SS:
    DB 36, 25, 49, 38, 73
xis42:
    DB 34, 38, 47, 25, 0
xis42S:
    DB 35, 38, 48, 25, 0
xis42SS:
    DB 36, 38, 49, 25, 73

xis51:
    DB 56, 25, 69, 38, 0
xis51S:
    DB 57, 25, 70, 38, 0
xis51SS:
    DB 58, 25, 71, 38, 73
xis52:
    DB 56, 38, 69, 25, 0
xis52S:
    DB 57, 38, 70, 25, 0
xis52SS:
    DB 58, 38, 71, 25, 73

xis61:
    DB 78, 25, 91, 38, 0
xis61S:
    DB 79, 25, 92, 38, 0
xis61SS:
    DB 80, 25, 93, 38, 73
xis62:
    DB 78, 38, 91, 25, 0
xis62S:
    DB 79, 38, 92, 25, 0
xis62SS:
    DB 80, 38, 93, 25, 73

xis71:
    DB 34, 47, 47, 60, 0
xis71S:
    DB 35, 47, 48, 60, 0
xis71SS:
    DB 36, 47, 49, 60, 73
xis72:
    DB 34, 60, 47, 47, 0
xis72S:
    DB 35, 60, 48, 47, 0
xis72SS:
    DB 36, 60, 49, 47, 73

xis81:
    DB 56, 47, 69, 60, 0
xis81S:
    DB 57, 47, 70, 60, 0
xis81SS:
    DB 58, 47, 71, 60, 73
xis82:
    DB 56, 60, 69, 47, 0
xis82S:
    DB 57, 60, 70, 47, 0
xis82SS:
    DB 58, 60, 71, 47, 73

xis91:
    DB 78, 47, 91, 60, 0
xis91S:
    DB 79, 47, 92, 60, 0
xis91SS:
    DB 80, 47, 93, 60, 73
xis92:
    DB 78, 60, 91, 47, 0
xis92S:
    DB 79, 60, 92, 47, 0
xis92SS:
    DB 80, 60, 93, 47, 73


VIDEO_BASE EQU 16384 ; 0x4000

END MAIN