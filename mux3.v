module mux3(
	input [3:0] entrada,
	input[1:0] escolha,
	output saida
);

assign saida = entrada[escolha];
endmodule
