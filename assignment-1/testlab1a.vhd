--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:49:19 03/11/2021
-- Design Name:   
-- Module Name:   C:/Users/georg/xilinx-workspace/lab1a/testlab1a.vhd
-- Project Name:  lab1a
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab1a
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
 
ENTITY testlab1a IS
END testlab1a;
 
ARCHITECTURE behavior OF testlab1a IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab1a
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C0 : IN  std_logic;
         C1 : IN  std_logic;
         C2 : IN  std_logic;
         C3 : IN  std_logic;
         C4 : IN  std_logic;
         C5 : IN  std_logic;
         RESULT : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C0 : std_logic := '0';
   signal C1 : std_logic := '0';
   signal C2 : std_logic := '0';
   signal C3 : std_logic := '0';
   signal C4 : std_logic := '0';
   signal C5 : std_logic := '0';

 	--Outputs
   signal RESULT : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab1a PORT MAP (
          A => A,
          B => B,
          C0 => C0,
          C1 => C1,
          C2 => C2,
          C3 => C3,
          C4 => C4,
          C5 => C5,
          RESULT => RESULT
        );

   -- Clock process definitions
-- <clock>_process :process
-- begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
-- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		A <= '0';
		B <= '0';
		C0 <= '0';
		C1 <= '0';
		C2 <= '0';
		C3 <= '0';
		C4 <= '0';
		C5 <= '0';
      wait for 100 ns;
		
		A <= '0';
		B <= '1';
		C0 <= '0';
		C1 <= '0';
		C2 <= '0';
		C3 <= '0';
		C4 <= '0';
		C5 <= '0';
      wait for 100 ns;
		
		A <= '1';
		B <= '0';
		C0 <= '0';
		C1 <= '0';
		C2 <= '0';
		C3 <= '0';
		C4 <= '0';
		C5 <= '0';
      wait for 100 ns;

		A <= '1';
		B <= '1';
		C0 <= '0';
		C1 <= '0';
		C2 <= '0';
		C3 <= '0';
		C4 <= '0';
		C5 <= '0';
      wait for 100 ns;
		
		A <= '0';
		B <= '0';
		C0 <= '1';
		C1 <= '1';
		C2 <= '1';
		C3 <= '1';
		C4 <= '1';
		C5 <= '1';
      wait for 100 ns;
		
		A <= '0';
		B <= '1';
		C0 <= '1';
		C1 <= '1';
		C2 <= '1';
		C3 <= '1';
		C4 <= '1';
		C5 <= '1';
      wait for 100 ns;
		
		A <= '1';
		B <= '0';
		C0 <= '1';
		C1 <= '1';
		C2 <= '1';
		C3 <= '1';
		C4 <= '1';
		C5 <= '1';
      wait for 100 ns;
		
		A <= '1';
		B <= '1';
		C0 <= '1';
		C1 <= '1';
		C2 <= '1';
		C3 <= '1';
		C4 <= '1';
		C5 <= '1';
      wait for 100 ns;
			
      -- insert stimulus here 
      wait;
   end process;

END;
