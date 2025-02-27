----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:33:37 03/23/2021 
-- Design Name: 
-- Module Name:    cla_4bit - Behavioral 
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

entity cla_4bit is                                               -- Entity implementation
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);                -- I/O Signal declarations
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end cla_4bit;

architecture Behavioral of cla_4bit is                           -- Architecture implementation

    COMPONENT generate_propagate_unit                            -- Component declarations
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(3 downto 0);
         G : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    COMPONENT carry_unit
    PORT(
         P : IN  std_logic_vector(3 downto 0);               
         G : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         C : OUT  std_logic_vector(2 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
	 
    COMPONENT sum_unit
    PORT(
         P : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(2 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0)     
        );
    END COMPONENT;
	 
signal Prop, Gen: std_logic_vector(3 downto 0);                  -- Signal declarations
signal Cla: std_logic_vector(2 downto 0);

begin

GPU: generate_propagate_unit
    port map ( A => A,
	            B => B,
					P => Prop,
					G => Gen);

CU: carry_unit
    port map ( P => Prop,                                        -- Use the Propagate and Generate signals as inputs for the carry_unit
	            G => Gen,
					Cin => Cin,
					C => Cla,
					Cout => Cout); 

SU: sum_unit
    port map ( P => Prop,                                        -- Use the Propagate and Carry Look Ahead signals as inputs for the sum_unit
	            C => Cla,
					Cin => Cin,
					S => S);

end Behavioral;
