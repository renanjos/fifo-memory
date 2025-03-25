  typedef enum logic [1:0] {
    READ    = 2'b00,
    WRITE   = 2'b01,
    STANDBY = 2'b10
  } op_type;
  
  typedef enum logic [2:0] {
    empty     = 3'b000,
    full      = 3'b001,
    underflow = 3'b010,
    overflow  = 3'b011,
    normal    = 3'b100
  } status_type;