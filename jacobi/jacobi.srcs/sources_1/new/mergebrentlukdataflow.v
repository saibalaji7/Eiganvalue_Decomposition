`timescale 1ns / 1ps

module diagmerge_unit(
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

sinx_cosx  cordic1(ina,inb,angledia,a11,a12,z1);
sinx_cosx  cordic2(inc,ind,angledia,a21,a22,z2);

sinx_cosx  cordic3(a11,a21,angledia,b11,b21,z3);
sinx_cosx  cordic4(a12,a22,angledia,b12,b22,z4);

register reg11(b11,douta,LD,clk,clr);       register reg52(b12,doutb,LD,clk,clr);

register reg31(b21,doutc,LD,clk,clr);       register reg22(b22,doutd,LD,clk,clr);
endmodule

module nondiagmerge_unit(
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
 