/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module healthbar_8 (
    input clk,
    input rst,
    input ready,
    input [2:0] button,
    input answer,
    input [7:0] alufnc,
    output reg gameoverout,
    output reg [9:0] out,
    output reg [5:0] alufn,
    output reg [7:0] alufna,
    output reg [7:0] alufnb,
    output reg done,
    output reg roundwinnerout,
    output reg winnerout,
    input should_rst
  );
  
  
  
  reg [4:0] M_a_d, M_a_q = 1'h0;
  reg [4:0] M_b_d, M_b_q = 1'h0;
  reg M_azero_d, M_azero_q = 1'h0;
  reg M_bzero_d, M_bzero_q = 1'h0;
  reg M_gameover_d, M_gameover_q = 1'h0;
  reg M_winner_d, M_winner_q = 1'h0;
  reg M_roundwinner_d, M_roundwinner_q = 1'h0;
  localparam WAIT_state = 3'd0;
  localparam A_state = 3'd1;
  localparam B_state = 3'd2;
  localparam C_state = 3'd3;
  localparam GAMEOVER_state = 3'd4;
  localparam SEND_state = 3'd5;
  localparam END_state = 3'd6;
  
  reg [2:0] M_state_d, M_state_q = WAIT_state;
  
  reg temp;
  
  always @* begin
    M_state_d = M_state_q;
    M_gameover_d = M_gameover_q;
    M_azero_d = M_azero_q;
    M_b_d = M_b_q;
    M_a_d = M_a_q;
    M_winner_d = M_winner_q;
    M_bzero_d = M_bzero_q;
    M_roundwinner_d = M_roundwinner_q;
    
    roundwinnerout = M_roundwinner_q;
    gameoverout = M_gameover_q;
    out[0+4-:5] = M_a_q;
    out[5+4-:5] = M_b_q;
    done = 1'h0;
    alufn = 1'h0;
    alufna = 1'h0;
    alufnb = 1'h0;
    winnerout = M_winner_q;
    
    case (M_state_q)
      A_state: begin
        alufn = 6'h33;
        alufna = M_a_q;
        alufnb = 8'h00;
        M_azero_d = alufnc[0+0-:1];
        M_state_d = B_state;
      end
      B_state: begin
        alufn = 6'h33;
        alufna = M_b_q;
        alufnb = 8'h00;
        M_bzero_d = alufnc[0+0-:1];
        M_state_d = GAMEOVER_state;
      end
      GAMEOVER_state: begin
        if (M_bzero_q) begin
          M_gameover_d = 1'h1;
          M_winner_d = 1'h0;
          M_state_d = END_state;
        end else begin
          if (M_azero_q) begin
            M_gameover_d = 1'h1;
            M_winner_d = 1'h1;
            M_state_d = END_state;
          end else begin
            M_state_d = SEND_state;
          end
        end
      end
      C_state: begin
        M_gameover_d = 1'h0;
        if (answer) begin
          if (button == 1'h1 | button == 3'h4) begin
            alufn = 6'h20;
            alufna = M_b_q;
            alufnb = 1'h1;
            M_b_d = alufnc[0+4-:5];
            M_roundwinner_d = 1'h0;
          end else begin
            if (button == 2'h2 | button == 2'h3) begin
              alufn = 6'h20;
              alufna = M_a_q;
              alufnb = 1'h1;
              M_a_d = alufnc[0+4-:5];
              M_roundwinner_d = 1'h1;
            end
          end
        end else begin
          if (button == 2'h2 | button == 2'h3) begin
            alufn = 6'h20;
            alufna = M_b_q;
            alufnb = 1'h1;
            M_b_d = alufnc[0+4-:5];
            M_roundwinner_d = 1'h0;
          end else begin
            if (button == 1'h1 | button == 3'h4) begin
              alufn = 6'h20;
              alufna = M_a_q;
              alufnb = 1'h1;
              M_a_d = alufnc[0+4-:5];
              M_roundwinner_d = 1'h1;
            end
          end
        end
        M_state_d = A_state;
      end
      WAIT_state: begin
        M_gameover_d = 1'h0;
        if (ready == 1'h1) begin
          M_state_d = C_state;
          done = 1'h0;
        end else begin
          M_state_d = WAIT_state;
        end
      end
      SEND_state: begin
        done = 1'h1;
        M_state_d = WAIT_state;
      end
      END_state: begin
        done = 1'h1;
      end
    endcase
    if (rst | should_rst) begin
      M_a_d = 5'h1f;
      M_b_d = 5'h1f;
      alufn = 6'h00;
      alufna = 8'h00;
      alufnb = 8'h00;
      temp = 1'h0;
      done = 1'h0;
      M_gameover_d = 1'h0;
      M_winner_d = 1'h0;
      M_state_d = WAIT_state;
      M_azero_d = 1'h1;
      M_bzero_d = 1'h0;
      M_gameover_d = 1'h0;
      M_winner_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    M_a_q <= M_a_d;
    M_b_q <= M_b_d;
    M_azero_q <= M_azero_d;
    M_bzero_q <= M_bzero_d;
    M_gameover_q <= M_gameover_d;
    M_winner_q <= M_winner_d;
    M_roundwinner_q <= M_roundwinner_d;
    
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
