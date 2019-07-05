module demuxer(sel,a,s1,s2);
input [6:0] a;
output [6:0] s1,s2;
input sel;

assign s1 = sel ? a : 1'b0;
assign s2 = !sel ? a : 1'b0;

endmodule