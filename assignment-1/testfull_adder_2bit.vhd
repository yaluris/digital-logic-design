--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:21:58 03/13/2021
-- Design Name:   
-- Module Name:   C:/Users/georg/xilinx-workspace/lab1b/testfull_adder_2bit.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder_2bit
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
 
ENTITY testfull_adder_2bit IS
END testfull_adder_2bit;
 
ARCHITECTURE behavior OF testfull_adder_2bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder_2bit
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         B : IN  std_logic_vector(1 downto 0);
         Cin : IN  std_logic;
         RESULT : OUT  std_logic_vector(1 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal RESULT : std_logic_vector(1 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder_2bit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          RESULT => RESULT,
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
		A <= "00";
		B <= "00";
      Cin <= '0';			
      wait for 100 ns;
      
      A <= "01";
		B <= "00";
      Cin <= '0';			
      wait for 100 ns;		

      A <= "10";
		B <= "00";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "11";
		B <= "00";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "00";
		B <= "01";
      Cin <= '0';			
      wait for 100 ns;
      
      A <= "01";
		B <= "01";
      Cin <= '0';			
      wait for 100 ns;		

      A <= "10";
		B <= "01";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "11";
		B <= "01";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "00";
		B <= "10";
      Cin <= '0';			
      wait for 100 ns;
      
      A <= "01";
		B <= "10";
      Cin <= '0';			
      wait for 100 ns;		

      A <= "10";
		B <= "10";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "11";
		B <= "10";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "00";
		B <= "11";
      Cin <= '0';			
      wait for 100 ns;
      
      A <= "01";
		B <= "11";
      Cin <= '0';			
      wait for 100 ns;		

      A <= "10";
		B <= "11";
      Cin <= '0';			
      wait for 100 ns;
		
		A <= "11";
		B <= "11";
      Cin <= '0';			
      wait for 100 ns;
			
		A <= "00";
		B <= "00";
      Cin <= '1';			
      wait for 100 ns;
      
      A <= "01";
		B <= "00";
      Cin <= '1';			
      wait for 100 ns;		

      A <= "10";
		B <= "00";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "11";
		B <= "00";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "00";
		B <= "01";
      Cin <= '1';			
      wait for 100 ns;
      
      A <= "01";
		B <= "01";
      Cin <= '1';			
      wait for 100 ns;		

      A <= "10";
		B <= "01";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "11";
		B <= "01";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "00";
		B <= "10";
      Cin <= '1';			
      wait for 100 ns;
      
      A <= "01";
		B <= "10";
      Cin <= '1';			
      wait for 100 ns;		

      A <= "10";
		B <= "10";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "11";
		B <= "10";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "00";
		B <= "11";
      Cin <= '1';			
      wait for 100 ns;
      
      A <= "01";
		B <= "11";
      Cin <= '1';			
      wait for 100 ns;		

      A <= "10";
		B <= "11";
      Cin <= '1';			
      wait for 100 ns;
		
		A <= "11";
		B <= "11";
      Cin <= '1';			
      wait for 100 ns;
		
      -- insert stimulus here 

      wait;
   end process;

END;
