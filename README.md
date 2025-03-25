# fifo-memory

In this project, Verilog code for FIFO memory is presented. The First-In-First-Out (FIFO) memory with the following specification is implemented in Verilog:
16 stages
8-bit data width 
Status signals: 
Full: high when FIFO is full else low.
Empty: high when FIFO is empty else low.
Overflow: high when FIFO is full and still writing data into FIFO, else low.
Underflow: high when FIFO is empty and still reading data from FIFO, else low.
Threshold: high when the number of data in FIFO is less than a specific threshold, else lo
