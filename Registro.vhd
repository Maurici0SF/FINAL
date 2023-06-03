library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Registro is
	port (Spike,clk,cargar,disparo: in STD_LOGIC;
			Spike_Disparado: out STD_LOGIC;
			Reg9Bits:	out STD_LOGIC_VECTOR(8 downto 0));
end Registro;

architecture behav of Registro is
	signal auxReg : STD_LOGIC_VECTOR(8 downto 0) := "000000000";
	signal auxReg2 : STD_LOGIC_VECTOR(8 downto 0);
begin
	process(clk)
		variable b1t : integer := 0;
	begin
		if rising_edge(clk) then
			
			if cargar = '1' then
				auxReg <= "000000000";
			end if;
			
			if Spike = '1' then
				
				if b1t < 9 then
					auxReg(b1t) <= '1';
					b1t := b1t + 1;
				else
					b1t := 0;
				end if;
			else
				b1t := 0;
			end if;
			
			if disparo = '1' then
				auxReg2 <= auxReg;
			else
				if auxReg2(0) = '1' then
					Spike_Disparado <= '1';
					auxReg2 <= '0' & auxReg2(8 downto 1);
				else
					Spike_Disparado <= '0';
				end if;
			end if;
		end if;
		Reg9Bits <= auxReg;
	end process;
end behav;