ORG 0

MAIN:

; inicializa DISPLAY e desenha TABULEIRO
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

    JMP LEITURA

ERRO:
    HLT ; caso de erro na inicializacao do display

; LEITURA do input do usuário
LEITURA:
    IN 0
    OR #0
    JZ LEITURA
    IN 0
    STA OPCAO
    LDA OPCAO

; verifica OPCAO DE JOGADA que jogador CIRCULO digitou
    SUB #0xA1
    JZ JOG_C1
    LDA OPCAO

    SUB #0xA2
    JZ JOG_C2
    LDA OPCAO

    SUB #0xA3
    JZ JOG_C3
    LDA OPCAO

    SUB #0xA4
    JZ JOG_C4
    LDA OPCAO

    SUB #0xA5
    JZ JOG_C5
    LDA OPCAO

    SUB #0xA6
    JZ JOG_C6
    LDA OPCAO

    SUB #0xA7
    JZ JOG_C7
    LDA OPCAO

    SUB #0xA8
    JZ JOG_C8
    LDA OPCAO

    SUB #0xA9
    JZ JOG_C9
    LDA OPCAO

; verifica OPCAO DE JOGADA que jogador XIS digitou
    SUB #0xB1
    JZ JOG_X1
    LDA OPCAO

    SUB #0xB2
    JZ JOG_X2
    LDA OPCAO

    SUB #0xB3
    JZ JOG_X3
    LDA OPCAO

    SUB #0xB4
    JZ JOG_X4
    LDA OPCAO

    SUB #0xB5
    JZ JOG_X5
    LDA OPCAO

    SUB #0xB6
    JZ JOG_X6
    LDA OPCAO

    SUB #0xB7
    JZ JOG_X7
    LDA OPCAO

    SUB #0xB8
    JZ JOG_X8
    LDA OPCAO

    SUB #0xB9
    JZ JOG_X9
    LDA OPCAO

    JMP LEITURA ; caso a opcao digitada pelo usuário é inválida

; SUBROTINAS do jogador CÍRCULO
JOG_C1:
    LDA #25
    TRAP circulo1S ; sombra 1 circulo
    LDA #25
    TRAP circulo1SS ; sombra 2 circulo
    LDA #25
    TRAP circulo1 ; circulo básico
    HLT

JOG_C2:
    LDA #25
    TRAP circulo2S
    LDA #25
    TRAP circulo2SS
    LDA #25
    TRAP circulo2
    HLT

JOG_C3:
    LDA #25
    TRAP circulo3S
    LDA #25
    TRAP circulo3SS
    LDA #25
    TRAP circulo3
    HLT

JOG_C4:
    LDA #25
    TRAP circulo4S
    LDA #25
    TRAP circulo4SS
    LDA #25
    TRAP circulo4
    HLT

JOG_C5:
    LDA #25
    TRAP circulo5S
    LDA #25
    TRAP circulo5SS
    LDA #25
    TRAP circulo5
    HLT

JOG_C6:
    LDA #25
    TRAP circulo6S
    LDA #25
    TRAP circulo6SS
    LDA #25
    TRAP circulo6
    HLT

JOG_C7:
    LDA #25
    TRAP circulo7S
    LDA #25
    TRAP circulo7SS
    LDA #25
    TRAP circulo7
    HLT

JOG_C8:
    LDA #25
    TRAP circulo8S
    LDA #25
    TRAP circulo8SS
    LDA #25
    TRAP circulo8
    HLT

JOG_C9:
    LDA #25
    TRAP circulo9S
    LDA #25
    TRAP circulo9SS
    LDA #25
    TRAP circulo9
    HLT

; SUBROTINAS do jogador XIS
JOG_X1:
    LDA #23
    TRAP xis11SS ; sombra 2 traço direito do X
    LDA #23
    TRAP xis12SS ; sombra 2 traço esquero do X
    LDA #23
    TRAP xis11S ; sombra 1 traço direito do X
    LDA #23
    TRAP xis12S ; sombra 1 traço esquero do X
    LDA #23
    TRAP xis11 ; traço direito do X
    LDA #23
    TRAP xis12 ; traço esquero do X
    HLT

JOG_X2:
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
    HLT

JOG_X3:
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
    HLT

JOG_X4:
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
    HLT

JOG_X5:
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
    HLT

JOG_X6:
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
    HLT

JOG_X7:
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
    HLT

JOG_X8:
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
    HLT

JOG_X9:
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
    HLT

; VARIÁVEL do DISPLAY
BACKGROUND:
    DB 243
VIDEO_CONFIG:
    DW VIDEO_BASE
LIMPAR:
    DB 3

; VARIÁVEL da JOGADA escolhida pelo jogador
OPCAO:
    DB 0;

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