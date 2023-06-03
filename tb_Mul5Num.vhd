library ieee;
use ieee.std_logic_1164.all;

entity tb_Mul5Num is
end tb_Mul5Num;

architecture tb of tb_Mul5Num is

    component Mul5Num
        port (CLK     : in std_logic;
              cargar  : in std_logic;
              disparo : in std_logic;
              reset   : in std_logic;
              U4      : in std_logic_vector (3 downto 0);
              U3      : in std_logic_vector (3 downto 0);
              U2      : in std_logic_vector (3 downto 0);
              U1      : in std_logic_vector (3 downto 0);
              U0      : in std_logic_vector (3 downto 0);
              V4      : in std_logic_vector (3 downto 0);
              V3      : in std_logic_vector (3 downto 0);
              V2      : in std_logic_vector (3 downto 0);
              V1      : in std_logic_vector (3 downto 0);
              V0      : in std_logic_vector (3 downto 0);
              Sal0    : out std_logic_vector (6 downto 0);
              Sal1    : out std_logic_vector (6 downto 0);
              Sal2    : out std_logic_vector (6 downto 0);
              Sal3    : out std_logic_vector (6 downto 0);
              Sal4    : out std_logic_vector (6 downto 0);
              Sal5    : out std_logic_vector (6 downto 0);
              Sal6    : out std_logic_vector (6 downto 0);
              Sal7    : out std_logic_vector (6 downto 0);
              Sal8    : out std_logic_vector (6 downto 0);
              Sal9    : out std_logic_vector (6 downto 0));
    end component;

    signal CLK     : std_logic;
    signal cargar  : std_logic;
    signal disparo : std_logic;
    signal reset   : std_logic;
    signal U4      : std_logic_vector (3 downto 0);
    signal U3      : std_logic_vector (3 downto 0);
    signal U2      : std_logic_vector (3 downto 0);
    signal U1      : std_logic_vector (3 downto 0);
    signal U0      : std_logic_vector (3 downto 0);
    signal V4      : std_logic_vector (3 downto 0);
    signal V3      : std_logic_vector (3 downto 0);
    signal V2      : std_logic_vector (3 downto 0);
    signal V1      : std_logic_vector (3 downto 0);
    signal V0      : std_logic_vector (3 downto 0);
    signal Sal0    : std_logic_vector (6 downto 0);
    signal Sal1    : std_logic_vector (6 downto 0);
    signal Sal2    : std_logic_vector (6 downto 0);
    signal Sal3    : std_logic_vector (6 downto 0);
    signal Sal4    : std_logic_vector (6 downto 0);
    signal Sal5    : std_logic_vector (6 downto 0);
    signal Sal6    : std_logic_vector (6 downto 0);
    signal Sal7    : std_logic_vector (6 downto 0);
    signal Sal8    : std_logic_vector (6 downto 0);
    signal Sal9    : std_logic_vector (6 downto 0);

begin

    dut : Mul5Num
    port map (CLK     => CLK,
              cargar  => cargar,
              disparo => disparo,
              reset   => reset,
              U4      => U4,
              U3      => U3,
              U2      => U2,
              U1      => U1,
              U0      => U0,
              V4      => V4,
              V3      => V3,
              V2      => V2,
              V1      => V1,
              V0      => V0,
              Sal0    => Sal0,
              Sal1    => Sal1,
              Sal2    => Sal2,
              Sal3    => Sal3,
              Sal4    => Sal4,
              Sal5    => Sal5,
              Sal6    => Sal6,
              Sal7    => Sal7,
              Sal8    => Sal8,
              Sal9    => Sal9);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        CLK <= '0';
        cargar <= '0';
        disparo <= '0';
        reset <= '0';
        U4 <= (others => '0');
        U3 <= (others => '0');
        U2 <= (others => '0');
        U1 <= (others => '0');
        U0 <= (others => '0');
        V4 <= (others => '0');
        V3 <= (others => '0');
        V2 <= (others => '0');
        V1 <= (others => '0');
        V0 <= (others => '0');

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;