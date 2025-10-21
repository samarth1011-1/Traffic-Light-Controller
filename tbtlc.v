`timescale 1ns/1ps
module tlc_tb;
reg clk,rst;
wire [2:0] out;

tlc dut(.rst(rst), .clk(clk), .light_out(out));

initial clk=0;
always #5 clk=~clk;

initial begin
    $dumpfile("tlc.vcd");
    $dumpvars(0,tlc_tb);
    $monitor("Time=%0t  Rst = %b  Out = %b",$time,rst,out);
    rst=1;  
    #10 rst=0;
    #300 rst=1;
    #600 rst = 0;
  #1000 $finish;
end
endmodule