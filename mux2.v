module mux2(
	input entrada0,
	input entrada1,
	input escolha,
	output saida
);

assign saida = escolha==4'd0 ? entrada0 : entrada1;
endmodule
