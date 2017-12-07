/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module buttonSelect_5 (
    input clk,
    input rst,
    input [3:0] btn,
    input taking_input,
    output reg [2:0] num
  );
  
  
  
  wire [1-1:0] M_button_conditioner1_out;
  reg [1-1:0] M_button_conditioner1_in;
  button_conditioner_13 button_conditioner1 (
    .clk(clk),
    .in(M_button_conditioner1_in),
    .out(M_button_conditioner1_out)
  );
  wire [1-1:0] M_button_conditioner2_out;
  reg [1-1:0] M_button_conditioner2_in;
  button_conditioner_13 button_conditioner2 (
    .clk(clk),
    .in(M_button_conditioner2_in),
    .out(M_button_conditioner2_out)
  );
  wire [1-1:0] M_button_conditioner3_out;
  reg [1-1:0] M_button_conditioner3_in;
  button_conditioner_13 button_conditioner3 (
    .clk(clk),
    .in(M_button_conditioner3_in),
    .out(M_button_conditioner3_out)
  );
  wire [1-1:0] M_button_conditioner4_out;
  reg [1-1:0] M_button_conditioner4_in;
  button_conditioner_13 button_conditioner4 (
    .clk(clk),
    .in(M_button_conditioner4_in),
    .out(M_button_conditioner4_out)
  );
  wire [1-1:0] M_edge_detector1_out;
  reg [1-1:0] M_edge_detector1_in;
  edge_detector_3 edge_detector1 (
    .clk(clk),
    .in(M_edge_detector1_in),
    .out(M_edge_detector1_out)
  );
  wire [1-1:0] M_edge_detector2_out;
  reg [1-1:0] M_edge_detector2_in;
  edge_detector_3 edge_detector2 (
    .clk(clk),
    .in(M_edge_detector2_in),
    .out(M_edge_detector2_out)
  );
  wire [1-1:0] M_edge_detector3_out;
  reg [1-1:0] M_edge_detector3_in;
  edge_detector_3 edge_detector3 (
    .clk(clk),
    .in(M_edge_detector3_in),
    .out(M_edge_detector3_out)
  );
  wire [1-1:0] M_edge_detector4_out;
  reg [1-1:0] M_edge_detector4_in;
  edge_detector_3 edge_detector4 (
    .clk(clk),
    .in(M_edge_detector4_in),
    .out(M_edge_detector4_out)
  );
  
  always @* begin
    M_button_conditioner1_in = btn[0+0-:1];
    M_button_conditioner2_in = btn[1+0-:1];
    M_button_conditioner3_in = btn[2+0-:1];
    M_button_conditioner4_in = btn[3+0-:1];
    M_edge_detector1_in = M_button_conditioner1_out;
    M_edge_detector2_in = M_button_conditioner2_out;
    M_edge_detector3_in = M_button_conditioner3_out;
    M_edge_detector4_in = M_button_conditioner4_out;
    
    case (taking_input)
      1'h1: begin
        if (btn[0+0-:1] == 1'h1) begin
          num = 1'h1;
        end else begin
          if (btn[1+0-:1] == 1'h1) begin
            num = 2'h2;
          end else begin
            if (btn[2+0-:1] == 1'h1) begin
              num = 2'h3;
            end else begin
              if (btn[3+0-:1] == 1'h1) begin
                num = 3'h4;
              end else begin
                num = 1'h0;
              end
            end
          end
        end
      end
    endcase
  end
endmodule
