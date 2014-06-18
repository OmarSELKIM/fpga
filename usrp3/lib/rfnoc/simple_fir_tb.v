//
// Copyright 2012-2013 Ettus Research LLC
//


module simple_fir_tb();
   
   //xlnx_glbl glbl (.GSR(),.GTS());
   
   localparam STR_SINK_FIFOSIZE = 9;
      
   reg clk, reset;
   always
     #100 clk = ~clk;

   initial clk = 0;
   initial reset = 1;
   initial #1000 reset = 0;
   
   initial $dumpfile("simple_fir_tb.vcd");
   initial $dumpvars(0,simple_fir_tb);

   initial #1000000 $finish;

   wire [15:0] i_tdata;
   wire [25:0] o_tdata;
   wire        i_tvalid, i_tready, o_tvalid, o_tready;
   
   simple_fir #(.MAX_LEN_LOG2(10), .WIDTH(16)) simple_fir
     (.clk(clk), .reset(reset), .clear(0),
      .len(20),
      .i_tdata(i_tdata), .i_tvalid(i_tvalid), .i_tready(i_tready),
      .o_tdata(o_tdata), .o_tvalid(o_tvalid), .o_tready(o_tready));

   assign i_tdata = 1;
   assign i_tvalid = 1;
   assign o_tready = 1;
   
      
endmodule // simple_fir_tb
