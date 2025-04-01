; Ne definim adresele porturilor pentru 8251 si 8253
PORT_8251_1 EQU 04D0H
PORT_8251_2 EQU 05D0H
PORT_8255_1 EQU 0250H
PORT_8255_2 EQU 0A50H

;------------------------------------------
; Subrutina pentru configurarea circuitului 8251
; Input: Al = 0 pentru S1 = 0, Al = 1 pentru S1 = 1
; Configuram Cuvantul de Mod (mod asincron): 2 biti de stop,
; fara paritate, 8 biti de date si factor de multiplicare 16
; Configuram Cuvantul de Comanda: Resetarea biti de eroare, 
; activarea receptia datelor, activa transmiterea datelor
;------------------------------------------

CONFIG_8251 PROC
    CMP AL,0              ; verificam daca S1 = 0 sau S1 = 1
    JE SERIAL_S1_0        ; daca S1 = 1, trecem la configurarea pentru S1 = 1
    MOV DX, PORT_8251_2   ; selectam portul 2
    JMP CONFIG_SERIAL     ; trecem la configurarea circuitului 8251

SERIAL_S1_0:
    MOV DX, PORT_8251_1   ; selectam portul 1

CONFIG_SERIAL:
    MOV AL, 0CEH    ; in binar = 11001110
    OUT DX, AL      ; scriem cuvantul de mod
    MOV AL, 15H     ; in binar = 00010101
    OUT DX, AL      ; scriem cuvantul de comanda
    RET

CONFIG_8251 ENDP

;------------------------------------------
; Exemplu de utilizare a subrutinei CONFIG_8251
;------------------------------------------

MOV AL, 0            ; setam AL = 0 pentru S1 = 0
CALL CONFIG_8251     ; apelam subrutina

;------------------------------------------
; Subrutina pentru configurarea circuitului 8255
; Input: Al = 0 pentru S2 = 0, Al = 1 pentru S2 = 1
; (Cuvantul de control il vom configura astfel incat sa lucram cu ecrarnul LCD)
; Deci portul A fa vi de iesire, portul B ramane default, portul C inferior este de iesire (Semnalele:S,RW,E),
; si portul C superior ramane default, si modul de lucru 0 la grupul A.
;------------------------------------------

CONFIG_8255 PROC
    CMP AL,0              ; verificam daca S2 = 0 sau S2 = 1
    JE PARALLEL_S2_0      ; daca S2 = 1, trecem la configurarea pentru S2 = 1
    MOV DX, PORT_8255_2   ; selectam portul 2
    JMP CONFIG_PARALLEL   ; trecem la configurarea circuitului 8255

PARALLEL_S2_0:
    MOV DX, PORT_8255_1   ; selectam portul 1

CONFIG_PARALLEL:
    MOV AL, 80H    ; in binar = 10000000
    OUT DX, AL;    ; scriem cuvantul de control
    RET

CONFIG_8255 ENDP

;------------------------------------------
; Exemplu de utilizare a subrutinei CONFIG_8255
;------------------------------------------

MOV AL, 0            ; setam AL = 0 pentru S2 = 0
CALL CONFIG_8255     ; apelam subrutina