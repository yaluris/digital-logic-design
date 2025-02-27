----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:16 05/07/2021 
-- Design Name: 
-- Module Name:    mealy_fsm - Behavioral 
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

entity mealy_fsm is                                              -- Entity implementation
    Port ( Clk : in  STD_LOGIC;                                  -- I/O Signal declarations
           Rst : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Control : out  STD_LOGIC_VECTOR (2 downto 0));
end mealy_fsm;

architecture Behavioral of mealy_fsm is                          -- Architecture implementation

type state is (S0, S1, S2, S3, S4);                              -- State declarations 
signal fsm_state: state;                                         -- Signal declarations
signal ControlTemp: STD_LOGIC_VECTOR(2 downto 0);

begin
    
    process
	 
	 begin
	 
	 wait until Clk'Event AND Clk = '1';                          -- Wait for the Clk pulse 
	 if Rst = '1' then                                            -- Initialize the mealy_fsm when Rst is activated
	     fsm_state <= S0;
		  ControlTemp <= "000";
	 else
	     case fsm_state is                                        -- For each of the 5 states, move to the next or previous state and change the value of the output Control or remain in the same state, depending on the present state and the inputs A and B
		      when S0 => 
				    if (A = '1' AND B = '0') then
						  fsm_state <= S1;
						  ControlTemp <= "001";
				    elsif (A = '0' AND B = '1') then
					     fsm_state <= S4;
						  ControlTemp <= "100";
					 else 
					     fsm_state <= fsm_state;
					 end if;
		      when S1 => 
				    if (A = '1' AND B = '0') then
						  fsm_state <= S2;
						  ControlTemp <= "010";
				    elsif (A = '0' AND B = '1') then
					     fsm_state <= S0;
						  ControlTemp <= "000";
					 else 
					     fsm_state <= fsm_state;
					 end if;
		      when S2 => 
				    if (A = '1' AND B = '0') then
						  fsm_state <= S3;
						  ControlTemp <= "011";
				    elsif (A = '0' AND B = '1') then
					     fsm_state <= S1;
						  ControlTemp <= "001";
					 else 
					     fsm_state <= fsm_state;
					 end if;
		      when S3 => 
				    if (A = '1' AND B = '0') then
						  fsm_state <= S4;
						  ControlTemp <= "100";
				    elsif (A = '0' AND B = '1') then
					     fsm_state <= S2;
						  ControlTemp <= "010";
					 else 
					     fsm_state <= fsm_state;
					 end if;
		      when S4 => 
				    if (A = '1' AND B = '0') then
						  fsm_state <= S0;
						  ControlTemp <= "000";
				    elsif (A = '0' AND B = '1') then
					     fsm_state <= S3;
						  ControlTemp <= "011";
					 else 
					     fsm_state <= fsm_state;
					 end if;
		      when others =>                                       -- Each of the 5 states is represented by 3 bits			
				    fsm_state <= S0;                                 -- There are 3 cases in which the bits do not represent a state
					 ControlTemp <= "000";                            -- In these cases do a reset 			 
	     end case;
	 end if;

	 end process;	 

	 Control <= ControlTemp;

end Behavioral;
