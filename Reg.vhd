
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Reg is
	port (clk,cargar,disparo: in STD_LOGIC;
			Data: in STD_LOGIC_VECTOR(3 downto 0);
			S_Disparado :	out STD_LOGIC);
end Reg;

architecture behav of Reg is
	
	component DecToSpike
	port (clk,cargar: in STD_LOGIC;
			U: in STD_LOGIC_VECTOR(3 downto 0);
			SpikeToReg:	out STD_LOGIC);
   end component;
	
	component Registro
	port (Spike,clk,cargar,disparo: in STD_LOGIC;
			Spike_Disparado: out STD_LOGIC;
			Reg9Bits:	out STD_LOGIC_VECTOR(8 downto 0));
	end component;
	
	
	signal SpikeToRegistro : STD_LOGIC;
	signal auxReg9Bits : STD_LOGIC_VECTOR(8 downto 0);
	
begin
	
	BtoS : DecToSpike port map(CLK,cargar,Data,SpikeToRegistro);
	
	Re : Registro port map(SpikeToRegistro,CLK,cargar,disparo,S_Disparado,auxReg9Bits);
		
end behav;