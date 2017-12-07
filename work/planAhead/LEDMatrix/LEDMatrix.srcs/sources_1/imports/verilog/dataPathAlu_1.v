/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module dataPathAlu_1 (
    input clk,
    input rst,
    input slowclk,
    output reg [7:0] led1x,
    output reg [7:0] led1y,
    output reg [7:0] led2x,
    output reg [7:0] led2y,
    output reg [7:0] led3x,
    output reg [7:0] led3y,
    output reg [7:0] led4x,
    output reg [7:0] led4y,
    input [3:0] button,
    output reg player1_punch,
    output reg player2_punch,
    input generateRandom,
    output reg out,
    output reg [9:0] heath_points
  );
  
  
  
  localparam START_state = 4'd0;
  localparam PRNG1_state = 4'd1;
  localparam PRNG2_state = 4'd2;
  localparam CALCANSWER_state = 4'd3;
  localparam RESULT_state = 4'd4;
  localparam DISPLAY_state = 4'd5;
  localparam EVALUATE_state = 4'd6;
  localparam MODULUS_state = 4'd7;
  localparam HEALTHBAR_state = 4'd8;
  localparam IDLE_state = 4'd9;
  localparam FIX_POINTS_state = 4'd10;
  localparam END_state = 4'd11;
  localparam WAITFORANS_state = 4'd12;
  
  reg [3:0] M_state_d, M_state_q = START_state;
  reg M_expected_d, M_expected_q = 1'h0;
  reg [3:0] M_num1_d, M_num1_q = 1'h0;
  reg [3:0] M_num2_d, M_num2_q = 1'h0;
  reg [1:0] M_operator_d, M_operator_q = 1'h0;
  reg [6:0] M_result_d, M_result_q = 1'h0;
  reg [0:0] M_counter1_d, M_counter1_q = 1'h0;
  reg [3:0] M_firstdigit_d, M_firstdigit_q = 1'h0;
  reg [3:0] M_seconddigit_d, M_seconddigit_q = 1'h0;
  reg [0:0] M_right_d, M_right_q = 1'h0;
  reg [9:0] M_health_val_d, M_health_val_q = 1'h0;
  reg [2:0] M_winner_d, M_winner_q = 1'h0;
  reg M_answer_d, M_answer_q = 1'h0;
  reg [29:0] M_show_win_d, M_show_win_q = 1'h0;
  wire [3-1:0] M_buttonSelect_num;
  reg [4-1:0] M_buttonSelect_btn;
  reg [1-1:0] M_buttonSelect_taking_input;
  buttonSelect_5 buttonSelect (
    .clk(clk),
    .rst(rst),
    .btn(M_buttonSelect_btn),
    .taking_input(M_buttonSelect_taking_input),
    .num(M_buttonSelect_num)
  );
  wire [6-1:0] M_convert_alufn;
  reg [2-1:0] M_convert_oper;
  convertALUFN_6 convert (
    .clk(clk),
    .rst(rst),
    .oper(M_convert_oper),
    .alufn(M_convert_alufn)
  );
  wire [8-1:0] M_m1_led1x;
  wire [8-1:0] M_m1_led1y;
  wire [8-1:0] M_m1_led2x;
  wire [8-1:0] M_m1_led2y;
  wire [8-1:0] M_m1_led3x;
  wire [8-1:0] M_m1_led3y;
  wire [8-1:0] M_m1_led4x;
  wire [8-1:0] M_m1_led4y;
  reg [5-1:0] M_m1_digit1;
  reg [5-1:0] M_m1_digit2;
  reg [5-1:0] M_m1_digit3;
  reg [5-1:0] M_m1_digit4;
  reg [5-1:0] M_m1_digit5;
  reg [5-1:0] M_m1_digit6;
  displayModule_7 m1 (
    .clk(clk),
    .rst(rst),
    .digit1(M_m1_digit1),
    .digit2(M_m1_digit2),
    .digit3(M_m1_digit3),
    .digit4(M_m1_digit4),
    .digit5(M_m1_digit5),
    .digit6(M_m1_digit6),
    .led1x(M_m1_led1x),
    .led1y(M_m1_led1y),
    .led2x(M_m1_led2x),
    .led2y(M_m1_led2y),
    .led3x(M_m1_led3x),
    .led3y(M_m1_led3y),
    .led4x(M_m1_led4x),
    .led4y(M_m1_led4y)
  );
  
  wire [1-1:0] M_healthbar_gameoverout;
  wire [10-1:0] M_healthbar_out;
  wire [6-1:0] M_healthbar_alufn;
  wire [8-1:0] M_healthbar_alufna;
  wire [8-1:0] M_healthbar_alufnb;
  wire [1-1:0] M_healthbar_done;
  wire [1-1:0] M_healthbar_roundwinnerout;
  wire [1-1:0] M_healthbar_winnerout;
  reg [1-1:0] M_healthbar_ready;
  reg [3-1:0] M_healthbar_button;
  reg [1-1:0] M_healthbar_answer;
  reg [8-1:0] M_healthbar_alufnc;
  reg [1-1:0] M_healthbar_should_rst;
  healthbar_8 healthbar (
    .clk(clk),
    .rst(rst),
    .ready(M_healthbar_ready),
    .button(M_healthbar_button),
    .answer(M_healthbar_answer),
    .alufnc(M_healthbar_alufnc),
    .should_rst(M_healthbar_should_rst),
    .gameoverout(M_healthbar_gameoverout),
    .out(M_healthbar_out),
    .alufn(M_healthbar_alufn),
    .alufna(M_healthbar_alufna),
    .alufnb(M_healthbar_alufnb),
    .done(M_healthbar_done),
    .roundwinnerout(M_healthbar_roundwinnerout),
    .winnerout(M_healthbar_winnerout)
  );
  wire [9-1:0] M_prng_number;
  wire [6-1:0] M_prng_alufn;
  wire [8-1:0] M_prng_alufna;
  wire [8-1:0] M_prng_alufnb;
  wire [1-1:0] M_prng_prngdone;
  reg [1-1:0] M_prng_next;
  reg [8-1:0] M_prng_alufnc;
  prng_9 prng (
    .clk(clk),
    .rst(rst),
    .next(M_prng_next),
    .alufnc(M_prng_alufnc),
    .number(M_prng_number),
    .alufn(M_prng_alufn),
    .alufna(M_prng_alufna),
    .alufnb(M_prng_alufnb),
    .prngdone(M_prng_prngdone)
  );
  wire [2-1:0] M_operations_number;
  wire [1-1:0] M_operations_prngdone;
  reg [1-1:0] M_operations_next;
  prng2_10 operations (
    .clk(clk),
    .rst(rst),
    .next(M_operations_next),
    .number(M_operations_number),
    .prngdone(M_operations_prngdone)
  );
  wire [6-1:0] M_modulus_alufn;
  wire [8-1:0] M_modulus_alufna;
  wire [8-1:0] M_modulus_alufnb;
  wire [16-1:0] M_modulus_out;
  wire [1-1:0] M_modulus_done;
  reg [8-1:0] M_modulus_a;
  reg [8-1:0] M_modulus_alufnc;
  reg [1-1:0] M_modulus_start_mod;
  modulus_11 modulus (
    .clk(clk),
    .rst(rst),
    .a(M_modulus_a),
    .alufnc(M_modulus_alufnc),
    .start_mod(M_modulus_start_mod),
    .alufn(M_modulus_alufn),
    .alufna(M_modulus_alufna),
    .alufnb(M_modulus_alufnb),
    .out(M_modulus_out),
    .done(M_modulus_done)
  );
  reg [26:0] M_counterx_d, M_counterx_q = 1'h0;
  reg M_done_d, M_done_q = 1'h0;
  
  wire [8-1:0] M_alu_out;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_12 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_health_val_d = M_health_val_q;
    M_result_d = M_result_q;
    M_counterx_d = M_counterx_q;
    M_answer_d = M_answer_q;
    M_winner_d = M_winner_q;
    M_counter1_d = M_counter1_q;
    M_operator_d = M_operator_q;
    M_show_win_d = M_show_win_q;
    M_seconddigit_d = M_seconddigit_q;
    M_expected_d = M_expected_q;
    M_firstdigit_d = M_firstdigit_q;
    M_num2_d = M_num2_q;
    M_right_d = M_right_q;
    M_num1_d = M_num1_q;
    
    M_counterx_d = M_counterx_q + 1'h1;
    M_expected_d = M_expected_q + 1'h1;
    M_m1_digit1 = M_num1_q;
    M_m1_digit2 = M_operator_q + 4'ha;
    M_m1_digit3 = M_num2_q;
    M_m1_digit4 = 4'he;
    M_m1_digit5 = M_firstdigit_q;
    M_m1_digit6 = M_seconddigit_q;
    heath_points = M_health_val_q;
    led1x = M_m1_led1x;
    led1y = M_m1_led1y;
    led2x = M_m1_led2x;
    led2y = M_m1_led2y;
    led3x = M_m1_led3x;
    led3y = M_m1_led3y;
    led4x = M_m1_led4x;
    led4y = M_m1_led4y;
    out = 1'h0;
    M_healthbar_ready = 1'h0;
    M_healthbar_alufnc = 1'h0;
    M_healthbar_button = M_winner_q;
    M_healthbar_answer = 1'h0;
    M_healthbar_should_rst = 1'h0;
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 1'h0;
    M_prng_alufnc = 1'h0;
    M_prng_next = 1'h0;
    M_operations_next = 1'h0;
    M_buttonSelect_taking_input = 1'h0;
    M_buttonSelect_btn = 1'h0;
    M_convert_oper = 1'h0;
    M_modulus_start_mod = 1'h0;
    M_modulus_alufnc = 1'h0;
    M_modulus_a = 1'h0;
    
    case (M_state_q)
      START_state: begin
        M_m1_digit1 = 4'hf;
        M_m1_digit2 = 5'h10;
        M_m1_digit3 = 5'h11;
        M_m1_digit4 = 5'h12;
        M_m1_digit5 = 5'h13;
        M_m1_digit6 = 5'h14;
        if (button[0+0-:1] | button[1+0-:1] | button[2+0-:1] | button[3+0-:1]) begin
          M_health_val_d = 10'h3ff;
          M_state_d = IDLE_state;
        end
      end
      PRNG1_state: begin
        M_prng_alufnc = M_alu_out;
        M_prng_next = 1'h1;
        M_alu_alufn = M_prng_alufn;
        M_alu_a = M_prng_alufna;
        M_alu_b = M_prng_alufnb;
        if (M_prng_prngdone) begin
          M_prng_next = 1'h0;
          M_state_d = PRNG2_state;
          M_num1_d = M_prng_number[0+3-:4];
          M_num2_d = M_prng_number[5+3-:4];
        end
      end
      PRNG2_state: begin
        M_operations_next = 1'h1;
        if (M_operations_prngdone) begin
          M_state_d = CALCANSWER_state;
          M_operations_next = 1'h0;
          M_operator_d = M_operations_number[0+1-:2];
        end
      end
      CALCANSWER_state: begin
        M_convert_oper = M_operator_q;
        M_alu_alufn = M_convert_alufn;
        M_alu_a = M_num1_q;
        M_alu_b = M_num2_q;
        M_result_d = M_alu_out;
        M_state_d = RESULT_state;
      end
      RESULT_state: begin
        M_prng_alufnc = M_alu_out;
        M_prng_next = 1'h1;
        M_alu_alufn = M_prng_alufn;
        M_alu_a = M_prng_alufna;
        M_alu_b = M_prng_alufnb;
        if (M_prng_prngdone) begin
          if (M_prng_number[0+0-:1] == 1'h1) begin
            M_prng_next = 1'h0;
            M_result_d = M_result_q + M_prng_number[1+2-:3] + 1'h1;
            M_answer_d = 1'h0;
            M_state_d = MODULUS_state;
          end else begin
            M_answer_d = 1'h1;
            M_state_d = MODULUS_state;
          end
        end
      end
      MODULUS_state: begin
        M_modulus_start_mod = 1'h1;
        M_alu_alufn = M_modulus_alufn;
        M_alu_a = M_modulus_alufna;
        M_alu_b = M_modulus_alufnb;
        M_modulus_alufnc = M_alu_out;
        M_modulus_a = M_result_q;
        if (M_modulus_done) begin
          M_firstdigit_d = M_modulus_out[0+0+3-:4];
          M_seconddigit_d = M_modulus_out[8+0+3-:4];
          M_state_d = EVALUATE_state;
        end
      end
      EVALUATE_state: begin
        M_buttonSelect_btn = button;
        M_buttonSelect_taking_input = 1'h1;
        M_winner_d = M_buttonSelect_num;
        if (M_winner_q != 1'h0) begin
          M_state_d = HEALTHBAR_state;
        end else begin
          M_state_d = EVALUATE_state;
        end
        M_healthbar_button = M_winner_q;
      end
      HEALTHBAR_state: begin
        M_healthbar_answer = M_answer_q;
        M_alu_alufn = M_healthbar_alufn;
        M_alu_a = M_healthbar_alufna;
        M_alu_b = M_healthbar_alufnb;
        M_healthbar_alufnc = M_alu_out;
        M_healthbar_ready = 1'h1;
        if (M_healthbar_done != 1'h0) begin
          M_health_val_d = M_healthbar_out;
          if (M_healthbar_roundwinnerout) begin
            player2_punch = 1'h1;
            player1_punch = 1'h0;
          end else begin
            player1_punch = 1'h1;
            player2_punch = 1'h0;
          end
          M_state_d = IDLE_state;
          M_winner_d = 1'h0;
        end
      end
      IDLE_state: begin
        if (M_healthbar_gameoverout) begin
          M_state_d = END_state;
        end else begin
          if (generateRandom && M_winner_q == 1'h0) begin
            M_state_d = PRNG1_state;
          end else begin
            M_state_d = IDLE_state;
          end
        end
      end
      END_state: begin
        M_m1_digit1 = 5'h15;
        M_m1_digit3 = 5'h16;
        M_m1_digit4 = 5'h17;
        M_m1_digit5 = 5'h18;
        M_m1_digit6 = 5'h19;
        if (M_healthbar_winnerout) begin
          M_m1_digit2 = 2'h2;
        end else begin
          M_m1_digit2 = 1'h1;
        end
        M_show_win_d = M_show_win_q + 1'h1;
        if (M_show_win_q[29+0-:1] == 1'h1) begin
          M_healthbar_should_rst = 1'h1;
          M_state_d = START_state;
          M_show_win_d = 1'h0;
          M_expected_d = 1'h0;
          M_num1_d = 1'h0;
          M_num2_d = 1'h0;
          M_operator_d = 1'h0;
          M_result_d = 1'h0;
          M_counter1_d = 1'h0;
          M_firstdigit_d = 1'h0;
          M_seconddigit_d = 1'h0;
          M_right_d = 1'h0;
          M_health_val_d = 1'h0;
          M_winner_d = 1'h0;
          M_answer_d = 1'h0;
          M_show_win_d = 1'h0;
        end
      end
      default: begin
        M_alu_alufn = 6'h00;
        M_alu_a = 8'h00;
        M_alu_b = 8'h00;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counterx_q <= 1'h0;
      M_done_q <= 1'h0;
    end else begin
      M_counterx_q <= M_counterx_d;
      M_done_q <= M_done_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_expected_q <= 1'h0;
      M_num1_q <= 1'h0;
      M_num2_q <= 1'h0;
      M_operator_q <= 1'h0;
      M_result_q <= 1'h0;
      M_counter1_q <= 1'h0;
      M_firstdigit_q <= 1'h0;
      M_seconddigit_q <= 1'h0;
      M_right_q <= 1'h0;
      M_health_val_q <= 1'h0;
      M_winner_q <= 1'h0;
      M_answer_q <= 1'h0;
      M_show_win_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_expected_q <= M_expected_d;
      M_num1_q <= M_num1_d;
      M_num2_q <= M_num2_d;
      M_operator_q <= M_operator_d;
      M_result_q <= M_result_d;
      M_counter1_q <= M_counter1_d;
      M_firstdigit_q <= M_firstdigit_d;
      M_seconddigit_q <= M_seconddigit_d;
      M_right_q <= M_right_d;
      M_health_val_q <= M_health_val_d;
      M_winner_q <= M_winner_d;
      M_answer_q <= M_answer_d;
      M_show_win_q <= M_show_win_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule