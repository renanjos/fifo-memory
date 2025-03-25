`include "types.svh"


module FIFO
  (
   input                 clk, rst,
   input logic [7:0]     wr_data,
   output logic [7:0]    r_data,
   input  op_type        op,
   output status_type    status = empty
  ); 
  

  
  logic [7:0] memory [0:15];
  logic [3:0] wr_ptr = 0;
  logic [3:0] r_ptr = 0;
  
  always @(posedge clk) begin
    
    if (!rst) begin
      r_data <= 0;
      status <= empty;
      for (int i = 0; i < 16; i++) memory[i] <= 8'b0;
    end
    
    else begin //if rst
      
      
    
    if (wr_ptr == r_ptr) begin                                             //Check empty/underflow
      if (op == READ) status <= underflow;
      else status <= empty;
    end                                                                    //Check empty/underflow
    
    
    
    if ((r_ptr == wr_ptr + 1) || ((r_ptr == 0) && (wr_ptr == 15))) begin  //Check full/overflow
      if (op == WRITE) status <= overflow;
      else status <= full;
    end                                                                   //Check full/overflow
    
    
    
      
    case (op)
      
      
      READ : begin                                          //read
             
        if (status != empty && status != underflow) begin  //if not empty
          r_data <= memory[r_ptr];                         //Memory slot where pointer is is read
          r_ptr <= r_ptr + 1;                              //Mover pointer
          status <= normal;
          if (r_ptr == 16) r_ptr <= 0;                     //Return to first slot if last slot is read
        end                                                //if not empty
        
      end                                                  //read
      
      
      WRITE : begin                                     //write
        
        if (status != full && status != overflow) begin //If not full
          memory[wr_ptr] <= wr_data;                    //data is written where pointer is located
          wr_ptr <= wr_ptr + 1;                         //Move pointer
          status <= normal;
          if (wr_ptr == 16) wr_ptr <= 0;                //Return to first slot if last slot is written
        end                                             //If not full
        
      end                                               //write
      
      
      STANDBY : begin
        //Nothing is done
      end
      
      default: begin
        //Nothing is done
      end
      
    endcase
      
    end //rst else
    
  end //always

endmodule
