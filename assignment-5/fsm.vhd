----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:06:29 05/23/2021 
-- Design Name: 
-- Module Name:    fsm - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Empty : out  STD_LOGIC;
           AlmostEmpty : out  STD_LOGIC;
           AlmostFull : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           Address : out  STD_LOGIC_VECTOR (3 downto 0);
           WriteEnable : out  STD_LOGIC_VECTOR (0 downto 0));
end fsm;

architecture Behavioral of fsm is

type state is (S0, S1, S2, S3, S4);
signal fsm_state: state;
signal AddressTemp: STD_LOGIC_VECTOR(3 downto 0);

begin
    
    process
	 
	 begin
	 
	 wait until Clk'Event AND Clk = '1'; 
	 if Rst = '1' then
	     fsm_state <= S0;
		  Empty <= '1';
		  AlmostEmpty <= '0';
		  AlmostFull <= '0';
		  Full <= '0';
		  AddressTemp <= "0000";
		  WriteEnable <= "0";
	 else
	     case fsm_state is                                     
		      when S0 => 
				    if (Push = '1' AND Pop = '0') then
						  fsm_state <= S1;
						  Empty <= '0';
		              AlmostEmpty <= '1';
		              AddressTemp <= AddressTemp + 1;
		              WriteEnable <= "1";
					 else 
					     fsm_state <= fsm_state;
						  WriteEnable <= "0";
					 end if;
		      when S1 => 
				    if (Push = '1' AND Pop = '0' AND AddressTemp = 3) then
						  fsm_state <= S2;
		              AlmostEmpty <= '0';
		              AddressTemp <= AddressTemp + 1;
		              WriteEnable <= "1";
				    elsif (Push = '1' AND Pop = '0' AND AddressTemp < 3) then
					     fsm_state <= fsm_state;
						  AddressTemp <= AddressTemp + 1;
						  WriteEnable <= "1";
				    elsif (Push = '0' AND Pop = '1' AND AddressTemp = 1) then
						  fsm_state <= S0;
		              Empty <= '1';
		              AlmostEmpty <= '0';
		              AddressTemp <= AddressTemp - 1;
		              WriteEnable <= "0";
				    elsif (Push = '0' AND Pop = '1' AND AddressTemp > 1) then
					     fsm_state <= fsm_state;
						  AddressTemp <= AddressTemp - 1;
						  WriteEnable <= "0";
					 else 
					     fsm_state <= fsm_state;
						  WriteEnable <= "0";
					 end if;
		      when S2 => 
				    if (Push = '1' AND Pop = '0' AND AddressTemp = 6) then
						  fsm_state <= S3;
		              AlmostFull <= '1';
		              AddressTemp <= AddressTemp + 1;
		              WriteEnable <= "1";
				    elsif (Push = '1' AND Pop = '0' AND AddressTemp < 6) then
					     fsm_state <= fsm_state;
						  AddressTemp <= AddressTemp + 1;
						  WriteEnable <= "1";
				    elsif (Push = '0' AND Pop = '1' AND AddressTemp = 4) then
						  fsm_state <= S1;
		              AlmostEmpty <= '1';
		              AddressTemp <= AddressTemp - 1;
		              WriteEnable <= "0";
				    elsif (Push = '0' AND Pop = '1' AND AddressTemp > 4) then
					     fsm_state <= fsm_state;
						  AddressTemp <= AddressTemp - 1;
						  WriteEnable <= "0";
					 else 
					     fsm_state <= fsm_state;
						  WriteEnable <= "0";
					 end if;
		      when S3 => 
				    if (Push = '1' AND Pop = '0' AND AddressTemp = 9) then
						  fsm_state <= S4;
		              AlmostFull <= '0';
						  Full <= '1';
		              AddressTemp <= AddressTemp + 1;
		              WriteEnable <= "1";
				    elsif (Push = '1' AND Pop = '0' AND AddressTemp < 9) then
					     fsm_state <= fsm_state;
						  AddressTemp <= AddressTemp + 1;
						  WriteEnable <= "1";
				    elsif (Push = '0' AND Pop = '1' AND AddressTemp = 7) then
						  fsm_state <= S2;
		              AlmostFull <= '0';
		              AddressTemp <= AddressTemp - 1;
		              WriteEnable <= "0";
				    elsif (Push = '0' AND Pop = '1' AND AddressTemp > 7) then
					     fsm_state <= fsm_state;
						  AddressTemp <= AddressTemp - 1;
						  WriteEnable <= "0";
					 else 
					     fsm_state <= fsm_state;
						  WriteEnable <= "0";
					 end if;		
		      when S4 => 
				    if (Push = '0' AND Pop = '1') then
						  fsm_state <= S3;
		              AlmostFull <= '1';
						  Full <= '0';
		              AddressTemp <= AddressTemp - 1;
		              WriteEnable <= "0";
					 else 
					     fsm_state <= fsm_state;
						  WriteEnable <= "0";
					 end if;					 
		      when others =>                                     			
				    fsm_state <= S0;                               
					 Empty <= '1';                                	
		          AlmostEmpty <= '0';
		          AlmostFull <= '0';
		          Full <= '0';
		          AddressTemp <= "0000";
		          WriteEnable <= "0";					 
	     end case;
	 end if;

	 end process;	 

	 Address <= AddressTemp;

end Behavioral;
