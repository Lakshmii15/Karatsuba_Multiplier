# Karatsuba Multiplier (16-bit) in Verilog

## Overview
This project implements a **16-bit Karatsuba Multiplier** using **Verilog**. The Karatsuba algorithm is an efficient multiplication algorithm that reduces the number of required multiplication operations compared to the traditional approach.

## Features
- **16-bit input support**
- **Reduced complexity** compared to conventional multiplication
- **Hierarchical design** for modular implementation
- **Optimized for FPGA/ASIC implementations**

## Algorithm Overview
The Karatsuba algorithm works as follows:
1. **Divide**: Split two 16-bit numbers into two 8-bit halves.
2. **Recursive Multiplication**: Compute three partial products instead of four.
3. **Combine**: Use additions and shifts to construct the final result.

Mathematically, given two 16-bit numbers `X` and `Y`:
```
X = XH * 2^8 + XL
Y = YH * 2^8 + YL
```
Then:
```
P1 = XH * YH
P2 = XL * YL
P3 = (XH + XL) * (YH + YL) - P1 - P2
```
Final result:
```
Result = (P1 << 16) + (P3 << 8) + P2
```

## File Structure
```
/karatsuba_multiplier
│── src/
│   │── karatsuba_multiplier.v  # Main Karatsuba multiplier module
│   │── karatsuba_testbench.v   # Testbench for simulation
│── README.md  # Project documentation
│── Makefile   # Script for automation (if applicable)
│── reports/   # Performance and resource usage reports
```

## How to Run
### Simulation
Use any Verilog simulator like ModelSim, Icarus Verilog, or Vivado:
```sh
iverilog -o karatsuba_sim src/karatsuba_multiplier.v src/karatsuba_testbench.v
vvp karatsuba_sim
```

### Synthesis
For FPGA synthesis using Xilinx Vivado:
```sh
vivado -mode batch -source synthesize.tcl
```

## Testbench
The testbench verifies the functionality of the Karatsuba multiplier by comparing the computed result with the expected product.

## Applications
- High-speed digital signal processing (DSP)
- Cryptographic computations
- Large integer arithmetic
- FPGA and ASIC-based acceleration



