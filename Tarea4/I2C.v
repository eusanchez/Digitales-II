module I2C(
    input wire clk,
    input wire rst,
    output reg sda_out,
    output reg sda_oe
    //output reg rd_data
);


reg [7:0] state;

reg [6:0] i2c_addres;

reg [7:0] contador;

reg [7:0] data;

always @(posedge clk) begin
    if (~rst) begin
        sda_oe <=  1;
    end else begin

        if ((state == 0) || (state == 1) || (state == 6)) begin
            sda_oe <= 1;
        end
        else begin
            sda_oe <= ~sda_oe;
        end
    end
end


always @(posedge clk) begin
    if (~rst) begin
        state <= 0;
        sda_out <= 0;
        sda_oe <= 0;
        //rd_data <= 0;
        i2c_addres <= 7'h50;
        contador <= 0;
        data <= 8'haa;
    end else begin
        case(state) 

        0: begin  //STATE IDLE
            sda_out = 1;
            state <= 1;
        end

        1: begin //STATE START
            sda_out <= 1;
            state <= 2;
            contador <= 6; //inicalizador del contaodr
        end

        2: begin //STATE ADDR
            sda_out <= i2c_addres[contador];
            if (contador == 0) state <= 3;
            else contador <= contador -1;
        end

        3: begin //STATE RW
            sda_out <= 1;
            state <= 4;

        end

        4: begin //STATE WACK
            state <= 5;
            contador <= 7;
        end

        5: begin //STATE DATA
            sda_out <= i2c_addres[contador];
            if(contador == 0) state <= 4;
            else contador <= contador -1;
        end

        6: begin //STATE STOP
            sda_out <= 1;
            state <= 0;
            
        end
    
        7: begin //STATE WACK2
            state <= 6;
        end
    endcase


    end
end

endmodule

