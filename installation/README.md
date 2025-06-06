# Installation Guide

This guide explains how to install all the software tools required to run and test the custom Verilog-based CPU project.

## 1. Python

**Purpose**: Used for assembling assembly code.

- **Recommended version**: Python 3.8 or later  
- **Download**: https://www.python.org/downloads/  


## 2. Assembly (Assembler Script)

**Purpose**: In this project, the assembly code is used to implement image processing operations that demonstrate the **parallel execution capabilities** of the custom-designed CPU. 

- The assembler script is included in the project under `/examples/`.

## 3. Xilinx ISE Design Suite 14.7 (WebPACK)

**Purpose**: Write, synthesize, and implement Verilog code on FPGA (Spartan-6).

- **Required for**: Spartan-6 boards 
- **Download**:  
  https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools/14-7.html
- **Note**: You need to register on the Xilinx website. Choose the WebPACK edition (free version).
- **OS Compatibility**: Best supported on Windows 10.

## 4. ModelSim

**Purpose**: Run Verilog testbenches and simulate CPU behavior.

- **Recommended version**: ModelSim Student Edition or ModelSim Xilinx Edition (MXE)
- **Download**:  
  https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/model.html
- **Alternative**: You can also use the simulation environment built into Xilinx ISE.

## 5. RESA (Custom Simulation/Visualization Tool)

**Purpose**: A custom tool to visualize CPU operation or memory state.
**Background**: RESA was developed by the Advanced Computer Architecture Lab at Tel Aviv University.



## System Requirements

- **OS**: Windows 10 or Ubuntu 20.04+  
- **RAM**: At least 8GB  
- **Disk Space**: ~20GB (for Xilinx ISE and ModelSim)  
- **Drivers**: Make sure Spartan-6 USB drivers are installed (included in ISE)

## Workflow Summary

1. Write assembly code in `.asm` format.
2. Use the Python assembler script to generate binary memory files.
3. Open the project in Xilinx ISE, synthesize and generate a `.bit` file.
4. Load the `.bit` file onto the Spartan-6 FPGA board.
5. Use ModelSim or RESA for simulation and debugging.
