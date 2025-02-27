----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:33 05/23/2021 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           NumberIn : in  STD_LOGIC_VECTOR (3 downto 0);
           NumberOut : out  STD_LOGIC_VECTOR (3 downto 0);
           Empty : out  STD_LOGIC;
           AlmostEmpty : out  STD_LOGIC;
           AlmostFull : out  STD_LOGIC;
           Full : out  STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

    COMPONENT fsm
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Empty : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic;
         Full : OUT  std_logic;
         Address : OUT  std_logic_vector(3 downto 0);
         WriteEnable : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;

    COMPONENT memory
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(3 downto 0);
         dina : IN  std_logic_vector(3 downto 0);
         douta : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

signal A: std_logic_vector(3 downto 0);
signal WE: std_logic_vector(0 downto 0);

begin

CONTROL: fsm
    port map ( Clk => Clk,
	            Rst => Rst,
					Push => Push,
					Pop => Pop,
					Empty => Empty,
					AlmostEmpty => AlmostEmpty,
					AlmostFull => AlmostFull,
					Full => Full,
					Address => A,
					WriteEnable => WE);
					
DATAPATH: memory
    port map ( clka => Clk,
	            wea => WE,
					addra => A,
					dina => NumberIn,
					douta => NumberOut);

end Behavioral;
