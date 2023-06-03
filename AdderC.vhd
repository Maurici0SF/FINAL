library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
entity AdderC is
	port (CLK,cargar  :  in STD_LOGIC;
			cIn : in STD_LOGIC_VECTOR(3 downto 0);
			NumE  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
end AdderC;

architecture behav of AdderC is
	signal n : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal Ca : std_logic_vector(3 downto 0) := (others => '0');
	
begin
	process(CLK)
	variable aux : std_logic_vector(7 downto 0) := (others => '0');
	begin
		if rising_edge(CLK) then
			if cargar='1' then
				n<= (others => '0');
				Ca<= (others => '0');
				NumS<= (others => '0');
				Carry<= (others => '0');
				aux:= (others => '0');
			else
				if n >= "000001010" and n <= "000010011" then --10 a 19
					aux := n;
					aux := aux - "00001010";
					n <= aux + NumE + cIn;
					Ca <= "0001";
				elsif n >= "000010100" and n <= "000011101" then --20 a 29
					aux := n; 
					aux := aux - "00010100";
					n <= aux + NumE + cIn;
					Ca <= "0010";
				elsif n >= "000011110" and n <= "000100111" then --30 a 39
					aux := n;
					aux := aux - "00011110";
					n <= aux + NumE + cIn;
					Ca <= "0011";
				elsif n >= "000101000" and n <= "000110001" then --40 a 49
					aux := n;
					aux := aux - "00101000";
					n <= aux + NumE + cIn;
					Ca <= "0100";
				elsif n >= "000110010" and n <= "000111011" then --50 a 59
					aux := n;
					aux := aux - "00110010";
					n <= aux + NumE + cIn; 
					Ca <= "0101";
				elsif n >= "000111100" and n <= "001000101" then --60 a 69
					aux := n;
					aux := aux - "00111100";
					n <= aux + NumE + cIn;
					Ca <= "0110";
				elsif n >= "001000110" and n <= "001001111" then --70 a 79
					aux := n;
					aux := aux - "01000110";
					n <= aux + NumE + cIn;
					Ca <= "0111";
				elsif n >= "001010000" and n <= "001011001" then --80 a 89
					aux := n;
					aux := aux - "01010000";
					n <= aux + NumE;
					Ca <= "1000";
				elsif n >= "001011010" and n <= "001100011" then --90 a 99
					aux := n;
					aux := aux - "01011010";
					n <= aux + NumE + cIn;
					Ca <= "1001";
				else
					n <= n + NumE + cIn;
					Ca <= (others => '0');
				end if;
			end if;
		end if;
		NumS <= n(3 downto 0);
		Carry <= Ca;
	end process;
end behav;
