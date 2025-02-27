----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:11 03/11/2021 
-- Design Name: 
-- Module Name:    full_adder_1bit - Behavioral 
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

entity full_adder_1bit is                                        -- Entity implementation
    Port ( A : in  STD_LOGIC;                                    -- I/O Signal declarations
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end full_adder_1bit;

architecture Behavioral of full_adder_1bit is                    -- Architecture implementation

    COMPONENT half_adder                                         -- Component declaration
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
	 
signal HS, HC1, HC2: STD_LOGIC;                                  -- Signal declarations
	 
begin

HA1: half_adder
    port map ( A => A,
	            B => B,
					S => HS,                                          -- Calculate the value of HA1 Sum
					Cout => HC1);                                     -- Calculate the value of HA1 Carry Out
					
HA2: half_adder
    port map ( A => HS,                                          -- Use HA1 Sum as input to HA2
	            B => Cin,
					S => S,                                           -- Calculate the value of Sum
					Cout => HC2);                                     -- Calculate the value of HA2 Carry Out
					
Cout <= HC1 OR HC2;                                              -- Calculate the value of Carry Out
					 
end Behavioral;
