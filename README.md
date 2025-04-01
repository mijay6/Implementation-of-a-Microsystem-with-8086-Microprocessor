# Implementarea unui Microsistem cu Microprocesorul 8086

## Descriere
Acest proiect prezintă proiectarea și implementarea unui microsistem bazat pe microprocesorul 8086. Sistemul include unitate centrală, memorii EPROM și SRAM, interfețe seriale și paralele, minitastatură, leduri, afișaj cu 7 segmente și modul LCD, precum și programe pentru configurarea și funcționarea acestuia.

## Structura microsistemului
- Unitate centrală cu microprocesorul 8086
- 128 KB memorie EPROM, utilizând circuite 27C512
- 64 KB memorie SRAM, utilizând circuite 62256
- Interfaţă serială, cu circuitul 8251, plasată în zona 04D0H – 04D2H sau 05D0H – 05D2H, în funcţie de poziţia microcomutatorului S1
- Interfaţă paralelă, cu circuitul 8255, plasată în zona 0250H– 0256H sau 0A50H – 0A56H, în funcţie de poziţia microcomutatorului S2
- O minitastatură cu 9 contacte
- 10 led-uri
- Un modul de afişare cu 7 segmente, cu 8 ranguri (se pot afişa maxim 8 caractere hexa simultan)
- Un modul LCD, cu 2 linii a câte 16 caractere fiecare

## Programe
Proiectul include următoarele rutine:
- Rutine de programare ale circuitelor 8251 şi 8255
- Rutine de emisie/recepţie caracter pe interfaţa serială
- Rutine pentru controlul afișajului cu 7 segmente
- Rutine pentru controlul ledurilor
- Rutine pentru minitastatură

## Autor
Dobra Mihai

Universitatea Politehnica Timișoara  
Facultatea de Automatica si Calculatoare  
Proiectarea cu Microprocesoare  
Anul universitar 2024-2025
