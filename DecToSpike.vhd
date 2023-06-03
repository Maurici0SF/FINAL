library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity DecToSpike is
	port (clk,cargar: in STD_LOGIC;
			U: in STD_LOGIC_VECTOR(3 downto 0);
			SpikeToReg:	out STD_LOGIC);
end DecToSpike;

architecture behav of DecToSpike is
	signal aux : STD_LOGIC_VECTOR(3 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if cargar = '1' then
				aux <= U;
			else
				if aux = "0000" then
					SpikeToReg <= '0';
				else
					SpikeToReg <= '1';
					aux <= aux - '1';
				end if;
			end if;
		end if;
	end process;
end behav;