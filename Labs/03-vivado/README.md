# Lab 03 - Vivado

**[GitHub repository](https://github.com/mkousal/Digital-electronics-1)**

## Table with connections
### Our used connection
| **Port** | **Connected to** | **FPGA pin** |
| :-: | :-: | :-: |
| a_i[0] | SW[0] |  J15 |
| a_i[1] | SW[1] | L16 |
| b_i[0] | SW[2] | M13 |
| b_i[1] | SW[3] | R15 |
| c_i[0] | SW[4] | R17 |
| c_i[1] | SW[5] | T18 |
| d_i[0] | SW[6] | U18 |
| d_i[1] | SW[7] | R13 |
| sel_i[0] | SW[14] | U11 |
| sel_i[1] | SW[15] | V10 |
| f_o[0] | LED[0] | H17 |
| f_o[1] | LED[1] | K15 |

### Development board connection
| **Name** | **FPGA pin** | **FPGA package pin name** |
| :-: | :-: | :-: |
| SW[0] | IO_L24N_T3_RS0_15 |  J15 |
| SW[1] | IO_L3N_T0_DQS_EMCCLK_14 |  L16 |
| SW[2] | IO_L6N_T0_D08_VREF_14 |  M13 |
| SW[3] | IO_L13N_T2_MRCC_14 |  R15 |
| SW[4] | IO_L12N_T1_MRCC_14 |  R17 |
| SW[5] | IO_L7N_T1_D10_14 |  T18 |
| SW[6] | IO_L17N_T2_A13_D29_14 |  U18 |
| SW[7] | IO_L5N_T0_D07_14 |  R13 |
| SW[8] | IO_L24N_T3_34 |  T8 |
| SW[9] | IO_25_34 |  U8 |
| SW[10] | IO_L15P_T2_DQS_RDWR_B_14 |  R16 |
| SW[11] | IO_L23P_T3_A03_D19_14 |  T13 |
| SW[12] | IO_L24P_T3_35 |  H6 |
| SW[13] | IO_L20P_T3_A08_D24_14 |  U12 |
| SW[14] | IO_L19N_T3_A09_D25_VREF_14 |  U11 |
| SW[15] | IO_L21P_T3_DQS_14 |  V10 |

| **Name** | **FPGA pin** | **FPGA package pin name** |
| :-: | :-: | :-: |
| LED[0] | IO_L18P_T2_A24_15 |  H17 |
| LED[1] | IO_L24P_T3_RS1_15 |  K15 |
| LED[2] | IO_L17N_T2_A25_15 |  J13 |
| LED[3] | IO_L8P_T1_D11_14 |  N14 |
| LED[4] | IO_L7P_T1_D09_14 |  R18 |
| LED[5] | IO_L18N_T2_A11_D27_14 |  V17 |
| LED[6] | IO_L17P_T2_A14_D30_14 |  U17 |
| LED[7] | IO_L18P_T2_A12_D28_14 |  U16 |
| LED[8] | IO_L16N_T2_A15_D31_14 |  V16 |
| LED[9] | IO_L14N_T2_SRCC_14 |  T15 |
| LED[10] | IO_L22P_T3_A05_D21_14 |  U14 |
| LED[11] | IO_L15N_T2_DQS_DOUT_CSO_B_14 |  T16 |
| LED[12] | IO_L16P_T2_CSI_B_14 |  V15 |
| LED[13] | IO_L22N_T3_A04_D20_14 |  V14 |
| LED[14] | IO_L20N_T3_A07_D23_14 |  V12 |
| LED[15] | IO_L21N_T3_DQS_A06_D22_14 |  V11 |

## 2-bit wide 4-to-1 multiplexer
### VHDL architecture
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin
    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i; 

end architecture Behavioral;
```
### Testbench file
```vhdl
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_mux_2bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_2bit_4to1;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_mux_2bit_4to1 is

    -- Local signals
    signal s_a       : std_logic_vector(2 - 1 downto 0);
    signal s_b       : std_logic_vector(2 - 1 downto 0);
    signal s_c       : std_logic_vector(2 - 1 downto 0);
    signal s_d       : std_logic_vector(2 - 1 downto 0);
    signal s_sel     : std_logic_vector(2 - 1 downto 0);
    
    signal s_f       : std_logic_vector(2 - 1 downto 0);

begin
    -- Connecting testbench signals with mux_2bit_4to1 entity (Unit Under Test)
    uut_mux_2bit_4to1 : entity work.mux_2bit_4to1
        port map(
            a_i   => s_a,
            b_i   => s_b,
            c_i   => s_c,
            d_i   => s_d,
            sel_i => s_sel,
            f_o   => s_f

        );
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_d <= "00";s_c <= "00";s_b <= "00";s_a <= "00";s_sel <= "00";wait for 100 ns;
        s_d <= "01";s_c <= "10";s_b <= "01";s_a <= "00";s_sel <= "10";wait for 100 ns;
        s_d <= "00";s_c <= "00";s_b <= "00";s_a <= "00";s_sel <= "01";wait for 100 ns;
        s_d <= "11";s_c <= "10";s_b <= "01";s_a <= "00";s_sel <= "11";wait for 100 ns;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
```

### Waveform from testbench simulation
![waveform](img/01.png)

## Vivado tutorial
### Project creation
1. Open "**Vivado 2020.2**" (or your installed version)  

2. "**File**" -> "**Project**" -> "**New...**"  

3. It will open you wizard for creating new project  
![](img/tutorial/01.png)

4. Select your project name and project location  
![](img/tutorial/02.png)

5. Select project type (we are using "**RTL Project**")  
![](img/tutorial/03.png)

6. Now select "**Target language**" and "**Simulator language**" as "**VHDL**"  
![](img/tutorial/04.png)

7. Skip this windows with "**Next**" button  
![](img/tutorial/05.png)

8. In this window get into board selection  
![](img/tutorial/06.png)

9. Choose "**Nexys A7-50T**"  
![](img/tutorial/07.png)

10. Now you will see project summary. Finish with clicking at "**Finish**" button  
![](img/tutorial/08.png)

### Adding source file
1. Open your project  

2. "**File**" -> "**Add Sources...**"  

3. It will open you new wizard. Select "**Add or create design sources**"  
![](img/tutorial/10.png)

4. Now add source file with "**Create File**" button  
![](img/tutorial/11.png)

5. Select "**VHDL**" file type and type in filename  
![](img/tutorial/12.png)

6. Now you can overview all created files  
![](img/tutorial/13.png)

7. Here you can define real connection with FPGA pins  
![](img/tutorial/14.png)

### Adding testbench file
1. Open your project  

2. "**File**" -> "**Add Sources...**"  

3. It will open you new wizard. Select "**Add or create simulation sources**"  
![](img/tutorial/20.png)

4. Now add source file with "**Create file**" button  
![](img/tutorial/21.png)

5. Select "**VHDL**" file type and type in filename  
![](img/tutorial/22.png)

6. Now you can overview all created files  
![](img/tutorial/23.png)

7. Here you can define real connection with FPGA pins  
![](img/tutorial/24.png)

### Adding constraints (XDC) file
1. Open your project  

2. "**File**" -> "**Add Sources...**"  

3. It will open you new wizard. Select "**Add or create constraints**"  
![](img/tutorial/30.png)

4. Now add source file with "**Create file**" button  
![](img/tutorial/31.png)

5. Select file type as "**XDC**" and type in file name (in this case same as board name)  
![](img/tutorial/32.png)

6. Now you can overview all created files  
![](img/tutorial/33.png)

7. Now in main window open this created file and type pin definition in editor window. You can also copy .xdc file from board manafacturer  
![](img/tutorial/34.png)

### Running simulation
1. Open your project

2. If you have setup design sources and testbench files, you can run simulation
![](img/tutorial/40.png)