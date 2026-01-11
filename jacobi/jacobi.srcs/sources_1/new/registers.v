`timescale 1ns / 1ps

module register(
input [31:0] in,output[31:0] out,
input LD,input clk,input clr);
reg [31:0] q;
assign out=q;
always @(posedge clk) begin
    if(clr)
        q<=32'h00000000;
    else if(LD)
        q<=in;
    end
endmodule
  

 
module diag_unit(
input [31:0] ina,input [31:0] inb,input [31:0] inc, input [31:0] ind,
output [31:0] douta,output [31:0] doutb,output [31:0] doutc,output [31:0] doutd,
input LD,input clk,input clr,output wire [31:0] angledia
);

wire [31:0] a11,a12,a21,a22,b11,b12,b21,b22;
wire [31:0] k1,k2,k3,k4;
wire [31:0] angle,z1,z2,z3,z4;
addsub  sub1(ind,ina,1'b1,k2);
assign k1={inb[31],inb[29:0],1'b0};
vector_sinx_cosx  cordic0(k2,k1,32'b0,k3,k4,angle);
assign angledia={angle[31],angle[31:1]};
//always @(*)
//begin
//angledia=angle>>>1;
//end
sinx_cosx  cordic1(ina,inb,angledia,a11,a12,z1);
sinx_cosx  cordic2(inc,ind,angledia,a21,a22,z2);

sinx_cosx  cordic3(a11,a21,angledia,b11,b21,z3);
sinx_cosx  cordic4(a12,a22,angledia,b12,b22,z4);

register reg11(b11,douta,LD,clk,clr);       register reg52(b12,doutb,LD,clk,clr);

register reg31(b21,doutc,LD,clk,clr);       register reg22(b22,doutd,LD,clk,clr);
endmodule

module nondiag_unit(
input [31:0] ina,input [31:0] inb,input [31:0] inc, input [31:0] ind,
output [31:0] ndouta,output [31:0] ndoutb,output [31:0] ndoutc,output [31:0] ndoutd,
input LD,input clk,input clr,input [31:0] angle1,input [31:0] angle2
);

wire [31:0] a11,a12,a21,a22,b11,b12,b21,b22;
wire [31:0] z1,z2,z3,z4;

sinx_cosx  cordic1(ina,inb,angle1,a11,a12,z1);
sinx_cosx  cordic2(inc,ind,angle1,a21,a22,z2);

sinx_cosx  cordic3(a11,a21,angle2,b11,b21,z3);
sinx_cosx  cordic4(a12,a22,angle2,b12,b22,z4);

register reg11(b11,ndouta,LD,clk,clr);       register reg62(b12,ndoutb,LD,clk,clr);

register reg71(b21,ndoutc,LD,clk,clr);       register reg22(b22,ndoutd,LD,clk,clr);
endmodule
 
 
module eigan_vector_matrix(
input [31:0] a11,a21,a31,a41,a51,a61,a71,a81,
input [31:0] a12,a22,a32,a42,a52,a62,a72,a82,
input LD,input clk,input clr,input [31:0] angle,
output [31:0] c11,c21,c31,c41,c51,c61,c71,c81,
output [31:0] c12,c22,c32,c42,c52,c62,c72,c82
);

wire [31:0] b11,b21,b31,b41,b51,b61,b71,b81;
wire [31:0] b12,b22,b32,b42,b52,b62,b72,b82;
wire [31:0] z1,z2,z3,z4,z5,z6,z7,z8;

sinx_cosx  cordic1(a11,a12,angle,b11,b12,z1);
sinx_cosx  cordic2(a21,a22,angle,b21,b22,z2);
sinx_cosx  cordic3(a31,a32,angle,b31,b32,z3);
sinx_cosx  cordic4(a41,a42,angle,b41,b42,z4);
sinx_cosx  cordic5(a51,a52,angle,b51,b52,z5);
sinx_cosx  cordic6(a61,a62,angle,b61,b62,z6);
sinx_cosx  cordic7(a71,a72,angle,b71,b72,z7);
sinx_cosx  cordic8(a81,a82,angle,b81,b82,z8);

register reg11(b11,c11,LD,clk,clr);       register reg110(b12,c12,LD,clk,clr);

register reg91(b21,c21,LD,clk,clr);       register reg22(b22,c22,LD,clk,clr);

register reg31(b31,c31,LD,clk,clr);       register reg32(b32,c32,LD,clk,clr);

register reg41(b41,c41,LD,clk,clr);       register reg42(b42,c42,LD,clk,clr);

register reg51(b51,c51,LD,clk,clr);       register reg52(b52,c52,LD,clk,clr);

register reg61(b61,c61,LD,clk,clr);       register reg62(b62,c62,LD,clk,clr);

register reg71(b71,c71,LD,clk,clr);       register reg72(b72,c72,LD,clk,clr);

register reg81(b81,c81,LD,clk,clr);       register reg82(b82,c82,LD,clk,clr);
endmodule
 