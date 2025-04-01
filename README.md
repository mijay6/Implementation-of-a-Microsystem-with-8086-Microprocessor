# Implementation of a Microsystem with 8086 Microprocessor

[![Assembly](https://img.shields.io/badge/language-Assembly-blue.svg)](https://en.wikipedia.org/wiki/Assembly_language)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![University: UPT](https://img.shields.io/badge/University-Politehnica%20Timisoara-red.svg)](https://www.upt.ro/)
[![Status: Academic](https://img.shields.io/badge/Status-Academic%20Project-success.svg)](https://github.com/mijay6/Implementarea-unui-Microsistem-cu-Microprocesorul-8086)

## Description
This project presents the design and implementation of a microsystem based on the 8086 microprocessor. The system includes a central unit, EPROM and SRAM memories, serial and parallel interfaces, mini-keyboard, LEDs, 7-segment display, and LCD module, as well as programs for its configuration and operation.

## Microsystem Structure
- Central unit with 8086 microprocessor
- 128 KB EPROM memory, using 27C512 circuits
- 64 KB SRAM memory, using 62256 circuits
- Serial interface with 8251 circuit, placed in the 04D0H – 04D2H or 05D0H – 05D2H area, depending on the position of microswitch S1
- Parallel interface with 8255 circuit, placed in the 0250H– 0256H or 0A50H – 0A56H area, depending on the position of microswitch S2
- A mini-keyboard with 9 contacts
- 10 LEDs
- A 7-segment display module with 8 ranks (maximum 8 hex characters can be displayed simultaneously)
- An LCD module with 2 lines of 16 characters each

## Programs
The project includes the following routines:
- Programming routines for 8251 and 8255 circuits
- Character transmission/reception routines on the serial interface
- Character transmission routine on parallel interface
- Mini-keyboard scanning routine
- LED on/off routine
- Routine for displaying a hex character on a segment rank

## Documentation
- [Original Documentation (Romanian)](docs/Documentatie_Proiect.pdf)
- [Hardware Schematic](docs/SCH_Schema_Hardware_2025-01-07.pdf)

## Source Code
All assembly routines are available in the [src](src/) directory:
- Serial character transmission/reception
- Parallel character transmission
- LED control
- Mini-keyboard handling
- Circuit programming
- Seven-segment display control

## Author
Dobra Mihai

Politehnica University of Timișoara  
Faculty of Automation and Computer Science  
Microprocessor Design  
Academic Year 2024-2025

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.
