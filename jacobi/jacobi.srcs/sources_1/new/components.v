
`timescale 1ns / 1ps

module muxcordic(
input [31:0] x,input [31:0] y ,
input sel ,  output reg[31:0] z );

always @(*)
begin
if(sel)z=y;
else z=x;
end
endmodule

module addsub(
input [31:0] x,input [31:0] y ,
input sel ,  output reg [31:0] z );
// assign z= sel ? x-y:x+y;
always @(*)
begin
if(sel)z=x-y;
else z=x+y;
end
endmodule


module _4mux21x8(
input [31:0] a,input [31:0] b,
input [31:0] c,input [31:0] d,
input [31:0] a11,input [31:0] a12,
input [31:0] a21,input [31:0] a22,
input sel,
output [31:0] A,output [31:0] B,output [31:0] C,output [31:0] D);
assign A=sel?a11:a;
assign B=sel?a12:b;
assign C=sel?a21:c;
assign D=sel?a22:d;
endmodule


/////0.9B74EEBF65DBFCE==0.607253
module scalebyk(input signed[31:0] in,output signed[31:0] out);


    localparam  signed[31:0] FACTOR = 32'h00009B74;  

    reg  [63:0] temp;
    assign out={temp[47:16]};
    always @(*) begin
        temp = in * FACTOR;   
    end

endmodule

module _16mux21x32(
input [31:0] a11,a21,a31,a41,a51,a61,a71,a81,
input [31:0] a12,a22,a32,a42,a52,a62,a72,a82,
input [31:0] b11,b21,b31,b41,b51,b61,b71,b81,
input [31:0] b12,b22,b32,b42,b52,b62,b72,b82,
input sel,
output [31:0] c11,c21,c31,c41,c51,c61,c71,c81,
output [31:0] c12,c22,c32,c42,c52,c62,c72,c82
);
assign c11=sel?b11:a11;
assign c21=sel?b21:a21;
assign c31=sel?b31:a31;
assign c41=sel?b41:a41;
assign c51=sel?b51:a51;
assign c61=sel?b61:a61;
assign c71=sel?b71:a71;
assign c81=sel?b81:a81;

assign c12=sel?b12:a12;
assign c22=sel?b22:a22;
assign c32=sel?b32:a32;
assign c42=sel?b42:a42;
assign c52=sel?b52:a52;
assign c62=sel?b62:a62;
assign c72=sel?b72:a72;
assign c82=sel?b82:a82;


endmodule

