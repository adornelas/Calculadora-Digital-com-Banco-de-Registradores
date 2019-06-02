module subtrator(
	input A,
	input B,
	input Bin,
	output S,
	output Bout
);
assign S = A&&!B&&!Bin || !A&&B&&!Bin || !A&&!B&&Bin || A&&B&&Bin;
assign Bout = !A&&B || B&&Bin || !A&&Bin;
endmodule