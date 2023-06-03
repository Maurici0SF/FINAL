library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Mux2to1 is
	port (op: 	in STD_LOGIC;
			W0,W1 : in STD_LOGIC_VECTOR(3 downto 0);
			SalW:	out STD_LOGIC_VECTOR(3 downto 0));
end Mux2to1;

architecture behav of Mux2to1 is
begin
	SalW <= W0 when op = '0' else
			  W1;
end behav;