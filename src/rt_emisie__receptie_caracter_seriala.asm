; Ne definim adresele porturilor ai 8251
PORT_8251_1 EQU 04D0H
PORT_8251_2 EQU 05D0H

;------------------------------------------
; Subrutina pentru emisie caracter seriala
; Input: CL = caracterul de transmis
;        BL = 0 pentru S1 = 0, BL = 1 pentru S1 = 1
;------------------------------------------

EMISIE_CARACTER_SERIALA PROC
    ; Calculam baza
    CMP BL,0              ; verificam intervalul
    JE  BASE_1_EMISIE     ; daca BL = 0, folosim baza PORT_8251_1
    MOV SI, PORT_8251_2   ; altfel, folosim baza PORT_8251_2
    JMP EMISIE_START      ; trecem la emisie

BASE_1_EMISIE:
    MOV SI, PORT_8251_1   ; folosim baza PORT_8251_1

EMISIE_START:
    ; Verificam TxRDY (bitul 1 din cuvantul de stare)
    MOV DX, SI            ; Adresa pentru date
    ADD DX, 2H            ; Adresa pentru comenzi/stari (04D2H sau 05D2H)
    
TX_WAIT:
    IN AL, DX             ; Citim cuvantul de stare
    RCR AL, 1             ; Testam bitul TxRDY
    JNC TX_WAIT           ; Daca TxRDY = 0, asteptam

    ; Trimitem caracterul
    MOV AL, CL            ; Incarcam caracterul
    MOV DX, SI            ; Adresa pentru date
    OUT DX, AL            ; Transmitem caracterul
    RET
TRANSMIT_CHAR ENDP

;------------------------------------------
; Exemplu de utilizare a subrutinei EMISIE_CARACTER_SERIALA
;------------------------------------------

MOV CL, 'A'                        ; caracterul de transmis
MOV BL, 0                          ; baza care o sa fie folosita
CALL EMISIE_CARACTER_SERIALA       ; apelam subrutina

;------------------------------------------
; Subrutina pentru receptie caracter seriala
; Output: CL = caracterul receptionat
;         BL = 0 pentru S1 = 0, BL = 1 pentru S1 = 1
;------------------------------------------

RECEPTIE_CARACTER_SERIALA PROC
    ; Calculam baza
    CMP BL,0              ; verificam intervalul
    JE  BASE_1_RECEPTIE   ; daca BL = 0, folosim baza PORT_8251_1
    MOV SI, PORT_8251_2   ; altfel, folosim baza PORT_8251_2
    JMP RECEPTIE_START    ; trecem la receptie

BASE_1_RECEPTIE:
    MOV SI, PORT_8251_1   ; folosim baza PORT_8251_1

RECEPTIE_START:
    ; Verificam RxRDY (bitul 2 din cuvantul de stare)
    MOV DX, SI            ; Adresa pentru date
    ADD DX, 2H            ; Adresa pentru comenzi/stari (04D2H sau 05D2H)

RX_WAIT:
    IN AL, DX             ; Citim cuvantul de stare
    RCR AL, 2             ; Testam bitul RxRDY
    JNC RX_WAIT           ; Daca RxRDY = 0, asteptam

    ; Citim caracterul receptionat
    MOV DX, SI            ; Adresa pentru date
    IN AL, DX             ; Citim caracterul
    MOV CL, AL            ; Stocam caraccterul in CL
    RET
    
RECEIVE_CHAR ENDP

;------------------------------------------
; Exemplu de utilizare a subrutinei RECEPTIE_CARACTER_SERIALA
;------------------------------------------

MOV BL, 0                          ; baza care o sa fie folosita
CALL RECEPTIE_CARACTER_SERIALA     ; apelam subrutina
; CL contine caracterul receptionat


