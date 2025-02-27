----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:15 03/11/2021 
-- Design Name: 
-- Module Name:    lab1a - Behavioral 
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

entity lab1a is                                                  -- Entity implementation
    Port ( A : in  STD_LOGIC;                                    -- I/O Signal declarations                                                           
           B : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           C2 : in  STD_LOGIC;
           C3 : in  STD_LOGIC;
           C4 : in  STD_LOGIC;
           C5 : in  STD_LOGIC;
           RESULT : out  STD_LOGIC_VECTOR (5 downto 0));         -- Bus declaration
end lab1a;

architecture Behavioral of lab1a is                              -- Architecture implementation

begin

RESULT(0) <= (A NAND B) AND C0;                                  -- Calculate the values of the bits of RESULT
RESULT(1) <= (A NOR B) AND C1;
RESULT(2) <= (A AND B) AND C2;
RESULT(3) <= (A XOR B) AND C3;
RESULT(4) <= ((A AND B) OR ((NOT A) AND (NOT B))) AND C4;
RESULT(5) <= (((NOT A) AND B) XOR ((NOT A) OR B)) AND C5;

end Behavioral;
