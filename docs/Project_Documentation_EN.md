# Implementation of a Microsystem with 8086 Microprocessor

*Politehnica University of Timișoara*  
*Faculty of Automation and Computer Science*  
*Microprocessor Design*

**Author: Dobra Mihai**  
**Academic Year: 2024-2025**

## Project Theme

Design of a microsystem based on the 8086 microprocessor, including central unit, EPROM and SRAM memories, serial and parallel interfaces, mini-keyboard, LEDs, 7-segment display and LCD module, as well as programs for its configuration and operation.

## Microsystem Structure:
- Central unit with 8086 microprocessor
- 128 KB EPROM memory, using 27C512 circuits
- 64 KB SRAM memory, using 62256 circuits
- Serial interface, with 8251 circuit, placed in the 04D0H - 04D2H or 05D0H - 05D2H area, depending on the position of microswitch S1
- Parallel interface, with 8255 circuit, placed in the 0250H - 0256H or 0A50H - 0A56H area, depending on the position of microswitch S2
- A mini-keyboard with 9 contacts
- 10 LEDs
- A 7-segment display module, with 8 ranks (maximum 8 hex characters can be displayed simultaneously)
- An LCD module, with 2 lines of 16 characters each, with an interface of the student's choice

## Programs:
- Programming routines for 8251 and 8255 circuits
- Character transmission/reception routines on the serial interface
- Character transmission routine on parallel interface
- Mini-keyboard scanning routine
- LED on/off routine
- Routine for displaying a hex character on a segment rank

## Hardware Description

### Control Unit

The central unit of the designed microsystem is based on the 8086 microprocessor, a 16-bit device used for data control and processing. This microprocessor offers advanced functionalities, including separate buses for data and addresses (through a multiplexing technology), various addressing modes, and a complex instruction set.

### Microprocessor Configuration and Working Mode

The 8086 microprocessor operates in two main modes that can be set via the MN/MX# pin:
- **Minimum Mode**: In this mode, the microprocessor itself manages the control signals, memory activation, and input/output devices, plus it doesn't need an external bus. This is the mode used in the project because it is suitable for simple systems, and therefore it is connected to VCC, to activate MN on logical "1".
- **Maximum Mode**: Allows the use of a coprocessor or complex peripherals, with the microprocessor having a central coordination role.

### Main Signals of the Microprocessor

- **AD0-AD15 (Multiplexed Bus)**: Uses the same pins for data and addresses, reducing the number of connections required.
- **A15-A19**: Pins from the additional address bus ranges.
- **BHE# (Bus High Enable)**: Indicates whether a transfer takes place on the upper half of the data bus.
- **ALE (Address Latch Enable)**: Activates the storage of addresses from the multiplexed bus.
- **RD# and WR#**: Control read/input and write/output operations, synchronizing access to buses.
- **M/IO# (Memory/Input-Output)**: Determines whether the current operation is intended for memory (when it has value 1) or a device through input/output ports (value 0).
- **DT/R# (Data Transmit/Receive)**: Shows the direction of transfer on the data bus ("1" indicates transmission and "0" indicates reception).
- **DEN# (Data Enable)**: Validates the data transfer on the bus.
- **RESET**: For processor reset/initialization.
- **CLK**: Is the clock signal input, in this case with a frequency given by the 8284A device described below.
- **READY (Wait State Control)**: Input for synchronizing the microprocessor and slow devices; when active (high level), the microprocessor continues the current operation. When inactive (low level), it enters a wait state until the peripheral or memory completes the operation.
