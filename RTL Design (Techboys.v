module Techboys_4bit (
    input wire clk,
    input wire reset,
    input wire write_en,
    input wire [1:0] w_addr,
    input wire [3:0] w_data,
    input wire [1:0] r_addr1,
    input wire [1:0] r_addr2,
    output wire [3:0] r_data1,
    output wire [3:0] r_data2
);

    reg [3:0] reg_array [3:0];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 4; i = i + 1) begin
                reg_array[i] <= 4'b0000;
            end
        end else if (write_en) begin
            reg_array[w_addr] <= w_data;
        end
    end

    assign r_data1 = reg_array[r_addr1];
    assign r_data2 = reg_array[r_addr2];

endmodule
