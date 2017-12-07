/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SEED = 9b000000011
*/
module prng_9 (
    input clk,
    input rst,
    input next,
    output reg [8:0] number,
    input [7:0] alufnc,
    output reg [5:0] alufn,
    output reg [7:0] alufna,
    output reg [7:0] alufnb,
    output reg prngdone
  );
  
  localparam SEED = 9'h003;
  
  
  reg [8:0] M_out_d, M_out_q = 1'h0;
  reg M_done_d, M_done_q = 1'h0;
  localparam WAIT_state = 3'd0;
  localparam CHECK1_state = 3'd1;
  localparam CHECK2_state = 3'd2;
  localparam C_state = 3'd3;
  localparam REROLL_state = 3'd4;
  
  reg [2:0] M_state_d, M_state_q = WAIT_state;
  reg M_reroll1_d, M_reroll1_q = 1'h0;
  reg M_reroll2_d, M_reroll2_q = 1'h0;
  
  reg temp;
  
  reg [8:0] temp_out;
  
  always @* begin
    M_state_d = M_state_q;
    M_done_d = M_done_q;
    M_reroll1_d = M_reroll1_q;
    M_reroll2_d = M_reroll2_q;
    M_out_d = M_out_q;
    
    alufn = 6'h00;
    alufna = 8'h00;
    alufnb = 8'h00;
    number = M_out_q;
    prngdone = M_done_q;
    
    case (M_state_q)
      REROLL_state: begin
        alufn = 6'h16;
        alufna = M_out_q[0+0-:1];
        alufnb = M_out_q[4+0-:1];
        temp = alufnc[0+0-:1];
        temp_out[0+7-:8] = M_out_q[1+7-:8];
        temp_out[8+0-:1] = temp;
        M_out_d = temp_out;
        M_state_d = CHECK1_state;
      end
      CHECK1_state: begin
        alufn = 6'h37;
        alufna = M_out_q[0+3-:4];
        alufnb = 4'h9;
        M_reroll1_d = alufnc[0+0-:1];
        M_state_d = CHECK2_state;
      end
      CHECK2_state: begin
        alufn = 6'h37;
        alufna = M_out_q[5+3-:4];
        alufnb = 4'h9;
        M_reroll2_d = alufnc[0+0-:1];
        M_state_d = C_state;
      end
      C_state: begin
        if (~M_reroll1_q || ~M_reroll2_q) begin
          M_state_d = REROLL_state;
        end else begin
          M_done_d = 1'h1;
          M_state_d = WAIT_state;
        end
      end
      WAIT_state: begin
        if (~next) begin
          M_done_d = 1'h0;
        end
        if (next & ~M_done_q) begin
          M_state_d = REROLL_state;
        end else begin
          M_state_d = WAIT_state;
        end
      end
      default: begin
        alufn = 6'h00;
        alufna = 8'h00;
        alufnb = 8'h00;
      end
    endcase
    if (rst) begin
      M_state_d = WAIT_state;
      M_out_d = 9'h003;
      M_done_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    M_out_q <= M_out_d;
    M_done_q <= M_done_d;
    M_reroll1_q <= M_reroll1_d;
    M_reroll2_q <= M_reroll2_d;
    M_state_q <= M_state_d;
  end
  
endmodule