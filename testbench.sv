
module FIFO_test;
  bit clk, rst;
  logic [7:0] wr_data;
  logic [7:0] r_data;
  op_type op;
  status_type status;
  
  logic [7:0] test_memory[$];
  logic [7:0] test_r_data;

  FIFO DUT(.clk(clk), .rst(rst), .wr_data(wr_data), .r_data(r_data), .op(op), .status(status));
  
  always #10 clk = ~clk;
  
  
  
  always @(posedge clk) begin : FIFO_bhvr;              //Simplified FIFO to compare with design
    if (op == WRITE) #5 test_memory.push_back(wr_data);
    if (op == READ)  #5 assert (test_memory.pop_front() == r_data);
  end
  

    
  
  initial begin 
    
    $dumpfile("dump.vcd");
    $dumpvars(0, FIFO_test);
    
    rst = 1;
    
    for (int i = 0; i < 20; i++) begin
      wr_data = $random;
      op = op_type'($random);
      #40;
    end
    
    
    
    $finish;
  end
  
endmodule