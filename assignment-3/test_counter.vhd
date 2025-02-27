--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:38:37 04/17/2021
-- Design Name:   
-- Module Name:   C:/Users/georg/xilinx-workspace/lab3/test_counter.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_counter IS
END test_counter;
 
ARCHITECTURE behavior OF test_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Control : IN  std_logic_vector(2 downto 0);
         Count : OUT  std_logic_vector(7 downto 0);
         Overflow : OUT  std_logic;
         Underflow : OUT  std_logic;
         Valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Control : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Count : std_logic_vector(7 downto 0);
   signal Overflow : std_logic;
   signal Underflow : std_logic;
   signal Valid : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Control => Control,
          Count => Count,
          Overflow => Overflow,
          Underflow => Underflow,
          Valid => Valid
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

		Rst <= '1';	                                               -- Hold Rst activated for 10 cycles (10*10ns=100ns)
      wait for Clk_period*10;
		
		Rst <= '0';                                                -- Check if the output signal Overflow is working and if the counter stops
		Control <= "111";
		wait for Clk_period*21;                                    -- 12*21=252
		Control <= "100";
		wait for Clk_period*12;                                    -- 252+(2*2)=256>255 with 10 additional cycles
		
		Rst <= '1';	                                               -- Check if after activating Rst the counter returns to 0
      wait for Clk_period*10;
		
		Rst <= '0';                                                -- Check if the output signal Underflow is working and if the counter stops
		Control <= "111";
		wait for Clk_period;                                       -- 12
		Control <= "000";
		wait for Clk_period*13;                                    -- 12-(5*3)=-3<0 with 10 additional cycles
		
		Rst <= '1';	
      wait for Clk_period*10;
		
		Rst <= '0';                                                -- Check if all the counter steps are working and if they can be changed from cycle to cycle
		Control <= "010";
		wait for Clk_period;                                       -- 0
		Control <= "011";
		wait for Clk_period;                                       -- 1+0=1
		Control <= "100";                       
		wait for Clk_period;                                       -- 2+1=3
		Control <= "101";
		wait for Clk_period;                                       -- 5+3=8
		Control <= "110";                                    
		wait for Clk_period;                                       -- 6+8=14
		Control <= "111";
		wait for Clk_period;                                       -- 12+14=26
		Control <= "000";
		wait for Clk_period;                                       -- -5+26=21
		Control <= "001";
		wait for Clk_period;                                       -- -2+21=19
		
		Rst <= '1';	
      wait for Clk_period*10;

      -- insert stimulus here 
      wait;
   end process;

END;
