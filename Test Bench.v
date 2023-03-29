`timescale 1ns / 1ps
module Clock_Divider_TB();
  
    wire clk_out;
    reg clk_in;
    reg reset;
    reg [31:0] ratio;
  
    Clock_Divider DUT(clk_in,clk_out,reset,ratio);
  
    initial begin
    clk_in=0;
    reset=0;
    #5 reset=1;
    end
  
    always #25 clk_in=~clk_in; //Input Clock signal of 20MHz Frequency
  
    initial begin
    ratio=32'd20_000; //Generates a Clock Signal of 1kHz frequency
    #10_000_000 ratio=32'd10_000; //Generates a Clock Signal of 2kHz frequency
    #10_000_000 ratio=32'd5_000; //Generates a Clock Signal of 4kHz frequency
    end
  
endmodule
