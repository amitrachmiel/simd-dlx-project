# SIMD-Extended DLX Processor for Multimedia Applications

## Overview

This project is a final-year undergraduate project in Electrical Engineering at Tel Aviv University. It presents the design, implementation, and testing of an extended DLX processor architecture with SIMD (Single Instruction, Multiple Data) capabilities, aimed at accelerating multimedia and digital signal processing tasks.

The extended processor architecture includes a custom parallel ALU and support for 39 new SIMD instructions. It allows parallel processing of 8-bit and 16-bit subwords and is implemented on an FPGA (Xilinx Spartan-6). The project achieved significant improvements in performance and power efficiency for real-time image processing tasks such as Block Matching, Matrix Transpose, and Image Sharpening.

---

## Features

- Custom SIMD extension for the DLX processor architecture
- 39 new SIMD instructions implemented in Verilog
- Support for 8-bit and 16-bit parallel operations
- Parallel ALU with configurable modes (32-bit / 2x16-bit / 4x8-bit)
- Python-based assembler to generate `.DATA` files for simulation
- Simulation and verification using ModelSim and Xilinx tools
- Real-world implementation on Spartan-6 FPGA
- Application use cases: Block Matching, Matrix Transpose, Image Sharpening

---

## Performance Summary

| Application         | Basic DLX Cycles | SIMD DLX Cycles | Speedup | Energy Saving |
|---------------------|------------------|------------------|---------|----------------|
| Block Matching       | 175              | 17               | ×10.3   | ~96%           |
| Matrix Transpose     | 62               | 4                | ×15.5   | ~99%           |
| Image Sharpening     | 297              | 94               | ×3.2    | ~88%           |

- FPGA area increase: ~128.57%
- Power reduction: 88–99% across tasks

---

## Project Structure
├── assembler/           # Python code for assembling custom SIMD assembly
├── rtl/                 # Verilog HDL files for DLX processor and SIMD ALU
├── simulations/         # Testbenches and ModelSim projects, data files and cod files
├── bit_file/            # bit_file of processsor for resa
├── examples/            # Assembly programs for image processing tasks
├── fpga/                # Xilinx project files and constraints
├── docs/                # Final report, diagrams, results
└── README.md




### Prerequisites

- Python 3.x
- ModelSim
- Xilinx ISE (for Spartan-6 FPGA)
- RESA environment (for hardware testing)

### Assembling and Running Code

1. Write DLX or SIMD-compatible assembly code.
2. Use the custom Python assembler to convert `.txt` files into `.DATA` format.
3. Load the `.DATA` files into the simulation environment (ModelSim).
4. Load the `.cod` files into the simulation environment (RESA).
5. Run simulations to validate logic (ModelSim) and real-time performance (FPGA).

---

## Authors

- **Tom Bernstein** 
- **Amit Rachmiel** 
- **Supervisor**: Oren Ganon  
- **Institution**: Tel Aviv University, Faculty of Engineering

---

## License

This project is provided for academic and research purposes only.  
For reuse or collaboration, please contact the authors.


