`include "FF.v"

module contador (
    input CLK,
    input ENB,
    input [1:0] MODO,
    input [3:0] D,
    output [3:0] Q,
    output RCO);

    reg [3:0] d_In;
    reg d_Out;


always @(*) begin
    case (MODO[1:0])
        2'b00 : begin 
            d_Out = 1'b0;  
            d_In = Q+1; 
            if (Q[3:0] == 4'b1111) begin 
                d_Out = 1'b1; 
            end
        end 
        2'b01 : begin 
            d_Out = 1'b0;  
            d_In = Q-1; 
            if (Q[3:0] == 4'b0000)
            begin
                d_Out = 1'b1;
            end
        end 
        2'b10 : begin 
            d_Out = 1'b0;  
            d_In = Q-3;    
        end 
        2'b11 : begin 
            d_Out = 1'b0;  
            d_In = D;      
        end
        default: begin 
            d_Out = d_Out; 
            d_In = d_In;   
        end
    endcase
end

FF #(.BITS(4)) DFF_4bits(
    .CLK    (CLK), 
    .EN     (ENB), 
    .D      (d_In[3:0]), 
    .Q      (Q[3:0])); 

FF DFF_1bit(
    .CLK    (CLK), 
    .EN     (ENB), 
    .D      (d_Out), 
    .Q      (RCO)); 

endmodule