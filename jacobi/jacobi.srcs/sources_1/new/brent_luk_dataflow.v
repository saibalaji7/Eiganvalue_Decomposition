`timescale 1ns / 1ps

module pairs_generating( 
input  [31:0] 
a11,a12,a13,a14,a15,a16,a17,a18,
a21,a22,a23,a24,a25,a26,a27,a28, 
a31,a32,a33,a34,a35,a36,a37,a38,
a41,a42,a43,a44,a45,a46,a47,a48,
a51,a52,a53,a54,a55,a56,a57,a58,
a61,a62,a63,a64,a65,a66,a67,a68,
a71,a72,a73,a74,a75,a76,a77,a78,
a81,a82,a83,a84,a85,a86,a87,a88,
input LD,input clk,input clr,input sel,
output  [31:0] 
k11,k12,k13,k14,k15,k16,k17,k18,
k21,k22,k23,k24,k25,k26,k27,k28, 
k31,k32,k33,k34,k35,k36,k37,k38,
k41,k42,k43,k44,k45,k46,k47,k48,
k51,k52,k53,k54,k55,k56,k57,k58,
k61,k62,k63,k64,k65,k66,k67,k68,
k71,k72,k73,k74,k75,k76,k77,k78,
k81,k82,k83,k84,k85,k86,k87,k88,
output  [31:0] 
c11,c12,c13,c14,c15,c16,c17,c18,
c21,c22,c23,c24,c25,c26,c27,c28, 
c31,c32,c33,c34,c35,c36,c37,c38,
c41,c42,c43,c44,c45,c46,c47,c48,
c51,c52,c53,c54,c55,c56,c57,c58,
c61,c62,c63,c64,c65,c66,c67,c68,
c71,c72,c73,c74,c75,c76,c77,c78,
c81,c82,c83,c84,c85,c86,c87,c88

);
wire  [31:0] 
b11,b12,b13,b14,b15,b16,b17,b18,
b21,b22,b23,b24,b25,b26,b27,b28, 
b31,b32,b33,b34,b35,b36,b37,b38,
b41,b42,b43,b44,b45,b46,b47,b48,
b51,b52,b53,b54,b55,b56,b57,b58,
b61,b62,b63,b64,b65,b66,b67,b68,
b71,b72,b73,b74,b75,b76,b77,b78,
b81,b82,b83,b84,b85,b86,b87,b88;

wire  [31:0] l1,l2,l3,l4,l5,l6,l7;
wire  [31:0] m1,m2,m3,m4,m5,m6,m7;
wire  [31:0] n1,n2,n3,n4,n5,n6,n7;
wire  [31:0] o1,o2,o3,o4,o5,o6,o7;
wire  [31:0] p1,p2,p3,p4,p5,p6,p7;
wire  [31:0] outa;
wire  [31:0] angle_11,angle_22,angle_33,angle_44;
wire  [31:0] w1,w2,w3,w4;



diag_unit p11(b11,b12,b21,b22,    outa,l1,w1,m1,LD,clk,clr,       angle_11);
_4mux21x8 mux11(outa,l7,l7,m7,a11,a12,a21,a22,sel,b11,b12,b21,b22);
assign {k11,k12,k21,k22} = {outa,l1,l1,m1};//assign w1=l1;
nondiag_unit p12(b13,b14,b23,b24,     l7,l2,n1,n2,LD,clk,clr,       angle_22,angle_11);
_4mux21x8 mux12(l6,l1,n7,n1,a13,a14,a23,a24,sel,b13,b14,b23,b24);
assign {k13,k14,k23,k24} = {l7,l2,n1,n2};
nondiag_unit p13(b15,b16,b25,b26,     l6,l3,o1,o3,LD,clk,clr,       angle_33,angle_11);
_4mux21x8 mux13(l5,l2,o7,o2,a15,a16,a25,a26,sel,b15,b16,b25,b26);
assign {k15,k16,k25,k26} = {l6,l3,o1,o3};
nondiag_unit p14(b17,b18,b27,b28,      l5,l4,p1,p4,LD,clk,clr,       angle_44,angle_11);
_4mux21x8 mux14(l4,l3,p7,p3,a17,a18,a27,a28,sel,b17,b18,b27,b28);
assign {k17,k18,k27,k28} = {l5,l4,p1,p4};


diag_unit p22(b33,b34,b43,b44,     m7,o2,w2,m2,LD,clk,clr,       angle_22);
_4mux21x8 mux22(m6,o1,o1,m1,a33,a34,a43,a44,sel,b33,b34,b43,b44);
assign {k33,k34,k43,k44} = {m7,o2,o2,m2};//assign w2=o2;
nondiag_unit p23(b35,b36,b45,b46,      n7,p3,p2,n3,LD,clk,clr,       angle_33,angle_22);
_4mux21x8 mux23(n6,p2,p1,n2,a35,a36,a45,a46,sel,b35,b36,b45,b46);
assign {k35,k36,k45,k46} = {n7,p3,p2,n3};
nondiag_unit p24(b37,b38,b47,b48,      o7,p7,p5,o4,LD,clk,clr,       angle_44,angle_22);
_4mux21x8 mux24(o6,p6,p4,o3,a37,a38,a47,a48,sel,b37,b38,b47,b48);
assign {k37,k38,k47,k48} = {o7,p7,p5,o4};


diag_unit p33(b55,b56,b65,b66,     m6,p6,w3,m3,LD,clk,clr,       angle_33);
_4mux21x8 mux33(m5,p5,p5,m2,a55,a56,a65,a66,sel,b55,b56,b65,b66);
assign {k55,k56,k65,k66} = {m6,p6,p6,m3};//assign w3=p6;
nondiag_unit p34(b57,b58,b67,b68,      n6,o6,o5,n4,LD,clk,clr,       angle_44,angle_33);
_4mux21x8 mux34(n5,o5,o4,n3,a57,a58,a67,a68,sel,b57,b58,b67,b68);
assign {k57,k58,k67,k68} = {n6,o6,o5,n4};


   diag_unit p44(b77,b78,b87,b88,      m5,n5,w4,m4,LD,clk,clr,       angle_44);
_4mux21x8 mux44(m4,n4,n4,m3,a77,a78,a87,a88,sel,b77,b78,b87,b88);
assign {k77,k78,k87,k88} = {m5,n5,n5,m4};//assign w4=n5;



assign {k31,k41,k32,k42} = {k13,k14,k23,k24};
assign {k51,k61,k52,k62} = {k15,k16,k25,k26};
assign {k71,k81,k72,k82} = {k17,k18,k27,k28};
assign {k53,k63,k54,k64} = {k35,k36,k45,k46};
assign {k73,k83,k74,k84} = {k37,k38,k47,k48};
assign {k75,k85,k76,k86} = {k57,k58,k67,k68};


//////////////eign vectors
wire [31:0] q11,q21,q31,q41,q51,q61,q71,q81,q12,q22,q32,q42,q52,q62,q72,q82;
wire [31:0] r11,r21,r31,r41,r51,r61,r71,r81,r12,r22,r32,r42,r52,r62,r72,r82;
wire [31:0] s11,s21,s31,s41,s51,s61,s71,s81,s12,s22,s32,s42,s52,s62,s72,s82;
wire [31:0] t11,t21,t31,t41,t51,t61,t71,t81,t12,t22,t32,t42,t52,t62,t72,t82;
wire [31:0] u11,u21,u31,u41,u51,u61,u71,u81,u12,u22,u32,u42,u52,u62,u72,u82;
wire [31:0] v11,v21,v31,v41,v51,v61,v71,v81,v12,v22,v32,v42,v52,v62,v72,v82;
wire [31:0] w11,w21,w31,w41,w51,w61,w71,w81,w12,w22,w32,w42,w52,w62,w72,w82;
wire [31:0] x11,x21,x31,x41,x51,x61,x71,x81,x12,x22,x32,x42,x52,x62,x72,x82;

///////1
eigan_vector_matrix vecmat1(
q11,q21,q31,q41,q51,q61,q71,q81,
r11,r21,r31,r41,r51,r61,r71,r81,
LD,clk,clr,angle_11,
x12,x22,x32,x42,x52,x62,x72,x82,
q12,q22,q32,q42,q52,q62,q72,q82
);
_16mux21x32 vecmux1(
x12,x22,x32,x42,x52,x62,x72,x82,
w12,w22,w32,w42,w52,w62,w72,w82,
32'h01000000,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
32'b0,32'h01000000,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
sel,
q11,q21,q31,q41,q51,q61,q71,q81,
r11,r21,r31,r41,r51,r61,r71,r81
);
///////2
eigan_vector_matrix vecmat2(
s11,s21,s31,s41,s51,s61,s71,s81,
t11,t21,t31,t41,t51,t61,t71,t81,
LD,clk,clr,angle_22,
w12,w22,w32,w42,w52,w62,w72,w82,
r12,r22,r32,r42,r52,r62,r72,r82
);
_16mux21x32 vecmux2(
v12,v22,v32,v42,v52,v62,v72,v82,
q12,q22,q32,q42,q52,q62,q72,q82,
32'b0,32'b0,32'h01000000,32'b0,32'b0,32'b0,32'b0,32'b0,
32'b0,32'b0,32'b0,32'h01000000,32'b0,32'b0,32'b0,32'b0,
sel,
s11,s21,s31,s41,s51,s61,s71,s81,
t11,t21,t31,t41,t51,t61,t71,t81
);
///////3
eigan_vector_matrix vecmat3(
u11,u21,u31,u41,u51,u61,u71,u81,
v11,v21,v31,v41,v51,v61,v71,v81,
LD,clk,clr,angle_33,
v12,v22,v32,v42,v52,v62,v72,v82,
s12,s22,s32,s42,s52,s62,s72,s82
);
_16mux21x32 vecmux3(
u12,u22,u32,u42,u52,u62,u72,u82,
r12,r22,r32,r42,r52,r62,r72,r82,
32'b0,32'b0,32'b0,32'b0,32'h01000000,32'b0,32'b0,32'b0,
32'b0,32'b0,32'b0,32'b0,32'b0,32'h01000000,32'b0,32'b0,
sel,
u11,u21,u31,u41,u51,u61,u71,u81,
v11,v21,v31,v41,v51,v61,v71,v81
);
//////4

eigan_vector_matrix vecmat4(
w11,w21,w31,w41,w51,w61,w71,w81,
x11,x21,x31,x41,x51,x61,x71,x81,
LD,clk,clr,angle_44,
u12,u22,u32,u42,u52,u62,u72,u82,
t12,t22,t32,t42,t52,t62,t72,t82
);
_16mux21x32 vecmux4(
t12,t22,t32,t42,t52,t62,t72,t82,
s12,s22,s32,s42,s52,s62,s72,s82,
32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'h01000000,32'b0,
32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'h01000000,
sel,
w11,w21,w31,w41,w51,w61,w71,w81,
x11,x21,x31,x41,x51,x61,x71,x81
);

assign{c11,c21,c31,c41,c51,c61,c71,c81}={x12,x22,x32,x42,x52,x62,x72,x82};
assign{c12,c22,c32,c42,c52,c62,c72,c82}={q12,q22,q32,q42,q52,q62,q72,q82};
assign{c13,c23,c33,c43,c53,c63,c73,c83}={w12,w22,w32,w42,w52,w62,w72,w82};
assign{c14,c24,c34,c44,c54,c64,c74,c84}={r12,r22,r32,r42,r52,r62,r72,r82};
assign{c15,c25,c35,c45,c55,c65,c75,c85}={v12,v22,v32,v42,v52,v62,v72,v82};
assign{c16,c26,c36,c46,c56,c66,c76,c86}={s12,s22,s32,s42,s52,s62,s72,s82};
assign{c17,c27,c37,c47,c57,c67,c77,c87}={u12,u22,u32,u42,u52,u62,u72,u82};
assign{c18,c28,c38,c48,c58,c68,c78,c88}={t12,t22,t32,t42,t52,t62,t72,t82};

endmodule
