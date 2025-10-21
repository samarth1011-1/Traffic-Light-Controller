module tlc(
    input rst,clk,
    output reg [2:0] light_out
);

localparam [1:0] S0=2'd0,S1=2'd1,S2=2'd2; // states
reg [1:0] ps,ns; // present and next state
localparam integer RED_TIME=10,GREEN_TIME=10,YELLOW_TIME=3;
reg [31:0] count=0;
parameter [2:0] red=3'b100,green=3'b010, yellow=3'b001;

// present state and reset block
always@(posedge clk or posedge rst)begin
   if(rst)begin
    ps<=S0; 
   end
   else begin
    ps<=ns;
   end
end

// next state with counter block
always@(*)begin
    case(ps)
    S0 : begin
        light_out = red;
        if(count<RED_TIME)begin
            ns = S0;
        end
        else begin
            ns = S1;
        end
    end
    S1 : begin
        light_out = green;
        if(count<GREEN_TIME)begin
            ns = S1;
        end
        else begin
            ns = S2;
        end
    end
    S2 : begin
        light_out = yellow;
        if(count<YELLOW_TIME)begin
            ns = S2;
        end
        else begin
            ns=S0;
            end
    end
    default : begin
        ns=S0;
        light_out=red;
    end
    endcase
end

// updating the count value
always@(posedge clk or posedge rst)begin
    if(rst)count<=0;
    else if(ns==ps)count<=count+1;
    else count<=0;
end
endmodule