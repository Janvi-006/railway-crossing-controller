## Railway Crossing Controller — Verilog Project

## Project Description
- This project simulates a railway crossing gate controller using Verilog HDL.
- The goal was to understand how digital logic and finite state machines can model a real-world safety system.
- I first built a basic version of the controller, then upgraded it into a more adaptive system with additional states and timing logic to better represent how an actual railway gate behaves.
- This project helped me learn how sequential logic works in practice and how simulation tools are used in digital design.

## What the Controller Does
The controller monitors train detection sensors and controls:
- Railway gate (open/close)
- Signal indication

The upgraded version introduces multiple states to safely handle:
- Train arrival
- Crossing phase
- Safety delay before reopening

This prevents unsafe gate behavior and mimics real-world timing.

## Design Approach
The controller is implemented using a Finite State Machine (FSM).
The main states include:
- Idle: no train detected, gate open
- Approach: train arrival detected
- Passing: train crossing
- Safety wait: delay before reopening
- Clear: system resets to idle
The FSM structure made it easier to organize logic and transitions.

## Tools Used
- Verilog HDL
- Icarus Verilog (simulation)
- GTKWave (waveform viewer)
- VS Code

## how to run simulation
```
iverilog -o railway.out adaptive_railway.v adaptive_tb.v
vvp railway.out
gtkwave railway.vcd
```
## What I Learned
- Basics of FSM-based design
- Sequential logic behavior
- Simulation workflow
- Debugging digital circuits
- Structuring HDL projects

## Author
Janvi
