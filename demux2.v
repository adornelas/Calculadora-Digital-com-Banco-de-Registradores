module demux2(
	input dado,
	input escolha,
	output saida0,
	output saida1
);

assign saida0 = escolha==4'd0 ? dado : 1'b0;
assign saida1 = escolha==4'd1 ? dado : 1'b0;
endmodule