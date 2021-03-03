----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 14:50:53
-- Design Name: 
-- Module Name: tb_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is     
           
end tb_top;

architecture Behavioral of tb_top is
    signal s_SW_i  : STD_LOGIC_VECTOR (3 downto 0);  
    signal s_LED_o : STD_LOGIC_VECTOR (7 downto 0); 
    signal s_CA_o  : STD_LOGIC;                     
    signal s_CB_o  : STD_LOGIC;                     
    signal s_CC_o  : STD_LOGIC;                     
    signal s_CD_o  : STD_LOGIC;                     
    signal s_CE_o  : STD_LOGIC;                     
    signal s_CF_o  : STD_LOGIC;                     
    signal s_CG_o  : STD_LOGIC;                     
    signal s_AN_o  : STD_LOGIC_VECTOR (7 downto 0);
begin
    uut_top : entity work.top
        port map (
            SW => s_SW_i,
            LED => s_LED_o,
            CA => s_CA_o,
            CB => s_CB_o,
            CC => s_CC_o,
            CD => s_CD_o,
            CE => s_CE_o,
            CF => s_CF_o,
            CG => s_CG_o,
            AN => s_AN_o
        );
    
    p_stimulus : process
    begin
        report "Simulation started" severity note;
        
        s_SW_i <= "0000"; wait for 100 ns;
        s_SW_i <= "0001"; wait for 100 ns;
        s_SW_i <= "0010"; wait for 100 ns;
        s_SW_i <= "0011"; wait for 100 ns;
        s_SW_i <= "0100"; wait for 100 ns;
        s_SW_i <= "0101"; wait for 100 ns;
        s_SW_i <= "0110"; wait for 100 ns;
        s_SW_i <= "0111"; wait for 100 ns;
        s_SW_i <= "1000"; wait for 100 ns;
        s_SW_i <= "1001"; wait for 100 ns;
        s_SW_i <= "1010"; wait for 100 ns;
        s_SW_i <= "1011"; wait for 100 ns;
        s_SW_i <= "1100"; wait for 100 ns;
        s_SW_i <= "1101"; wait for 100 ns;
        s_SW_i <= "1110"; wait for 100 ns;
        s_SW_i <= "1111"; wait for 100 ns;
                
        report "Simulation end" severity note;
        wait;
    end process p_stimulus;
end Behavioral;
