/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module displayModule_7 (
    input clk,
    input rst,
    input [4:0] digit1,
    input [4:0] digit2,
    input [4:0] digit3,
    input [4:0] digit4,
    input [4:0] digit5,
    input [4:0] digit6,
    output reg [7:0] led1x,
    output reg [7:0] led1y,
    output reg [7:0] led2x,
    output reg [7:0] led2y,
    output reg [7:0] led3x,
    output reg [7:0] led3y,
    output reg [7:0] led4x,
    output reg [7:0] led4y
  );
  
  
  
  wire [5-1:0] M_ledM_ledx;
  wire [8-1:0] M_ledM_ledy;
  reg [1-1:0] M_ledM_clk;
  reg [1-1:0] M_ledM_rst;
  reg [5-1:0] M_ledM_digit;
  reg [3-1:0] M_ledM_cycle;
  ledMatrix_17 ledM (
    .clk(M_ledM_clk),
    .rst(M_ledM_rst),
    .digit(M_ledM_digit),
    .cycle(M_ledM_cycle),
    .ledx(M_ledM_ledx),
    .ledy(M_ledM_ledy)
  );
  
  wire [5-1:0] M_ledM2_ledx;
  wire [8-1:0] M_ledM2_ledy;
  reg [1-1:0] M_ledM2_clk;
  reg [1-1:0] M_ledM2_rst;
  reg [5-1:0] M_ledM2_digit;
  reg [3-1:0] M_ledM2_cycle;
  ledMatrix_17 ledM2 (
    .clk(M_ledM2_clk),
    .rst(M_ledM2_rst),
    .digit(M_ledM2_digit),
    .cycle(M_ledM2_cycle),
    .ledx(M_ledM2_ledx),
    .ledy(M_ledM2_ledy)
  );
  
  wire [5-1:0] M_ledM3_ledx;
  wire [8-1:0] M_ledM3_ledy;
  reg [1-1:0] M_ledM3_clk;
  reg [1-1:0] M_ledM3_rst;
  reg [5-1:0] M_ledM3_digit;
  reg [3-1:0] M_ledM3_cycle;
  ledMatrix_17 ledM3 (
    .clk(M_ledM3_clk),
    .rst(M_ledM3_rst),
    .digit(M_ledM3_digit),
    .cycle(M_ledM3_cycle),
    .ledx(M_ledM3_ledx),
    .ledy(M_ledM3_ledy)
  );
  
  wire [5-1:0] M_ledM4_ledx;
  wire [8-1:0] M_ledM4_ledy;
  reg [1-1:0] M_ledM4_clk;
  reg [1-1:0] M_ledM4_rst;
  reg [5-1:0] M_ledM4_digit;
  reg [3-1:0] M_ledM4_cycle;
  ledMatrix_17 ledM4 (
    .clk(M_ledM4_clk),
    .rst(M_ledM4_rst),
    .digit(M_ledM4_digit),
    .cycle(M_ledM4_cycle),
    .ledx(M_ledM4_ledx),
    .ledy(M_ledM4_ledy)
  );
  
  wire [5-1:0] M_ledM5_ledx;
  wire [8-1:0] M_ledM5_ledy;
  reg [1-1:0] M_ledM5_clk;
  reg [1-1:0] M_ledM5_rst;
  reg [5-1:0] M_ledM5_digit;
  reg [3-1:0] M_ledM5_cycle;
  ledMatrix_17 ledM5 (
    .clk(M_ledM5_clk),
    .rst(M_ledM5_rst),
    .digit(M_ledM5_digit),
    .cycle(M_ledM5_cycle),
    .ledx(M_ledM5_ledx),
    .ledy(M_ledM5_ledy)
  );
  
  wire [5-1:0] M_ledM6_ledx;
  wire [8-1:0] M_ledM6_ledy;
  reg [1-1:0] M_ledM6_clk;
  reg [1-1:0] M_ledM6_rst;
  reg [5-1:0] M_ledM6_digit;
  reg [3-1:0] M_ledM6_cycle;
  ledMatrix_17 ledM6 (
    .clk(M_ledM6_clk),
    .rst(M_ledM6_rst),
    .digit(M_ledM6_digit),
    .cycle(M_ledM6_cycle),
    .ledx(M_ledM6_ledx),
    .ledy(M_ledM6_ledy)
  );
  
  reg [2:0] M_matrix_counter_d, M_matrix_counter_q = 1'h0;
  
  always @* begin
    M_matrix_counter_d = M_matrix_counter_q;
    
    M_ledM_clk = clk;
    M_ledM_rst = rst;
    M_ledM_cycle = M_matrix_counter_q;
    M_ledM2_clk = clk;
    M_ledM2_rst = rst;
    M_ledM2_cycle = M_matrix_counter_q;
    M_ledM3_clk = clk;
    M_ledM3_rst = rst;
    M_ledM3_cycle = M_matrix_counter_q;
    M_ledM4_clk = clk;
    M_ledM4_rst = rst;
    M_ledM4_cycle = M_matrix_counter_q;
    M_ledM5_clk = clk;
    M_ledM5_rst = rst;
    M_ledM5_cycle = M_matrix_counter_q;
    M_ledM6_clk = clk;
    M_ledM6_rst = rst;
    M_ledM6_cycle = M_matrix_counter_q;
    M_ledM_digit = digit1;
    M_ledM2_digit = digit2;
    M_ledM3_digit = digit3;
    M_ledM4_digit = digit4;
    M_ledM5_digit = digit5;
    M_ledM6_digit = digit6;
    led1y = 8'h00;
    led1x = 8'h00;
    led2y = 8'h00;
    led2x = 8'h00;
    led3y = 8'h00;
    led3x = 8'h00;
    led4y = 8'h00;
    led4x = 8'h00;
    led1x = M_ledM_ledy;
    led2x = M_ledM2_ledy;
    led3x = M_ledM3_ledy;
    led4x = M_ledM4_ledy;
    led1y[3+4-:5] = ~M_ledM_ledx;
    led1y[0+2-:3] = ~M_ledM2_ledx[2+2-:3];
    led2y[6+1-:2] = ~M_ledM2_ledx[0+1-:2];
    led2y[1+4-:5] = ~M_ledM3_ledx;
    led2y[0+0-:1] = ~M_ledM4_ledx[4+0-:1];
    led3y[4+3-:4] = ~M_ledM4_ledx[0+3-:4];
    led3y[0+3-:4] = ~M_ledM5_ledx[1+3-:4];
    led4y[7+0-:1] = ~M_ledM5_ledx[0+0-:1];
    led4y[2+4-:5] = ~M_ledM6_ledx[0+4-:5];
    led4y[0+1-:2] = 2'h3;
    M_matrix_counter_d = M_matrix_counter_q + 1'h1;
    if (M_matrix_counter_q == 3'h7) begin
      M_matrix_counter_d = 1'h1;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_matrix_counter_q <= 1'h0;
    end else begin
      M_matrix_counter_q <= M_matrix_counter_d;
    end
  end
  
endmodule
