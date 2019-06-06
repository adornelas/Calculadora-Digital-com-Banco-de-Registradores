module somador(
	input A,
	input B,
	input Cin,
	output S,
	output Cout
);
assign S = !A&&!B&&Cin || !A&&B&&!Cin || A&&!B&&!Cin || A&&B&&Cin;
assign Cout = A&&Cin || B&&Cin || A&&B;
endmodule
