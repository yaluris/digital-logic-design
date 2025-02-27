----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:27:42 03/23/2021 
-- Design Name: 
-- Module Name:    generate_propagate_unit - Behavioral 
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

entity generate_propagate_unit is                                -- Entity implementation
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);                -- I/O Signal declarations
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end generate_propagate_unit;

architecture Behavioral of generate_propagate_unit is            -- Architecture implementation

begin

P <= A XOR B;                                                    -- Calculate the values of the bits of Propagate
G <= A AND B;                                                    -- Calculate the values of the bits of Generate

end Behavioral;
