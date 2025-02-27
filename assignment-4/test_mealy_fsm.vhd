--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:24:28 05/09/2021
-- Design Name:   
-- Module Name:   C:/Users/georg/xilinx-workspace/lab4/test_mealy_fsm.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mealy_fsm
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
 
ENTITY test_mealy_fsm IS
END test_mealy_fsm;
 
ARCHITECTURE behavior OF test_mealy_fsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mealy_fsm
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         Control : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Control : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mealy_fsm PORT MAP (
          Clk => Clk,
          Rst => Rst,
          A => A,
          B => B,
          Control => Control
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

      Rst <= '0';
      A <= '1';
      B <= '0';			
      wait for Clk_period*5;	
		
		Rst <= '1';
      wait for Clk_period*10;
		
      Rst <= '0';
      A <= '0';
      B <= '1';			
      wait for Clk_period*5;
		
		Rst <= '1';
      wait for Clk_period*10;

      Rst <= '0';
		A <= '0';
      B <= '0';
		wait for Clk_period;
		
      A <= '1';
      B <= '1';
      wait for Clk_period;
		
		A <= '1';
      B <= '0';
		wait for Clk_period;
		
      A <= '0';
      B <= '0';
      wait for Clk_period;
      
      A <= '1';
      B <= '1';
      wait for Clk_period;
		
		A <= '1';
      B <= '0';
		wait for Clk_period;
		
      A <= '0';
      B <= '0';
      wait for Clk_period;
      
      A <= '1';
      B <= '1';
      wait for Clk_period;
		
		A <= '1';
      B <= '0';
		wait for Clk_period;
		
      A <= '0';
      B <= '0';
      wait for Clk_period;
      
      A <= '1';
      B <= '1';
      wait for Clk_period;
		
		A <= '1';
      B <= '0';
		wait for Clk_period;
		
      A <= '0';
      B <= '0';
      wait for Clk_period;
      
      A <= '1';
      B <= '1';
      wait for Clk_period;
		
		Rst <= '1';
      wait for Clk_period*10;
      		
      -- insert stimulus here 
      wait;
   end process;

END;
