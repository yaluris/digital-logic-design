----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:07 03/23/2021 
-- Design Name: 
-- Module Name:    sum_unit - Behavioral 
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

entity sum_unit is                                               -- Entity implementation
    Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);                -- I/O Signal declarations
           C : in  STD_LOGIC_VECTOR (2 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));           
end sum_unit;

architecture Behavioral of sum_unit is                           -- Architecture implementation

begin

S(0) <= P(0) XOR Cin;                                            -- Calculate the values of the bits of Sum
S(1) <= P(1) XOR C(0);
S(2) <= P(2) XOR C(1);
S(3) <= P(3) XOR C(2);

end Behavioral;
