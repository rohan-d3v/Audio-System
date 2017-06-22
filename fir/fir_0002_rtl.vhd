-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 15.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2015 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_0002_rtl
-- VHDL created on Thu Dec 15 15:44:48 2016


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(7 downto 0);  -- sfix8
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(21 downto 0);  -- sfix22
        clk : in std_logic;
        areset : in std_logic
    );
end fir_0002_rtl;

architecture normal of fir_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_sc : SIGNED (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_eq : std_logic;
    signal u0_m0_wo0_wi0_ra0_count1_lutreg_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_a : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_o : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_wa0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_wa0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_delayr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr0_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_delayr0_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_delayr0_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_delayr0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_ca0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_ca0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_ca0_eq : std_logic;
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_pr : SIGNED (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_lut_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_resize_in : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_resize_b : STD_LOGIC_VECTOR (5 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_delRdAddr0_q : STD_LOGIC_VECTOR (5 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- xIn(PORTIN,2)@10

    -- u0_m0_wo0_run(ENABLEGENERATOR,7)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(6 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(35, 7);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(6) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-36);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(6 downto 6));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q and VCC_q;

    -- u0_m0_wo0_memread(DELAY,8)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,9)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_14(DELAY,34)@12
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,22)@14
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "00000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 36;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_15(DELAY,35)@14
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_14_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_ra0_count1(COUNTER,11)@12
    -- every=1, low=0, high=36, step=1, init=1
    u0_m0_wo0_wi0_ra0_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count1_i <= TO_UNSIGNED(1, 6);
            u0_m0_wo0_wi0_ra0_count1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra0_count1_i = TO_UNSIGNED(35, 6)) THEN
                    u0_m0_wo0_wi0_ra0_count1_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_ra0_count1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_ra0_count1_eq = '1') THEN
                    u0_m0_wo0_wi0_ra0_count1_i <= u0_m0_wo0_wi0_ra0_count1_i - 36;
                ELSE
                    u0_m0_wo0_wi0_ra0_count1_i <= u0_m0_wo0_wi0_ra0_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count1_i, 6)));

    -- u0_m0_wo0_wi0_ra0_count1_lut(LOOKUP,12)@12
    u0_m0_wo0_wi0_ra0_count1_lut: PROCESS (u0_m0_wo0_wi0_ra0_count1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_ra0_count1_q) IS
            WHEN "000000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0100101";
            WHEN "000001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0100110";
            WHEN "000010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0100111";
            WHEN "000011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101000";
            WHEN "000100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101001";
            WHEN "000101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101010";
            WHEN "000110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101011";
            WHEN "000111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101100";
            WHEN "001000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101101";
            WHEN "001001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101110";
            WHEN "001010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0101111";
            WHEN "001011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110000";
            WHEN "001100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110001";
            WHEN "001101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110010";
            WHEN "001110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110011";
            WHEN "001111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110100";
            WHEN "010000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110101";
            WHEN "010001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110110";
            WHEN "010010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0110111";
            WHEN "010011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111000";
            WHEN "010100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111001";
            WHEN "010101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111010";
            WHEN "010110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111011";
            WHEN "010111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111100";
            WHEN "011000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111101";
            WHEN "011001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111110";
            WHEN "011010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0111111";
            WHEN "011011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000000";
            WHEN "011100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000001";
            WHEN "011101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000010";
            WHEN "011110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000011";
            WHEN "011111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000100";
            WHEN "100000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000101";
            WHEN "100001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000110";
            WHEN "100010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0000111";
            WHEN "100011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0001000";
            WHEN "100100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "0001001";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_ra0_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_ra0_count1_lutreg(REG,13)@12
    u0_m0_wo0_wi0_ra0_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count1_lutreg_q <= "0100101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_ra0_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_ra0_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_ra0_count0(COUNTER,10)@12
    -- every=37, low=0, high=63, step=1, init=0
    u0_m0_wo0_wi0_ra0_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count0_i <= TO_UNSIGNED(0, 6);
            u0_m0_wo0_wi0_ra0_count0_sc <= TO_SIGNED(35, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra0_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_ra0_count0_sc <= u0_m0_wo0_wi0_ra0_count0_sc - (-36);
                ELSE
                    u0_m0_wo0_wi0_ra0_count0_sc <= u0_m0_wo0_wi0_ra0_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_ra0_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_ra0_count0_i <= u0_m0_wo0_wi0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count0_i, 7)));

    -- u0_m0_wo0_wi0_ra0_add_0_0(ADD,14)@12
    u0_m0_wo0_wi0_ra0_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra0_count0_q);
    u0_m0_wo0_wi0_ra0_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra0_count1_lutreg_q);
    u0_m0_wo0_wi0_ra0_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_ra0_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_ra0_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_ra0_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_add_0_0_q <= u0_m0_wo0_wi0_ra0_add_0_0_o(7 downto 0);

    -- u0_m0_wo0_wi0_ra0_resize(BITSELECT,15)@13
    u0_m0_wo0_wi0_ra0_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_ra0_add_0_0_q(5 downto 0));
    u0_m0_wo0_wi0_ra0_resize_b <= u0_m0_wo0_wi0_ra0_resize_in(5 downto 0);

    -- u0_m0_wo0_wi0_delRdAddr0(DELAY,18)@13
    u0_m0_wo0_wi0_delRdAddr0_q <= u0_m0_wo0_wi0_ra0_resize_b;

    -- d_xIn_0_13(DELAY,32)@10
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,33)@10
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_wa0(COUNTER,16)@13
    -- every=1, low=0, high=63, step=1, init=9
    u0_m0_wo0_wi0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa0_i <= TO_UNSIGNED(9, 6);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_wa0_i <= u0_m0_wo0_wi0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa0_i, 6)));

    -- u0_m0_wo0_wi0_delayr0(DUALMEM,17)@13
    u0_m0_wo0_wi0_delayr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_delayr0_aa <= u0_m0_wo0_wi0_wa0_q;
    u0_m0_wo0_wi0_delayr0_ab <= u0_m0_wo0_wi0_delRdAddr0_q;
    u0_m0_wo0_wi0_delayr0_reset0 <= areset;
    u0_m0_wo0_wi0_delayr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 64,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 64,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_delayr0_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_delayr0_aa,
        data_a => u0_m0_wo0_wi0_delayr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_delayr0_ab,
        q_b => u0_m0_wo0_wi0_delayr0_iq
    );
    u0_m0_wo0_wi0_delayr0_q <= u0_m0_wo0_wi0_delayr0_iq(7 downto 0);

    -- u0_m0_wo0_ca0(COUNTER,19)@12
    -- every=1, low=0, high=36, step=1, init=0
    u0_m0_wo0_ca0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca0_i <= TO_UNSIGNED(0, 6);
            u0_m0_wo0_ca0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca0_i = TO_UNSIGNED(35, 6)) THEN
                    u0_m0_wo0_ca0_eq <= '1';
                ELSE
                    u0_m0_wo0_ca0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca0_eq = '1') THEN
                    u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i - 36;
                ELSE
                    u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca0_i, 6)));

    -- u0_m0_wo0_cm0(LOOKUP,20)@12
    u0_m0_wo0_cm0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "00001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca0_q) IS
                WHEN "000000" => u0_m0_wo0_cm0_q <= "00001000";
                WHEN "000001" => u0_m0_wo0_cm0_q <= "00000110";
                WHEN "000010" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "000011" => u0_m0_wo0_cm0_q <= "11111001";
                WHEN "000100" => u0_m0_wo0_cm0_q <= "11110101";
                WHEN "000101" => u0_m0_wo0_cm0_q <= "11111000";
                WHEN "000110" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "000111" => u0_m0_wo0_cm0_q <= "00001010";
                WHEN "001000" => u0_m0_wo0_cm0_q <= "00010000";
                WHEN "001001" => u0_m0_wo0_cm0_q <= "00001100";
                WHEN "001010" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "001011" => u0_m0_wo0_cm0_q <= "11110000";
                WHEN "001100" => u0_m0_wo0_cm0_q <= "11100110";
                WHEN "001101" => u0_m0_wo0_cm0_q <= "11101010";
                WHEN "001110" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "001111" => u0_m0_wo0_cm0_q <= "00100110";
                WHEN "010000" => u0_m0_wo0_cm0_q <= "01010000";
                WHEN "010001" => u0_m0_wo0_cm0_q <= "01110010";
                WHEN "010010" => u0_m0_wo0_cm0_q <= "01111111";
                WHEN "010011" => u0_m0_wo0_cm0_q <= "01110010";
                WHEN "010100" => u0_m0_wo0_cm0_q <= "01010000";
                WHEN "010101" => u0_m0_wo0_cm0_q <= "00100110";
                WHEN "010110" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "010111" => u0_m0_wo0_cm0_q <= "11101010";
                WHEN "011000" => u0_m0_wo0_cm0_q <= "11100110";
                WHEN "011001" => u0_m0_wo0_cm0_q <= "11110000";
                WHEN "011010" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "011011" => u0_m0_wo0_cm0_q <= "00001100";
                WHEN "011100" => u0_m0_wo0_cm0_q <= "00010000";
                WHEN "011101" => u0_m0_wo0_cm0_q <= "00001010";
                WHEN "011110" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "011111" => u0_m0_wo0_cm0_q <= "11111000";
                WHEN "100000" => u0_m0_wo0_cm0_q <= "11110101";
                WHEN "100001" => u0_m0_wo0_cm0_q <= "11111001";
                WHEN "100010" => u0_m0_wo0_cm0_q <= "00000000";
                WHEN "100011" => u0_m0_wo0_cm0_q <= "00000110";
                WHEN "100100" => u0_m0_wo0_cm0_q <= "00001000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0(MULT,21)@13
    u0_m0_wo0_mtree_mult1_0_pr <= SIGNED(SIGNED(u0_m0_wo0_mtree_mult1_0_a0) * SIGNED(u0_m0_wo0_mtree_mult1_0_b0));
    u0_m0_wo0_mtree_mult1_0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_a0 <= (others => '0');
            u0_m0_wo0_mtree_mult1_0_b0 <= (others => '0');
            u0_m0_wo0_mtree_mult1_0_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
            u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_delayr0_q);
            u0_m0_wo0_mtree_mult1_0_s1 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_pr);
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_accum(ADD,23)@15
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_mtree_mult1_0_q(15)) & u0_m0_wo0_mtree_mult1_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_15_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(21 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,24)@14
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00100100";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "00000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 36;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,25)@15
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_15_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

    -- u0_m0_wo0_oseq_gated_reg(REG,26)@15
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,28)@16
    out0_m0_wo0_lineup_select_delay_0_q <= u0_m0_wo0_oseq_gated_reg_q;

    -- xOut(PORTOUT,31)@16
    xOut_v <= out0_m0_wo0_lineup_select_delay_0_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
