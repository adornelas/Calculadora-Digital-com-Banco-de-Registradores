module somador_subtrator (
	input MODO,
	input [7:0] A, B,
	output [7:0] S,
	output OVERFLOW
);

assign wire Cout;

assign (Cout,S) =  MODO ? (A-B) : (A+B);
assign OVERFLOW = S[7]^Cout;
endmodule