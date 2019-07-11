module maquina(
	input logic clk,
	input logic reset,
	input logic ready,
	input logic [7:0] teclas,
	output logic [7:0] saidaA, saidaB,
	output logic sinal,
	output logic igual
);

typedef enum logic [2:0] {ENTRADA_A, ESPERA_A0, ENTRADA_B, ESPERA_B0, MOSTRA_RESULTADO} statetype;
	statetype state, nextstate;
	
always_ff @(posedge clk, posedge reset)
		if (reset) state <= ENTRADA_A;
		else state <= nextstate;
		
always_ff @(posedge clk, posedge reset)
	if (reset) begin 
		saidaA = 8'b00000000; 
		saidaB = 8'b00000000; 
		sinal = '0;
		igual = '0;
	end
	else
		case (state)
			ENTRADA_A: if (ready & teclas<10) begin
				saidaA = teclas;
				nextstate = ESPERA_A0;
			end
			else  nextstate = ENTRADA_A;
			
			ESPERA_A0: if (~ready & (teclas == 10 || teclas == 11)) begin
									sinal = teclas == 10 ? 0 : 1;
									nextstate = ENTRADA_B;
						  end
						  else nextstate = ESPERA_A0;
		
			ENTRADA_B: if (ready & teclas<10) begin
				saidaB = teclas;
				nextstate = ESPERA_B0;
			end
			else  nextstate = ENTRADA_B;
			
			ESPERA_B0: if (~ready && teclas == 14) begin 
											igual = 1;
											nextstate = MOSTRA_RESULTADO;
									end
									else nextstate = ESPERA_B0;
			
			MOSTRA_RESULTADO: if (teclas<10) nextstate = ENTRADA_A;
											else nextstate = MOSTRA_RESULTADO;
			
			default: nextstate = ENTRADA_A;

			endcase
endmodule			