`default_nettype none
module servant_machxo2
(
 output wire q);

   parameter    memfile = "blinky.hex";
   parameter    memsize = 512;

   wire         wb_clk;
   reg  wb_rst = 1'b1;

   always @(posedge wb_clk) begin
     wb_rst <= 1'b0;
   end

   OSCH #(
     .NOM_FREQ("16.63")
   ) clock_gen (
     .STDBY(1'b0),
     .OSC(wb_clk)
   );

   servant
     #(.memfile (memfile),
       .memsize (memsize))
   servant
     (.wb_clk (wb_clk),
      .wb_rst (wb_rst),
      .q      (q));

endmodule
