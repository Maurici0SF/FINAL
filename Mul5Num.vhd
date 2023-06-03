library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Mul5Num is
	port (CLK,cargar,disparo,reset	:	in STD_LOGIC;
			U4,U3,U2,U1,U0 :  in STD_LOGIC_VECTOR(3 downto 0);
			V4,V3,V2,V1,V0 :  in STD_LOGIC_VECTOR(3 downto 0);
			Sal0,Sal1,Sal2,Sal3,Sal4,Sal5,Sal6,Sal7,Sal8,Sal9 :	out STD_LOGIC_VECTOR(6 downto 0));
end Mul5Num;

architecture behav of Mul5Num is
	
	component Reg 
	port (clk,cargar,disparo: in STD_LOGIC;
			Data: in STD_LOGIC_VECTOR(3 downto 0);
			S_Disparado :	out STD_LOGIC);
	end component;
	
	component Mux2to1
	port (op: 	in STD_LOGIC;
			W0,W1 : in STD_LOGIC_VECTOR(3 downto 0);
			SalW:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Decoder
	port(bcd : in std_logic_vector(3 downto 0);
		  Sal7seg : out std_logic_vector(6 downto 0));
	end component;
	
	component RegW
	port(clk, reset: in std_logic;
		  d: in std_logic_vector(3 downto 0);
		  q: out std_logic_vector(3 downto 0));
	end component;
	
	component Adder is
	port (CLK,cargar  :  in STD_LOGIC;
			NumE  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component AdderCarry is
	port (CLK,cargar   :  in STD_LOGIC;
			Carry :  in STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Adder2 is
	port (CLK,cargar :  in STD_LOGIC;
			cIn : in STD_LOGIC_VECTOR(3 downto 0);
			NumE,NumE2  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Adder3 is
	port (CLK,cargar  :  in STD_LOGIC;
			cIn : in STD_LOGIC_VECTOR(3 downto 0);
			NumE,NumE2,NumE3  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Adder4 is
	port (CLK,cargar   :  in STD_LOGIC;
			cIn : in STD_LOGIC_VECTOR(3 downto 0);
			NumE,NumE2,NumE3,NumE4  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Adder5 is
	port (CLK,cargar   :  in STD_LOGIC;
			cIn : in STD_LOGIC_VECTOR(3 downto 0);
			NumE,NumE2,NumE3,NumE4,NumE5  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component AdderC is
	port (CLK,cargar  :  in STD_LOGIC;
			cIn : in STD_LOGIC_VECTOR(3 downto 0);
			NumE  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	--Señales
	signal U0_s,U1_s,U2_s,U3_s,U4_s : std_logic;
	signal V0_s,V1_s,V2_s,V3_s,V4_s : std_logic_vector(3 downto 0);
	signal salSuma1 : std_logic_vector(3 downto 0);
	signal sal1Suma2,sal2Suma2 : std_logic_vector(3 downto 0);
	signal sal1Suma3,sal2Suma3,sal3Suma3 : std_logic_vector(3 downto 0);
	signal sal1Suma4,sal2Suma4,sal3Suma4,sal4Suma4 : std_logic_vector(3 downto 0);
	signal sal1Suma5,sal2Suma5,sal3Suma5,sal4Suma5,sal5Suma5 : std_logic_vector(3 downto 0);
	signal sal1Suma6,sal2Suma6,sal3Suma6,sal4Suma6 : std_logic_vector(3 downto 0);
	signal sal1Suma7,sal2Suma7,sal3Suma7 : std_logic_vector(3 downto 0);
	signal sal1Suma8,sal2Suma8 : std_logic_vector(3 downto 0);
	signal salSuma9 : std_logic_vector(3 downto 0);
	signal C1,C2,C3,C4,C5,C6,C7,C8,C9 : STD_LOGIC_VECTOR(3 downto 0);
	signal BCD1,BCD2,BCD3,BCD4,BCD5,BCD6,BCD7,BCD8,BCD9,BCD10 : std_logic_vector(3 downto 0);
	
	signal Cero : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	
begin
	
	--Valores de U
	DU0_s : Reg port map(CLK,cargar,disparo,U0,U0_s);
	D_U1 : Reg port map(CLK,cargar,disparo,U1,U1_s);
	D_U2 : Reg port map(CLK,cargar,disparo,U2,U2_s);
	D_U3 : Reg port map(CLK,cargar,disparo,U3,U3_s);
	D_U4 : Reg port map(CLK,cargar,disparo,U4,U4_s);
	
	--Registros W (V)
	RegW0 : RegW port map(CLK,reset,V0,V0_s);
	RegW1 : RegW port map(CLK,reset,V1,V1_s);
	RegW2 : RegW port map(CLK,reset,V2,V2_s);
	RegW3 : RegW port map(CLK,reset,V3,V3_s);
	RegW4 : RegW port map(CLK,reset,V4,V4_s);
	
	--Representación de multiplicaciones
	
	--Multiplicación 1
	
	Mul1_Mux1 : Mux2to1 port map(U0_s,Cero,V0_s,salSuma1);
	 
	Sum1 : Adder port map(CLK,cargar,salSuma1,C1,BCD1);
	
	D_Sum1 : Decoder port map(BCD1,Sal0);
	
	--Multiplicación 2
	
	Mul2_Mux1 : Mux2to1 port map(U1_s,Cero,V0_s,sal1Suma2);
	Mul2_Mux2 : Mux2to1 port map(U0_s,Cero,V1_s,sal2Suma2);
	
	Sum2 : Adder2 port map(CLK,cargar,C1,sal1Suma2,sal2Suma2,C2,BCD2);
	
	D_Sum2 : Decoder port map(BCD2,Sal1);
	
	--Multiplicación 3
	
	Mul3_Mux1 : Mux2to1 port map(U2_s,Cero,V0_s,sal1Suma3);
	Mul3_Mux2 : Mux2to1 port map(U1_s,Cero,V1_s,sal2Suma3);
	Mul3_Mux3 : Mux2to1 port map(U0_s,Cero,V2_s,sal3Suma3);
	
	Sum3 : Adder3 port map(CLK,cargar,C2,sal1Suma3,sal2Suma3,sal3Suma3,C3,BCD3);
	
	D_Sum3 : Decoder port map(BCD3,Sal2);
	
	
	--Multiplicación 4
	
	Mul4_Mux1 : Mux2to1 port map(U3_s,Cero,V0_s,sal1Suma4);
	Mul4_Mux2 : Mux2to1 port map(U2_s,Cero,V1_s,sal2Suma4);
	Mul4_Mux3 : Mux2to1 port map(U1_s,Cero,V2_s,sal3Suma4);
	Mul4_Mux4 : Mux2to1 port map(U0_s,Cero,V3_s,sal4Suma4);
	
	Sum4 : Adder4 port map(CLK,cargar,C3,sal1Suma4,sal2Suma4,sal3Suma4,sal4Suma4,C4,BCD4);
	
	D_Sum4 : Decoder port map(BCD4,Sal3);
	
	--Multiplicación 5
	
	Mul5_Mux1 : Mux2to1 port map(U4_s,Cero,V0_s,sal1Suma5);
	Mul5_Mux2 : Mux2to1 port map(U3_s,Cero,V1_s,sal2Suma5);
	Mul5_Mux3 : Mux2to1 port map(U2_s,Cero,V2_s,sal3Suma5);
	Mul5_Mux4 : Mux2to1 port map(U1_s,Cero,V3_s,sal4Suma5);
	Mul5_Mux5 : Mux2to1 port map(U0_s,Cero,V4_s,sal5Suma5);
	
	Sum5 : Adder5 port map(CLK,cargar,C4,sal1Suma5,sal2Suma5,sal3Suma5,sal4Suma5,sal5Suma5,C5,BCD5);
	
	D_Sum5 : Decoder port map(BCD5,Sal4);
	
	--Multiplicación 6
	
	Mul6_Mux1 : Mux2to1 port map(U4_s,Cero,V1_s,sal1Suma6);
	Mul6_Mux2 : Mux2to1 port map(U3_s,Cero,V2_s,sal2Suma6);
	Mul6_Mux3 : Mux2to1 port map(U2_s,Cero,V3_s,sal3Suma6);
	Mul6_Mux4 : Mux2to1 port map(U1_s,Cero,V4_s,sal4Suma6);
	
	Sum6 : Adder4 port map(CLK,cargar,C5,sal1Suma6,sal2Suma6,sal3Suma6,sal4Suma6,C6,BCD6);
	
	D_Sum6 : Decoder port map(BCD6,Sal5);
	
	--Multiplicación 7
	
	Mul7_Mux1 : Mux2to1 port map(U4_s,Cero,V2_s,sal1Suma7);
	Mul7_Mux2 : Mux2to1 port map(U3_s,Cero,V3_s,sal2Suma7);
	Mul7_Mux3 : Mux2to1 port map(U2_s,Cero,V4_s,sal3Suma7);
	
	Sum7 : Adder3 port map(CLK,cargar,C6,sal1Suma7,sal2Suma7,sal3Suma7,C7,BCD7);
	
	D_Sum7 : Decoder port map(BCD7,Sal6);
	
	--Multiplicación 8
	
	Mul8_Mux1 : Mux2to1 port map(U4_s,Cero,V3_s,sal1Suma8);
	Mul8_Mux2 : Mux2to1 port map(U3_s,Cero,V4_s,sal2Suma8);
	
	Sum8 : Adder2 port map(CLK,cargar,C7,sal1Suma8,sal2Suma8,C8,BCD8);
	
	D_Sum8 : Decoder port map(BCD8,Sal7);
	
	--Multiplicación 9
	
	Mul9_Mux1 : Mux2to1 port map(U4_s,Cero,V4_s,salSuma9);
	
	Sum9 : AdderC port map(CLK,cargar,C8,salSuma9,C9,BCD9);
	
	D_Sum9 : Decoder port map(BCD9,Sal8);
	
	--Ultimo Sum con carry
	
	Sum10 : AdderCarry port map(CLK,cargar,C9,BCD10);
	
	D_Sum10 : Decoder port map(BCD10,Sal9);
	
end behav;