; Ne definim adresele porturilor pentru minitastaura
TAST_PORT1 EQU 0328H ; Adresa portului de iesire al tastaturii
TAST_PORT2 EQU 032CH ; Adresa portului de intrare al tastaturii

;------------------------------------------
; Subrutina pentru scanarea minitastaturii
;------------------------------------------

TAST_SCAN proc

    ; punem pe 0 prima coloana si verificam daca sau actionat tastele 1,4 sau 7
    MOV AL, 0FEh            ; activam prima coloana, adica punem pe 0 bitul 0 pentru a curge curentul (1111 1110)
    OUT TAST_PORT1, AL      ; scriem in portul de iesire al tastaturii
    IN AL, TAST_PORT2       ; citim din portul de intrare al tastaturii
    AND AL, 01H             ; verificam linea 1, daca sa apasat tasta 1 (bitul 0)
    JZ TASTA1               ; daca bitul 0 este 0, tasta 1 a fost apasata
    IN AL, TAST_PORT2       ; daca nu, citim din nou portul de intrare al tastaturii
    AND AL, 02H             ; verificam linea 2, daca sa apasat tasta 4 (bitul 1)
    JZ TASTA4               ; daca bitul 1 este 0, tasta 4 a fost apasata
    IN AL, TAST_PORT2          
    AND AL, 04H             ; verificam linea 3, daca sa apasat tasta 7 (bitul 2)
    JZ TASTA7               ; daca bitul 2 este 0, tasta 7 a fost apasata

    ; punem pe 0 a doua coloana si verificam daca sau actionat tastele 2,5 sau 8
    MOV AL, 0FDh            ; activam a doua coloana, adica punem pe 0 bitul 1 pentru a curge curentul (1111 1101)
    OUT TAST_PORT1, AL      ; scriem in portul de iesire al tastaturii
    IN AL, TAST_PORT2       ; citim din portul de intrare al tastaturii
    AND AL, 01H             ; verificam linea 1, daca sa apasat tasta 2 (bitul 0)
    JZ TASTA2               ; daca bitul 0 este 0, tasta 2 a fost apasata
    IN AL, TAST_PORT2
    AND AL, 02H             ; verificam linea 2, daca sa apasat tasta 5 (bitul 1)
    JZ TASTA5               ; daca bitul 1 este 0, tasta 5 a fost apasata
    IN AL, TAST_PORT2
    AND AL, 04H             ; verificam linea 3, daca sa apasat tasta 8 (bitul 2)
    JZ TASTA8               ; daca bitul 2 este 0, tasta 8 a fost apasata

    ; punem pe 0 a treia coloana si verificam daca sau actionat tastele 3,6 sau 9
    MOV AL, 0FBh            ; activam a treia coloana, adica punem pe 0 bitul 2 pentru a curge curentul (1111 1011)
    OUT TAST_PORT1, AL      ; scriem in portul de iesire al tastaturii
    IN AL, TAST_PORT2       ; citim din portul de intrare al tastaturii
    AND AL, 01H             ; verificam linea 1, daca sa apasat tasta 3 (bitul 0)
    JZ TASTA3               ; daca bitul 0 este 0, tasta 3 a fost apasata
    IN AL, TAST_PORT2
    AND AL, 02H             ; verificam linea 2, daca sa apasat tasta 6 (bitul 1)
    JZ TASTA6               ; daca bitul 1 este 0, tasta 6 a fost apasata
    IN AL, TAST_PORT2
    AND AL, 04H             ; verificam linea 3, daca sa apasat tasta 9 (bitul 2)
    JZ TASTA9               ; daca bitul 2 este 0, tasta 9 a fost apasata

    JMP TAST_SCAN           ; daca nu s-a apasat nicio tasta, repetam procesul

;  Subrutine pentru tratarea fiecare taste apasata
TASTA1:
    CALL DELAY              ; asteapta stabilizarea contactelor
AST1:  
    IN AL, TAST_PORT2       ; citim din nou starea liniilor
    AND AL, 01H             ; verificam daca tasta 1 este inca apasata
    JZ AST1                 ; daca da, continuam asteptarea
    CALL DELAY              ; asteptam eliberarea tastei

    ; aici se va executa codul pentru tasta 1
    JMP TAST_SCAN           ; dupa ce am terminat, revenim la scanarea tastaturii

TASTA2:
    CALL DELAY
AST2:
    IN AL, TAST_PORT2
    AND AL, 01H
    JZ AST2
    CALL DELAY

    ; aici se va executa codul pentru tasta 2
    JMP TAST_SCAN

TASTA3:
    CALL DELAY
AST3:
    IN AL, TAST_PORT2
    AND AL, 01H
    JZ AST3
    CALL DELAY

    ; aici se va executa codul pentru tasta 3
    JMP TAST_SCAN

TASTA4:
    CALL DELAY
AST4:
    IN AL, TAST_PORT2
    AND AL, 02H
    JZ AST4
    CALL DELAY

    ; aici se va executa codul pentru tasta 4
    JMP TAST_SCAN

TASTA5:
    CALL DELAY
AST5:
    IN AL, TAST_PORT2
    AND AL, 02H
    JZ AST5
    CALL DELAY

    ; aici se va executa codul pentru tasta 5
    JMP TAST_SCAN

TASTA6:
    CALL DELAY
AST6:
    IN AL, TAST_PORT2
    AND AL, 02H
    JZ AST6
    CALL DELAY

    ; aici se va executa codul pentru tasta 6
    JMP TAST_SCAN

TASTA7:
    CALL DELAY
AST7:
    IN AL, TAST_PORT2
    AND AL, 03H
    JZ AST7
    CALL DELAY

    ; aici se va executa codul pentru tasta 7
    JMP TAST_SCAN

TASTA8:
    CALL DELAY
AST8:
    IN AL, TAST_PORT2
    AND AL, 03H
    JZ AST8
    CALL DELAY

    ; aici se va executa codul pentru tasta 8
    JMP TAST_SCAN

TASTA9:
    CALL DELAY
AST9:
    IN AL, TAST_PORT2
    AND AL, 03H
    JZ AST9
    CALL DELAY

    ; aici se va executa codul pentru tasta 9
    JMP TAST_SCAN

TAST_SCAN endp

;------------------------------------------
;Subrutina delay (Stabilizare contacte)
;------------------------------------------

DELAY PROC
    MOV CX, 0FFFFH    ; setam un contor mare
DELAY_LOOP:
    LOOP DELAY_LOOP   ; decrementam contorul pana cand ajunge la 0
    RET
DELAY ENDP