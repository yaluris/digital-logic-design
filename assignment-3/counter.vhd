----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:30:19 04/16/2021 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;                                 -- Use all definitions from the package STD_LOGIC_UNSIGNED

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is                                                -- Entity implementation
    Port ( Clk : in  STD_LOGIC;                                  -- I/O Signal declarations
           Rst : in  STD_LOGIC;
           Control : in  STD_LOGIC_VECTOR (2 downto 0);
           Count : out  STD_LOGIC_VECTOR (7 downto 0);
           Overflow : out  STD_LOGIC;
           Underflow : out  STD_LOGIC;
           Valid : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is                            -- Architecture implementation

signal CountTemp: STD_LOGIC_VECTOR(7 downto 0);                  -- Signal declarations
signal OverflowTemp, UnderflowTemp, ValidTemp: STD_LOGIC;

begin

    process
	 
	 begin
	 
	 wait until Clk'Event AND Clk = '1';                          -- Wait for the Clk pulse 
	 if Rst = '1' then                                            -- Initialize the counter when Rst is activated
	     CountTemp <= "00000000";
        OverflowTemp <= '0';
        UnderflowTemp <= '0';
		  ValidTemp <= '1';
	 else 
	     if ValidTemp = '1' then                                  -- If Valid is equal to 1 the counter takes values from 0 to 255 depending on the input signal Control and the current state 
	         if Control = "000" then                              -- Before each step the counter checks for Underflow and Overflow
		          if CountTemp < 5 then                            -- If either of them is about to occur then Valid takes the value 0 and the counter stops
				        UnderflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp - 5;
			       end if;
	         elsif Control = "001" then
		          if CountTemp < 2 then
				        UnderflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp - 2;
			       end if;
	         elsif Control = "010" then
		          CountTemp <= CountTemp;
	         elsif Control = "011" then
		          if CountTemp = 255 then
				        OverflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp + 1;
			       end if;
	         elsif Control = "100" then
		          if CountTemp > 253 then
				        OverflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp + 2;
			       end if;
	         elsif Control = "101" then
		          if CountTemp > 250 then
				        OverflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp + 5;
			       end if;
	         elsif Control = "110" then
		          if CountTemp > 249 then
				        OverflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp + 6;
			       end if;
	         else
		          if CountTemp > 243 then
				        OverflowTemp <= '1';
					     ValidTemp <= '0';
                else					 
		              CountTemp <= CountTemp + 12;
			       end if;		  
		      end if;
        else
            CountTemp <= CountTemp;	 
	     end if;
    end if;
    
	 end process;
	 
	 Count <= CountTemp;
	 Overflow <= OverflowTemp;
	 Underflow <= UnderflowTemp;
	 Valid <= ValidTemp;
	 
end Behavioral;
