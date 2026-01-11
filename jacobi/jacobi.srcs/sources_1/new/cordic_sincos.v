`timescale 1ns / 1ps


//sinx_cosx(xin,yin,zin,x,y,z);
module sinx_cosx(
input  [31:0] xin,input[31:0] yin,input  [31:0] zin,
output[31:0] x,output[31:0] y,output[31:0] z
);
wire [31:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16;
wire [31:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16;
wire [31:0] z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16;
wire nzin,nz0,nz1,nz2,nz3,nz4,nz5,nz6,nz7,nz8,nz9,nz10,nz11,nz12,nz13,nz14,nz15;
wire [31:0] xink,yink;
scalebyk s1(xin,xink);
scalebyk s2(yin,yink);

not g0(nzin,zin[31]);
addsub xadd0(xink,yink,nzin,x0);
addsub yadd0(yink,xink,zin[31],y0);
addsub zadd0(zin,32'h02D00000,nzin,z0);//tan-(1)32'h02D000


not g1(nz0,z0[31]);
addsub xadd1(x0,{y0[31],y0[31:1]},nz0,x1);
addsub yadd1(y0,{x0[31],x0[31:1]},z0[31],y1);
addsub zadd1(z0,32'h01A90A73,nz0,z1);//tan-(1/2)40'h01A90A731A


not g2(nz1,z1[31]);
addsub xadd2(x1,{{2{y1[31]}},y1[31:2]},nz1,x2);
addsub yadd2(y1,{{2{x1[31]}},x1[31:2]},z1[31],y2);
addsub zadd2(z1,32'h00E09474,nz1,z2);//tan-(1/4)40'h00E0947407

not g3(nz2,z2[31]);
addsub xadd3(x2,{{3{y2[31]}},y2[31:3]},nz2,x3);
addsub yadd3(y2,{{3{x2[31]}},x2[31:3]},z2[31],y3);
addsub zadd3(z2,32'h00720011,nz2,z3);//tan-(1/8)40'h0072001124

not g4(nz3,z3[31]);
addsub xadd4(x3,{{4{y3[31]}},y3[31:4]},nz3,x4);
addsub yadd4(y3,{{4{x3[31]}},x3[31:4]},z3[31],y4);
addsub zadd4(z3,32'h003938AB,nz3,z4);//tan-(1/16)40'h003938AB0B

not g5(nz4,z4[31]);
addsub xadd5(x4,{{5{y4[31]}},y4[31:5]},nz4,x5);
addsub yadd5(y4,{{5{x4[31]}},x4[31:5]},z4[31],y5);
addsub zadd5(z4,32'h001CA379,nz4,z5);//tan-(1/32)40'h001CA3794E


not g6(nz5,z5[31]);
addsub xadd6(x5,{{6{y5[31]}},y5[31:6]},nz5,x6);
addsub yadd6(y5,{{6{x5[31]}},x5[31:6]},z5[31],y6);
addsub zadd6(z5,32'h000E52A1,nz5,z6);//tan-(1/64)40'h000E52A1AB


not g7(nz6,z6[31]);
addsub xadd7(x6,{{7{y6[31]}},y6[31:7]},nz6,x7);
addsub yadd7(y6,{{7{x6[31]}},x6[31:7]},z6[31],y7);
addsub zadd7(z6,32'h0007296D,nz6,z7);//tan-(1/128)40'h0007296D7C


not g8(nz7,z7[31]);
addsub xadd8(x7,{{8{y7[31]}},y7[31:8]},nz7,x8);
addsub yadd8(y7,{{8{x7[31]}},x7[31:8]},z7[31],y8);
addsub zadd8(z7,32'h000394BF,nz7,z8);//tan-(1/256)40'h000394BF17

not g9(nz8,z8[31]);
addsub xadd9(x8,{{9{y8[31]}},y8[31:9]},nz8,x9);
addsub yadd9(y8,{{9{x8[31]}},x8[31:9]},z8[31],y9);
addsub zadd9(z8,32'h0001CA5D,nz8,z9);//tan-(1/512)==0.1CA5D9B73C6


not g10(nz9,z9[31]);
addsub xadd10(x9,{{10{y9[31]}},y9[31:10]},nz9,x10);
addsub yadd10(y9,{{10{x9[31]}},x9[31:10]},z9[31],y10);
addsub zadd10(z9,32'h0000E52E,nz9,z10);//tan-(1/1024)=0.0E52EDC0CCE
////
not g11(nz10,z10[31]);
addsub xadd11(x10,{{11{y10[31]}},y10[31:11]},nz10,x11);
addsub yadd11(y10,{{11{x10[31]}},x10[31:11]},z10[31],y11);
addsub zadd11(z10,32'h00007297,nz10,z11);//tan-(1/2048)=0.072976FD0C50D89

not g12(nz11,z11[31]);
addsub xadd12(x11,{{12{y11[31]}},y11[31:12]},nz11,x12);
addsub yadd12(y11,{{12{x11[31]}},x11[31:12]},z11[31],y12);
addsub zadd12(z11,32'h0000394B,nz11,z12);//tan-(1/4096)=0.0394BB821AD

not g13(nz12,z12[31]);
addsub xadd13(x12,{{13{y12[31]}},y12[31:13]},nz12,x13);
addsub yadd13(y12,{{13{x12[31]}},x12[31:13]},z12[31],y13);
addsub zadd13(z12,32'h00001CA5,nz12,z13);//tan-(1/8192)=0.01CA5DBD34235435

not g14(nz13,z13[31]);
addsub xadd14(x13,{{14{y13[31]}},y13[31:14]},nz13,x14);
addsub yadd14(y13,{{14{x13[31]}},x13[31:14]},z13[31],y14);
addsub zadd14(z13,32'h00000E52,nz13,z14);//tan-(1/2*8192)=0.00E52EE0CE569F5D3

not g15(nz14,z14[31]);
addsub xadd15(x14,{{15{y14[31]}},y14[31:15]},nz14,x15);
addsub yadd15(y14,{{15{x14[31]}},x14[31:15]},z14[31],y15);
addsub zadd15(z14,32'h00000729,nz14,z15);//tan-(1/4*8192)=0.0072977068DF98F

not g16(nz15,z15[31]);
addsub xadd16(x15,{{16{y15[31]}},y15[31:16]},nz15,x16);
addsub yadd16(y15,{{16{x15[31]}},x15[31:16]},z15[31],y16);
addsub zadd16(z15,32'h00000394,nz15,z16);//tan-(1/8*8192)=0.00394BB830A4B5

assign x=x16;
assign y=y16;
assign z=z16;


endmodule
////////////////////////////////////////////////vector mode//////////////////////////////////////////
module vector_sinx_cosx(
input  [31:0] xin,input[31:0] yin,input  [31:0] zin,
output[31:0] x,output[31:0] y,output [31:0] zout
);
wire [31:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16;
wire [31:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16;
wire [31:0] z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16;
wire nz0,nz1,nz2,nz3,nz4,nz5,nz6,nz7,nz8,nz9,nz10,nz11,nz12,nz13,nz14,nz15;

xor agin(andin,xin[31],yin[31]);
not nagin(nandin,andin);
addsub xadd0(xin,yin,andin,x0);
addsub yadd0(yin,xin,nandin,y0);
addsub zadd0(zin,32'h02D00000,andin,z0);//tan-(1)

xor ag0(and0,x0[31],y0[31]);
not nag0(nand0,and0);
not g1(nz0,z0[31]);
addsub xadd1(x0,{y0[31],y0[31:1]},and0,x1);
addsub yadd1(y0,{x0[31],x0[31:1]},nand0,y1);
addsub zadd1(z0,32'h01A90A73,and0,z1);//tan-(1/2)

xor ag1(and1,x1[31],y1[31]);
not nag1(nand1,and1);
not g2(nz1,z1[31]);
addsub xadd2(x1,{{2{y1[31]}},y1[31:2]},and1,x2);
addsub yadd2(y1,{{2{x1[31]}},x1[31:2]},nand1,y2);
addsub zadd2(z1,32'h00E09474,and1,z2);//tan-(1/4)

xor ag2(and2,x2[31],y2[31]);
not nag2(nand2,and2);
not g3(nz2,z2[31]);
addsub xadd3(x2,{{3{y2[31]}},y2[31:3]},and2,x3);
addsub yadd3(y2,{{3{x2[31]}},x2[31:3]},nand2,y3);
addsub zadd3(z2,32'h00720011,and2,z3);//tan-(1/8)

xor ag3(and3,x3[31],y3[31]);
not nag3(nand3,and3);
not g4(nz3,z3[31]);
addsub xadd4(x3,{{4{y3[31]}},y3[31:4]},and3,x4);
addsub yadd4(y3,{{4{x3[31]}},x3[31:4]},nand3,y4);
addsub zadd4(z3,32'h003938AB,and3,z4);//tan-(1/16)


xor ag4(and4,x4[31],y4[31]);
not nag4(nand4,and4);
not g5(nz4,z4[31]);
addsub xadd5(x4,{{5{y4[31]}},y4[31:5]},and4,x5);
addsub yadd5(y4,{{5{x4[31]}},x4[31:5]},nand4,y5);
addsub zadd5(z4,32'h001CA379,and4,z5);//tan-(1/32)

xor ag5(and5,x5[31],y5[31]);
not nag5(nand5,and5);
not g6(nz5,z5[31]);
addsub xadd6(x5,{{6{y5[31]}},y5[31:6]},and5,x6);
addsub yadd6(y5,{{6{x5[31]}},x5[31:6]},nand5,y6);
addsub zadd6(z5,32'h000E52A1,and5,z6);//tan-(1/64)


xor ag6(and6,x6[31],y6[31]);
not nag6(nand6,and6);
not g7(nz6,z6[31]);
addsub xadd7(x6,{{7{y6[31]}},y6[31:7]},and6,x7);
addsub yadd7(y6,{{7{x6[31]}},x6[31:7]},nand6,y7);
addsub zadd7(z6,32'h0007296D,and6,z7);//tan-(1/128)

xor ag7(and7,x7[31],y7[31]);
not nag7(nand7,and7);
not g8(nz7,z7[31]);
addsub xadd8(x7,{{8{y7[31]}},y7[31:8]},and7,x8);
addsub yadd8(y7,{{8{x7[31]}},x7[31:8]},nand7,y8);
addsub zadd8(z7,32'h000394BF,and7,z8);//tan-(1/256)

///
xor ag8(and8,x8[31],y8[31]);
not nag8(nand8,and8);
not g9(nz8,z8[31]);
addsub xadd9(x8,{{9{y8[31]}},y8[31:9]},and8,x9);
addsub yadd9(y8,{{9{x8[31]}},x8[31:9]},nand8,y9);
addsub zadd9(z8,32'h0001CA5D,and8,z9);//tan-(1/512)==0.1CA5D9B73C6

xor ag9(and9,x9[31],y9[31]);
not nag9(nand9,and9);
not g10(nz9,z9[31]);
addsub xadd10(x9,{{10{y9[31]}},y9[31:10]},and9,x10);
addsub yadd10(y9,{{10{x9[31]}},x9[31:10]},nand9,y10);
addsub zadd10(z9,32'h0000E52E,and9,z10);//tan-(1/1024)=0.0E52EDC0CCE


xor ag10(and10,x10[31],y10[31]);
not nag10(nand10,and10);
not g11(nz10,z10[31]);
addsub xadd11(x10,{{11{y10[31]}},y10[31:11]},and10,x11);
addsub yadd11(y10,{{11{x10[31]}},x10[31:11]},nand10,y11);
addsub zadd11(z10,32'h00007297,and10,z11);//tan-(1/2048)=0.072976FD0C50D89

xor ag11(and11,x11[31],y11[31]);
not nag11(nand11,and11);
not g12(nz11,z11[31]);
addsub xadd12(x11,{{12{y11[31]}},y11[31:12]},and11,x12);
addsub yadd12(y11,{{12{x11[31]}},x11[31:12]},nand11,y12);
addsub zadd12(z11,32'h0000394B,and11,z12);//tan-(1/4096)=0.0394BB821AD
///////////////

xor ag12(and12,x12[31],y12[31]);
not nag12(nand12,and12);
not g13(nz12,z12[31]);
addsub xadd13(x12,{{13{y12[31]}},y12[31:13]},and12,x13);
addsub yadd13(y12,{{13{x12[31]}},x12[31:13]},nand12,y13);
addsub zadd13(z12,32'h00001CA5,and12,z13);//tan-(1/8192)=0.01CA5DBD34235435

xor ag13(and13,x13[31],y13[31]);
not nag13(nand13,and13);
not g14(nz13,z13[31]);
addsub xadd14(x13,{{14{y13[31]}},y13[31:14]},and13,x14);
addsub yadd14(y13,{{14{x13[31]}},x13[31:14]},nand113,y14);
addsub zadd14(z13,32'h00000E52,and13,z14);//tan-(1/2*8192)=0.00E52EE0CE569F5D3

xor ag14(and14,x14[31],y14[31]);
not nag14(nand14,and14);
not g15(nz14,z14[31]);
addsub xadd15(x14,{{15{y14[31]}},y14[31:15]},and14,x15);
addsub yadd15(y14,{{15{x14[31]}},x14[31:15]},nand14,y15);
addsub zadd15(z14,32'h00000729,and14,z15);//tan-(1/4*8192)=0.0072977068DF98F

xor ag15(and15,x15[31],y15[31]);
not nag15(nand15,and15);
not g16(nz15,z15[31]);
addsub xadd16(x15,{{16{y15[31]}},y15[31:16]},and15,x16);
addsub yadd16(y15,{{16{x15[31]}},x15[31:16]},nand15,y16);
addsub zadd16(z15,32'h00000394,and15,z16);//tan-(1/8*8192)=0.00394BB830A4B5




assign x=x16;
assign y=y16;
assign zout=z16;
endmodule
////////////////////////////////////////////////////////////////////////


