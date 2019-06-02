module subtrator(
	input A,
	input B,
	input Bin,
	output S,
	output Bout
);
assign S = !A&&B&&!Bin || A&&!B&&!Bin || !A&&!B&&Bin || A&&B&&Bin;
assign Bout = !A&&B || !A&&Bout || B&&Bout;
endmodule