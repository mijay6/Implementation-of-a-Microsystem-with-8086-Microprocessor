; Ne definim adresele portului pentru leduri
LED_PORT1 EQU 0300h   ; Adresa portului de control al ledurilor 0-7
LED_PORT2 EQU 0304h   ; Adresa portului de control al ledurilor 8-9

; Definim si ledurile in hexa
LED1 EQU 0FEh
LED2 EQU 0FDh
LED3 EQU 0FBh
LED4 EQU 0F7h
LED5 EQU 0EFh
LED6 EQU 0DFh    
LED7 EQU 0BFh
LED8 EQU 07Fh
LED9 EQU 002h
LED10 EQU 001h

;------------------------------------------
; Subrutina pentru aprinderea uni led
; Input: AL = numarul ledului (0-9)
; Adica inainte se alege ce led vrem sa aprindem, numarul 8 in cazul nostru.(dam valoarea noi)
; MOV AL, 8
;------------------------------------------
LED_ON proc
    CMP AL, 8          ; Verificam daca ledul este in portul 2
    JAE PORT_2_ON      ; Daca da vom folosi portul 2

    ; daca nu, folosim portul 1
    MOV DX, LED_PORT1  ; selectam portul 1
    MOV AL, LED8       ; aprindem ledul (in cazul nostru ledul 8)
    OUT DX, AL         ; trimitem valoarea in port
    RET                ; iesim din subrutina

    ; pentru al doilea port
PORT_2_ON:
    MOV DX, LED_PORT2
    MOV AL, LED9       ; aici nu prea conteaza ce led aprindem (pentru ca nu se va aprinde in acest caz)
    OUT DX, AL
    RET
LED_ON endp

;------------------------------------------
; Exemplu de utilizare a subrutinei LED_ON
;------------------------------------------

MOV AL, 8            ; setam AL = 8 pentru a aprinde ledul 8
CALL LED_ON          ; apelam subrutina

;------------------------------------------
; Subrutina pentru stingerea uni led
; In cazul asta vom aprinde ledul 8 (dam noi valoarea)
; Input: AL = numarul ledului (0-9)
;------------------------------------------

LED_OFF proc
    CMP AL, 8          ; Verificam daca ledul este in portul 2
    JAE PORT_2_OFF     ; Daca da vom folosi portul 2

    ; daca nu, folosim portul 1
    MOV DX, LED_PORT1  ; selectam portul 1
    MOV AL, 0          ; stingem ledurile
    OUT DX, AL         ; trimitem valoarea in port
    RET                ; iesim din subrutina

    ; pentru al doilea port
PORT_2_OFF:
    MOV DX, LED_PORT2  ; selectam portul 2
    MOV AL, 0
    OUT DX, AL
    RET
LED_OFF endp

;------------------------------------------
; Exemplu de utilizare a subrutinei LED_OFF
;------------------------------------------

MOV AL, 8            ; setam AL = 8 pentru a stinge ledul 8
CALL LED_OFF         ; apelam subrutina

