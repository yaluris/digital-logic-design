----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:22:37 03/13/2021 
-- Design Name: 
-- Module Name:    full_adder_2bit - Behavioral 
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
library IEEE;                                                    -- Library declaration
use IEEE.STD_LOGIC_1164.ALL;                                     -- Use all definitions from the package STD_LOGIC_1164

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_2bit is                                        -- Entity implementation
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);                -- I/O Signal declarations
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           Cin : in  STD_LOGIC;
           RESULT : out  STD_LOGIC_VECTOR (1 downto 0);
           Cout : out  STD_LOGIC);
end full_adder_2bit;

architecture Behavioral of full_adder_2bit is                    -- Architecture implementation

    COMPONENT full_adder_1bit                                    -- Component declaration
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;

signal C: STD_LOGIC;                                             -- Signal declaration

begin

FA1: full_adder_1bit
    port map ( A => A(0),
	            B => B(0),
					Cin => Cin,
					S => RESULT(0),                                   -- Calculate the value of RESULT(0)
					Cout => C);                                       -- Calculate the value of FA1 Carry Out
					
FA2: full_adder_1bit
    port map ( A => A(1),
	            B => B(1),
					Cin => C,                                         -- Use FA1 Carry Out as input to FA2
					S => RESULT(1),                                   -- Calculate the value of RESULT(1)
					Cout => Cout);                                    -- Calculate the value of Carry Out

end Behavioral;
