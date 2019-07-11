module maquina(
	input logic clk,
	input logic reset,
	input logic ready,
	input logic [7:0] tecla,
	output logic [7:0] saidaA, saidaB,
	output logic sinal,
	output logic igual
);

logic [7:0] resultado, store0, store1, store2, store3, store4, store5, store6, store7, store8, store9;

typedef enum logic [3:0] {ENTRADA_A, ESPERA_A, ENTRADA_B, ESPERA_B, ARMAZENA_A, ESPERA_ARMAZENA_A, ARMAZENA_B, ESPERA_ARMAZENA_B, MOSTRA_RESULTADO, ARMAZENA_RESULTADO, ESPERA_ARMAZENA_RESULTADO, RESGATA_A, ESPERA_RESGATA_A, RESGATA_B, ESPERA_RESGATA_B} statetype;
	statetype state, nextstate;
	
always_ff @(posedge clk, posedge reset)
		if (reset) state <= ENTRADA_A;
		else state <= nextstate;
		
always_ff @(posedge clk, posedge reset)
	if (reset) begin 
		saidaA = 8'b00000000;
		saidaB = 8'b00000000; 
		sinal = 1'b0;
		igual = 1'b0;
		store0 = 8'b00000000;
		store1 = 8'b00000000;
		store2 = 8'b00000000;
		store3 = 8'b00000000;
		store4 = 8'b00000000;
		store5 = 8'b00000000;
		store6 = 8'b00000000;
		store7 = 8'b00000000;
		store8 = 8'b00000000;
		store9 = 8'b00000000;
	end
	else
		case (state)
			ENTRADA_A: if (ready & (tecla<10 || tecla == 13)) begin
			saidaA = 0;
			saidaB = 0;
			igual = 0;
				if (tecla<10) begin
					saidaA = tecla;
					nextstate = ESPERA_A;
				end
				else if (tecla == 13) nextstate = RESGATA_A; 
				
			end
			else  nextstate = ENTRADA_A; 
			
			ESPERA_A: if (~ready & (tecla == 10 || tecla == 11)) begin
			igual = 0;
									sinal = tecla == 10 ? 0 : 1;
									nextstate = ENTRADA_B;
									end
						  else if (~ready & tecla == 12) begin
						      nextstate = ARMAZENA_A;
						  end
						  else nextstate = ESPERA_A;
						  
			ARMAZENA_A: if (ready & tecla<10) begin
				if (tecla == 0) store0 = saidaA;
				else if (tecla == 1) store1 = saidaA;
				else if (tecla == 2) store2 = saidaA;
				else if (tecla == 3) store3 = saidaA;
				else if (tecla == 4) store4 = saidaA;
				else if (tecla == 5) store5 = saidaA;
				else if (tecla == 6) store6 = saidaA;
				else if (tecla == 7) store7 = saidaA;
				else if (tecla == 8) store8 = saidaA;
				else if (tecla == 9) store9 = saidaA;
				nextstate = ESPERA_ARMAZENA_A;
			end
			else nextstate = ARMAZENA_A;
			
			ESPERA_ARMAZENA_A: if (~ready & (tecla == 10 || tecla == 11)) begin
									sinal = tecla == 10 ? 0 : 1;
									nextstate = ENTRADA_B;
									end
						  else nextstate = ESPERA_ARMAZENA_A; 
			
			ENTRADA_B: if (ready & (tecla<10 || tecla == 13)) begin
			igual = 0;
				if (tecla<10) begin
					saidaB = tecla;
					nextstate = ESPERA_B;
				end
				else if (tecla == 13) nextstate = RESGATA_B;
			end
			else  nextstate = ENTRADA_B;
			
			ESPERA_B: if (~ready & tecla == 14) begin 
											igual = 1;
											nextstate = MOSTRA_RESULTADO;
									end
									else nextstate = ESPERA_B;
									
			ARMAZENA_B: if (ready & tecla<10) begin
				igual = 0;
				if (tecla == 0) store0 = saidaB;
				else if (tecla == 1) store1 = saidaB;
				else if (tecla == 2) store2 = saidaB;
				else if (tecla == 3) store3 = saidaB;
				else if (tecla == 4) store4 = saidaB;
				else if (tecla == 5) store5 = saidaB;
				else if (tecla == 6) store6 = saidaB;
				else if (tecla == 7) store7 = saidaB;
				else if (tecla == 8) store8 = saidaB;
				else if (tecla == 9) store9 = saidaB;
				nextstate = ESPERA_ARMAZENA_B;
			end
			else nextstate = ARMAZENA_B; 
			
			ESPERA_ARMAZENA_B: if (~ready & tecla == 14) begin
									igual = 1;
									nextstate = MOSTRA_RESULTADO;
									end
						  else nextstate = ESPERA_ARMAZENA_B;
						  
			RESGATA_B: if (~ready & tecla<10) begin
						saidaB = 0;
						if (tecla == 0) saidaB = store0;
						else if (tecla == 1) saidaB = store1;
						else if (tecla == 2) saidaB = store2;
						else if (tecla == 3) saidaB = store3;
						else if (tecla == 4) saidaB = store4;
						else if (tecla == 5) saidaB = store5;
						else if (tecla == 6) saidaB = store6;
						else if (tecla == 7) saidaB = store7;
						else if (tecla == 8) saidaB = store8;
						else if (tecla == 9) saidaB = store9;
						nextstate = ESPERA_RESGATA_B;
						end
			else nextstate = RESGATA_B;
			
			ESPERA_RESGATA_B: if (~ready & tecla == 14) begin
									igual = 1;
									nextstate = MOSTRA_RESULTADO;
									end
						  else nextstate = ESPERA_RESGATA_B;
			
			MOSTRA_RESULTADO: if (tecla <10 || tecla == 12 || tecla == 13) begin
											if (tecla<10) begin
												saidaA = tecla;
												nextstate = ENTRADA_A;
											end	
											else if (tecla == 12) nextstate = ARMAZENA_RESULTADO;
											else if (tecla == 13) nextstate = RESGATA_A;
									end
									else nextstate = MOSTRA_RESULTADO;
			
			ARMAZENA_RESULTADO: if (ready & tecla<10) begin
				resultado = sinal == 0 ? (saidaA + saidaB) : (saidaA - saidaB); 
				if (tecla == 0) store0 = resultado;
				else if (tecla == 1) store1 = resultado;
				else if (tecla == 2) store2 = resultado;
				else if (tecla == 3) store3 = resultado;
				else if (tecla == 4) store4 = resultado;
				else if (tecla == 5) store5 = resultado;
				else if (tecla == 6) store6 = resultado;
				else if (tecla == 7) store7 = resultado;
				else if (tecla == 8) store8 = resultado;
				else if (tecla == 9) store9 = resultado;
				nextstate = ESPERA_ARMAZENA_RESULTADO;
			end
			else nextstate = ARMAZENA_RESULTADO; 
			
			ESPERA_ARMAZENA_RESULTADO: if (~ready & (tecla<10 || tecla == 13)) begin
										if (tecla<10) nextstate = ENTRADA_A;
										if (tecla == 13) nextstate = RESGATA_A;
									end
						  else nextstate = ESPERA_ARMAZENA_RESULTADO;
			
			RESGATA_A: if (~ready & tecla<10) begin
						igual = 0;
						saidaA = 0;
						if (tecla == 0) saidaA = store0;
						else if (tecla == 1) saidaA = store1;
						else if (tecla == 2) saidaA = store2;
						else if (tecla == 3) saidaA = store3;
						else if (tecla == 4) saidaA = store4;
						else if (tecla == 5) saidaA = store5;
						else if (tecla == 6) saidaA = store6;
						else if (tecla == 7) saidaA = store7;
						else if (tecla == 8) saidaA = store8;
						else if (tecla == 9) saidaA = store9;
						nextstate = ESPERA_RESGATA_A;
						end
			else nextstate = RESGATA_A;
			
			ESPERA_RESGATA_A: if (~ready & (tecla == 10 || tecla == 11)) begin
									saidaB = 0;
									sinal = tecla == 10 ? 0 : 1;
									nextstate = ENTRADA_B;
									end
						  else nextstate = ESPERA_RESGATA_A; 
			
			default: nextstate = ENTRADA_A;

			endcase
endmodule			