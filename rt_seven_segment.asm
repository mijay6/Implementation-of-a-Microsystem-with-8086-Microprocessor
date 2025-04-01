; Ne definim adresele porturilor pentru segmente
SEG_PORT1 EQU 0308h   ; adresa primului port pentru segmente
SEG_PORT2 EQU 030Ch   ; adresa celui de-al doilea port pentru segmente
SEG_PORT3 EQU 0310h   ; adresa celui de-al treilea port pentru segmente
SEG_PORT4 EQU 0314h   ; adresa celui de-al patrulea port pentru segmente
SEG_PORT5 EQU 0318h   ; adresa celui de-al cincilea port pentru segmente
SEG_PORT6 EQU 031Ch   ; adresa celui de-al saselea port pentru segmente
SEG_PORT7 EQU 0320h   ; adresa celui de-al saptelea port pentru segmente
SEG_PORT8 EQU 0324h   ; adresa celui de-al optulea port pentru segmente

; Definim si caracterele in hexa
HEX_0 EQU C0h
HEX_1 EQU F9h
HEX_2 EQU A4h
HEX_3 EQU B0h
HEX_4 EQU 99h
HEX_5 EQU 92h
HEX_6 EQU 82h
HEX_7 EQU F8h
HEX_8 EQU 80h
HEX_9 EQU 98h
HEX_A EQU 88h
HEX_B EQU 83h
HEX_C EQU C6h
HEX_D EQU A1h
HEX_E EQU 86h
HEX_F EQU 8Eh

;------------------------------------------
; Subrutina pentru afisarea unui segment
; Input: BL = numarul segmentului (1-8)
; AL = caracterul hexazecimal (0-9, A-F) - in cazul nostru vom alege numarul 4
;------------------------------------------

SEG_ON proc
    CMP BL, 1          ; Verificam daca segmentul este in portul 1
    JAE PORT_1_ON      ; Daca da vom folosi portul 1

    CMP BL, 2          ; Verificam daca segmentul este in portul 2
    JAE PORT_2_ON      ; Daca da vom folosi portul 2

    CMP BL, 3          ; Verificam daca segmentul este in portul 3
    JAE PORT_3_ON      ; Daca da vom folosi portul 3

    CMP BL, 4          ; Verificam daca segmentul este in portul 4
    JAE PORT_4_ON      ; Daca da vom folosi portul 4

    CMP BL, 5          ; Verificam daca segmentul este in portul 5
    JAE PORT_5_ON      ; Daca da vom folosi portul 5

    CMP BL, 6          ; Verificam daca segmentul este in portul 6
    JAE PORT_6_ON      ; Daca da vom folosi portul 6

    CMP BL, 7          ; Verificam daca segmentul este in portul 7
    JAE PORT_7_ON      ; Daca da vom folosi portul 7

    ; daca nu, folosim portul 8
    MOV DX, SEG_PORT8  ; selectam portul 8
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET                ; iesim din subrutina

    ; pentru primul port
PORT_1_ON:
    MOV DX, SEG_PORT1  ; selectam portul 1
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

    ; pentru al doilea port
PORT_2_ON:
    MOV DX, SEG_PORT2  ; selectam portul 2
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

    ; pentru al treilea port
PORT_3_ON:
    MOV DX, SEG_PORT3  ; selectam portul 3
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

    ; pentru al patrulea port
PORT_4_ON:
    MOV DX, SEG_PORT4  ; selectam portul 4
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

    ; pentru al cincilea port
PORT_5_ON:
    MOV DX, SEG_PORT5  ; selectam portul 5
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

    ; pentru al saselea port
PORT_6_ON:
    MOV DX, SEG_PORT6  ; selectam portul 6
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

    ; pentru al saptelea port
PORT_7_ON:
    MOV DX, SEG_PORT7  ; selectam portul 7
    MOV AL, HEX_4      ; afisam caracterul 4
    OUT DX, AL         ; trimitem valoarea in port
    RET

SEG_ON endp

;------------------------------------------
; Exemplu de utilizare a subrutinei SEG_ON
;------------------------------------------

MOV BL, 4            ; setam BL = 4 pentru a aprinde segmentul 4
CALL SEG_ON          ; apelam subrutina
