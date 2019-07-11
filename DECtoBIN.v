module DECtoBIN(
	input [3:0] entrada,
	output [7:0] saida
);

logic [7:0] BINS, BIN0, BIN1, BIN2;

always @ (entrada[3])
	if (entrada[3] == 0) BINS = 8'b00000000;
	else if (entrada[3] == 1) BINS = 8'b10000000;

always @ (entrada[0])
	if (entrada[0] == 0) BIN0 = 8'b00000000;
	else if (entrada[0] == 1) BIN0 = 8'b00000001;
	else if (entrada[0] == 2) BIN0 = 8'b00000010;
	else if (entrada[0] == 3) BIN0 = 8'b00000011;
	else if (entrada[0] == 4) BIN0 = 8'b00000100;
	else if (entrada[0] == 5) BIN0 = 8'b00000101;
	else if (entrada[0] == 6) BIN0 = 8'b00000110;
	else if (entrada[0] == 7) BIN0 = 8'b00000111;
	else if (entrada[0] == 8) BIN0 = 8'b00001000;
	else if (entrada[0] == 9) BIN0 = 8'b00001001;

always @ (entrada[1])
	if (entrada[1] == 0) BIN1 = 8'b00000000;
	else if (entrada[1] == 1) BIN1 = 8'b00001010;
	else if (entrada[1] == 2) BIN1 = 8'b00010100;
	else if (entrada[1] == 3) BIN1 = 8'b00011110;
	else if (entrada[1] == 4) BIN1 = 8'b00101000;
	else if (entrada[1] == 5) BIN1 = 8'b00110010;
	else if (entrada[1] == 6) BIN1 = 8'b00111100;
	else if (entrada[1] == 7) BIN1 = 8'b01000110;
	else if (entrada[1] == 8) BIN1 = 8'b01010000;
	else if (entrada[1] == 9) BIN1 = 8'b01011010;

always @ (entrada[2])
	if (entrada[2] == 0) BIN2 = 8'b00000000;
	else if (entrada[2] == 1) BIN2 = 8'b01100100;
	
assign saida = (BINS + BIN0 + BIN1 + BIN2);

endmodule