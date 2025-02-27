--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:58:46 03/24/2021
-- Design Name:   
-- Module Name:   C:/Users/georg/xilinx-workspace/lab2/test_cla_4bit.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cla_4bit
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
 
ENTITY test_cla_4bit IS
END test_cla_4bit;
 
ARCHITECTURE behavior OF test_cla_4bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cla_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cla_4bit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
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
		A <= "0000";
		B <= "0000";
      Cin <= '0';
      wait for 100 ns;

		A <= "0000";
		B <= "0000";
      Cin <= '1';
      wait for 100 ns;
		
		A <= "0000";
		B <= "1111";
      Cin <= '0';
      wait for 100 ns;
		
		A <= "0000";
		B <= "1111";
      Cin <= '1';
      wait for 100 ns;
		
		A <= "1111";
		B <= "0000";
      Cin <= '0';
      wait for 100 ns;
		
		A <= "1111";
		B <= "0000";
      Cin <= '1';
      wait for 100 ns;
		
		A <= "1111";
		B <= "1111";
      Cin <= '0';
      wait for 100 ns;
		
		A <= "1111";
		B <= "1111";
      Cin <= '1';
      wait for 100 ns;
      		
      -- insert stimulus here 
      wait;
   end process;

END;
