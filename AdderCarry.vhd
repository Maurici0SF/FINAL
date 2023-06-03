library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity AdderCarry is
	port (CLK,cargar   :  in STD_LOGIC;
			Carry :  in STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
end AdderCarry;

architecture behav of AdderCarry is
	signal n : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if cargar='1' then
				n<= (others => '0');
				NumS<= (others => '0');
			else
				n <= n + Carry;
			end if;
		end if;
		NumS <= n;
	end process;
end behav;
