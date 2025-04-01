; Ne definim adresele porturilor ai 8255
PORT_8255_1 EQU 0250H
PORT_8255_2 EQU 0A50H

;------------------------------------------
; Subrutina pentru emisie caracter paralela 
; (ne focalizam pe afisajul LCD din proiect)
; Input: CL = caracterul de transmis
;        BL = 0 pentru S2 = 0, BL = 1 pentru S2 = 1 
; (S2 este conmutatorului care selecteaza baza)
;------------------------------------------

EMISIE_CARACTER_PARALELA PROC
    ; Pasul 1: calculam baza
    CMP BL,0              ; verificam intervalul
    JE  BASE_1            ; daca BL = 0, folosim baza PORT_8255_1
    MOV SI, PORT_8255_2   ; altfel, folosim baza PORT_8255_2
    JMP EMISIE_START      ; trecem la emisie

BASE_1:
    MOV SI, PORT_8255_1   ; folosim baza PORT_8255_1

EMISIE_START:
    ; Pasul 2: setam RS si RW pe portul C 
    MOV DX, SI            ; Baza setata 
    ADD DX, 04H           ; adunam cu 4 ca sa ajungem la adresa portului C
    MOV AL, 01H           ; setam RS=1 (caracter) si RW=0(scriere) 
    OUT DX, AL            ; scriem pe portul C (semnalele de control pentru LCD)

    ; Pasul 3: trimitem caracterul pe portul A
    MOV DX, SI            ; Baza setata
    MOV AL, CL            ; caracterul de transmis
    OUT DX, AL            ; scriem pe portul A (caracterul de transmis)

    ; Pasul 4: generam semnalul de enable
    MOV DX, SI            ; Baza setata
    ADD DX, 04H           ; adunam cu 4 ca sa ajungem la adresa portului C
    OR AL, 04H            ; setam  bitul de eneable, E=1
    OUT DX, AL            ; scriem pe portul C semnalul de enable

    CALL DELAY_SHORT      ; introducem un delay scurt pentru a permite citirea informatiilor de catre LCD

    ; Pasul 5: resetam semnalul de enable
    AND AL, 01H           ; resetam bitul de enable, E=0
    OUT DX, AL            ; actualizam portul C

    RET
EMISIE_CARACTER_PARALELA ENDP

;------------------------------------------
;Subrutina delay scurt
;------------------------------------------

DELAY_SHORT PROC
    MOV CX, 0FFFH     ; setam un contor mare
DELAY_LOOP:
    LOOP DELAY_LOOP   ; decrementam contorul pana cand ajunge la 0
    RET
DELAY_SHORT ENDP

;------------------------------------------
; Exemplu de utilizare a subrutinei EMISIE_CARACTER_PARALELA
;------------------------------------------

MOV CL, 'A'                         ; caracterul de transmis
MOV BL, 0                           ; baza care o sa fie folosita
CALL EMISIE_CARACTER_PARALELA       ; apelam subrutina


; Explicatie semnal Enable:
; LCD-ul citeste informatiile (date sau comenzi)) doar cand detecteaza o 
; tranzitie de la 0 la 1 pe semnalul de enable. Dupa aceasta tranzitie
; lcd-ul citeste informatiile si le proceseaza. Lasam un scurt delay
; intre generarea enable si setarea enable la 0, pentru a permite lcd-ului
; sa citeasca informatiile. Dupa care setam enable pe 0
; In alte dizpozitive se poate trasnmite dupaia inca un semnal de enable de reconfirmare a semnalului
; de enable, pentru a evita erorile de transmisie.