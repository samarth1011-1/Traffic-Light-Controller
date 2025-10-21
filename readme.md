# Traffic Light Controller using verilog

A simple FSM-based traffic light controller implemented using verilog

### Features
- 3-state Moore machine ( Red->Green->Yellow->Red )
- Parameterized timing counters for each light ( Red=10s, Green=10s, Yellow=3s )
- Completely synthesizable for FGPA implementation

## State Diagram
![alt text](image.png)

## Waveform
![alt text](image-1.png)

## Steps to run
1. Simulate with **Icarus Verilog**:
   ```verilog
   iverilog -o tlc TrafficLightController.v tbltc.v
   vvp tlc