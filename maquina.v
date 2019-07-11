module maquina(
	input logic clk,
	input logic reset,
	input logic ready,
	input logic [3:0] teclas,
	output logic [7:0] saidaA, saidaB,
	output logic sinal,
	output logic igual
);

typedef enum logic [4:0] {ENTRADA_A0, ESPERA_A0, ENTRADA_A1, ESPERA_A1, ENTRADA_A2, ESPERA_A2, ENTRADA_A3, ESPERA_A3, ENTRADA_A4, ESPERA_A4, ENTRADA_A5, ESPERA_A5, ENTRADA_A6, ESPERA_A6,ENTRADA_B0, ESPERA_B0, ENTRADA_B1, ESPERA_B1, ENTRADA_B2, ESPERA_B2, ENTRADA_B3, ESPERA_B3, ENTRADA_B4, ESPERA_B4, ENTRADA_B5, ESPERA_B5, ENTRADA_B6, ESPERA_B6 , DECIDE_SINAL, MOSTRA_RESULTADO, ESPERA_SINAL, ESPERA_IGUAL} statetype;
	statetype state, nextstate;
	
always_ff @(posedge clk, posedge reset)
		if (reset) state <= ENTRADA_A0;
		else state <= nextstate;
		
always_ff @(posedge clk, posedge reset)
	if (reset) begin 
		saidaA = 7'b0000000; 
		saidaB = 7'b0000000; 
		sinal = '0;
		igual = '0;
	end
	else
		case (state)
			ENTRADA_A0: if (ready & teclas<10) begin
				saidaA[0] = teclas;
				nextstate = ESPERA_A0;
			end
			else  nextstate = ENTRADA_A0;
			
			ESPERA_A0: if (~ready) nextstate = ENTRADA_A1;
									else nextstate = ESPERA_A0;
									
			ENTRADA_A1: if (ready & teclas<10) begin
				saidaA[1] = saidaA[0];
				saidaA[0] = teclas;
				nextstate = ESPERA_A1;
			end
			else  if (teclas == 10) begin 
				sinal = 0;
				nextstate = ENTRADA_B0;
			end
			else if (teclas == 11) begin
				sinal = 1;
				nextstate = ENTRADA_B0;
			end
			else	nextstate = ENTRADA_A1;
			
			ESPERA_A1: if (~ready) nextstate = ENTRADA_A2;
									else nextstate = ESPERA_A1;
			
			ENTRADA_A2: if (ready & teclas<10) begin
				saidaA[2] = saidaA[1];
				saidaA[1] = saidaA[0];
				saidaA[0] = teclas;
				nextstate = ESPERA_A2;
			end
			else  if (teclas == 10) begin 
				sinal = 0;
				nextstate = ENTRADA_B0;
			end
			else if (teclas == 11) begin
				sinal = 1;
				nextstate = ENTRADA_B0;
			end
			else  nextstate = ENTRADA_A2;
			
			ESPERA_A2: if (~ready) nextstate = ENTRADA_A3;
									else nextstate = ESPERA_A2;
			
			ENTRADA_A3: if (ready & teclas<10) begin
				saidaA[3] = saidaA[2];
				saidaA[2] = saidaA[1];
				saidaA[1] = saidaA[0];
				saidaA[0] = teclas;
				nextstate = ESPERA_A3;
			end
			else  if (teclas == 10) begin 
				sinal = 0;
				nextstate = ENTRADA_B0;
			end
			else if (teclas == 11) begin
				sinal = 1;
				nextstate = ENTRADA_B0;
			end
			else  nextstate = ENTRADA_A3;
			
			ESPERA_A3: if (~ready) nextstate = ENTRADA_A4;
									else nextstate = ESPERA_A3;
			
			ENTRADA_A4: if (ready & teclas<10) begin
				saidaA[4] = saidaA[3];
				saidaA[3] = saidaA[2];
				saidaA[2] = saidaA[1];
				saidaA[1] = saidaA[0];
				saidaA[0] = teclas;
				nextstate = ESPERA_A4;
			end
			else if (teclas == 10) begin 
				sinal = 0;
				nextstate = ENTRADA_B0;
			end
			else if (teclas == 11) begin
				sinal = 1;
				nextstate = ENTRADA_B0;
			end
			else  nextstate = ENTRADA_A4;
			
			ESPERA_A4: if (~ready) nextstate = ENTRADA_A5;
									else nextstate = ESPERA_A4;
									
			ENTRADA_A5: if (ready & teclas<10) begin
				saidaA[5] = saidaA[4];
				saidaA[4] = saidaA[3];
				saidaA[3] = saidaA[2];
				saidaA[2] = saidaA[1];
				saidaA[1] = saidaA[0];
				saidaA[0] = teclas;
				nextstate = ESPERA_A5;
			end
			else if (teclas == 10) begin 
				sinal = 0;
				nextstate = ENTRADA_B0;
			end
			else if (teclas == 11) begin
				sinal = 1;
				nextstate = ENTRADA_B0;
			end
			else  nextstate = ENTRADA_A5;
			
			ESPERA_A5: if (~ready) nextstate = ENTRADA_A6;
									else nextstate = ESPERA_A5;
									
			ENTRADA_A6: if (ready & teclas<10) begin
				saidaA[6] = saidaA[5];
				saidaA[5] = saidaA[4];
				saidaA[4] = saidaA[3];
				saidaA[3] = saidaA[2];
				saidaA[2] = saidaA[1];
				saidaA[1] = saidaA[0];
				saidaA[0] = teclas;
				nextstate = ESPERA_A6;
			end
			else if (teclas == 10) begin 
				sinal = 0;
				nextstate = ENTRADA_B0;
			end
			else if (teclas == 11) begin
				sinal = 1;
				nextstate = ENTRADA_B0;
			end
			else  nextstate = ENTRADA_A6;
			
			ESPERA_A6: if (~ready) nextstate = ESPERA_SINAL;
									else nextstate = ESPERA_A5;
			
			
			ENTRADA_B0: if (ready & teclas<10) begin
				saidaB[0] = teclas;
				nextstate = ESPERA_B0;
			end
			else  nextstate = ENTRADA_B0;
			
			ESPERA_B0: if (~ready) nextstate = ENTRADA_B1;
									else nextstate = ESPERA_B0;
									
			ENTRADA_B1: if (ready & teclas<10) begin
				saidaB[1] = saidaB[0];
				saidaB[0] = teclas;
				nextstate = ESPERA_B1;
			end
			else if (teclas == 15) begin 
				igual = 1;
				nextstate = MOSTRA_RESULTADO;
			end
			else  nextstate = ENTRADA_B1;
			
			ESPERA_B1: if (~ready) nextstate = ENTRADA_B2;
									else nextstate = ESPERA_B1;
			
			ENTRADA_B2: if (ready & teclas<10) begin
				saidaB[2] = saidaB[1];
				saidaB[1] = saidaB[0];
				saidaB[0] = teclas;
				nextstate = ESPERA_B2;
			end
			else if (teclas == 15) begin 
				igual = 1;
				nextstate = MOSTRA_RESULTADO;
			end
			else  nextstate = ENTRADA_B2;
			
			ESPERA_B2: if (~ready) nextstate = ENTRADA_B3;
									else nextstate = ESPERA_B2;
			
			ENTRADA_B3: if (ready & teclas<10) begin
				saidaB[3] = saidaB[2];
				saidaB[2] = saidaB[1];
				saidaB[1] = saidaB[0];
				saidaB[0] = teclas;
				nextstate = ESPERA_B3;
			end
			else if (teclas == 15) begin 
				igual = 1;
				nextstate = MOSTRA_RESULTADO;
			end
			else  nextstate = ENTRADA_B3;
			
			ESPERA_B3: if (~ready) nextstate = ENTRADA_B4;
									else nextstate = ESPERA_B3;
			
			ENTRADA_B4: if (ready & teclas<10) begin
				saidaB[4] = saidaB[3];
				saidaB[3] = saidaB[2];
				saidaB[2] = saidaB[1];
				saidaB[1] = saidaB[0];
				saidaB[0] = teclas;
				nextstate = ESPERA_B4;
			end
			else if (teclas == 15) begin 
				igual = 1;
				nextstate = MOSTRA_RESULTADO;
			end
			else  nextstate = ENTRADA_B4;
			
			ESPERA_B4: if (~ready) nextstate = ENTRADA_B5;
									else nextstate = ESPERA_B4;
									
			ENTRADA_B5: if (ready & teclas<10) begin
				saidaB[5] = saidaB[4];
				saidaB[4] = saidaB[3];
				saidaB[3] = saidaB[2];
				saidaB[2] = saidaB[1];
				saidaB[1] = saidaB[0];
				saidaB[0] = teclas;
				nextstate = ESPERA_B5;
			end
			else if (teclas == 15) begin 
				igual = 1;
				nextstate = MOSTRA_RESULTADO;
			end
			else  nextstate = ENTRADA_B5;
			
			ESPERA_B5: if (~ready) nextstate = ENTRADA_B6;
									else nextstate = ESPERA_B5;
									
			ENTRADA_B6: if (ready & teclas<10) begin
				saidaB[6] = saidaB[5];
				saidaB[5] = saidaB[4];
				saidaB[4] = saidaB[3];
				saidaB[3] = saidaB[2];
				saidaB[2] = saidaB[1];
				saidaB[1] = saidaB[0];
				saidaB[0] = teclas;
				nextstate = ESPERA_B6;
			end
			else if (teclas == 15) begin 
				igual = 1;
				nextstate = MOSTRA_RESULTADO;
			end
			else  nextstate = ENTRADA_B6;
			
			ESPERA_B6: if (~ready) nextstate = ENTRADA_B6;
									else nextstate = ESPERA_IGUAL;
			
			ESPERA_SINAL: if (teclas != 10 || teclas != 11) nextstate = ESPERA_SINAL;
										else nextstate = ENTRADA_B0;
			
			MOSTRA_RESULTADO: if (teclas<10) nextstate = ENTRADA_A0;
											else nextstate = MOSTRA_RESULTADO;
			
			default: nextstate = ENTRADA_A0;

			endcase
endmodule			