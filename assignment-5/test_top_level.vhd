--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:25:25 05/23/2021
-- Design Name:   
-- Module Name:   C:/Users/georg/xilinx-workspace/lab5/test_top_level.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_level
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
 
ENTITY test_top_level IS
END test_top_level;
 
ARCHITECTURE behavior OF test_top_level IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_level
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         NumberIn : IN  std_logic_vector(3 downto 0);
         NumberOut : OUT  std_logic_vector(3 downto 0);
         Empty : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic;
         Full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal NumberIn : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal NumberOut : std_logic_vector(3 downto 0);
   signal Empty : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;
   signal Full : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_level PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Push => Push,
          Pop => Pop,
          NumberIn => NumberIn,
          NumberOut => NumberOut,
          Empty => Empty,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull,
          Full => Full
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

		Rst <= '1';
      wait for Clk_period*10;

      Rst <= '0';
		Push <= '0'; 
		Pop <= '1';
      wait for Clk_period;	
			
		Push <= '1';
		Pop <= '0';
		NumberIn <= "0001";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;	
		
		Push <= '1';
		NumberIn <= "0010";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;		
		
		Push <= '1';
		NumberIn <= "0011";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;

		Push <= '1';
		NumberIn <= "0100";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;

		Push <= '1';
		NumberIn <= "0101";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;

		Push <= '1';
		NumberIn <= "0110";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;		
		
		Push <= '1';
		NumberIn <= "0111";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;	
		
		Push <= '1';
		NumberIn <= "1000";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;	
		
		Push <= '1';
		NumberIn <= "1001";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;	
		
		Push <= '1';
		NumberIn <= "1010";
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;	
		
		Push <= '1';
		NumberIn <= "1011";                                       
      wait for Clk_period;
		
		Push <= '0';
      wait for Clk_period*5;
		
		Pop <= '1';
      wait for Clk_period;
		
		Pop <= '0';
      wait for Clk_period*5;	
		
		Pop <= '1';
      wait for Clk_period;
		
		Pop <= '0';
      wait for Clk_period*5;
		
		Push <= '1';
		Pop <= '1';
      wait for Clk_period;
                               
      -- insert stimulus here 
      wait;
   end process;

END;
