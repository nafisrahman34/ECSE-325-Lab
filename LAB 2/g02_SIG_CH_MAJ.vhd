--
-- entity name: g02_SIG_CH_MAJ (replace “NN” by your group’s number)
--
-- Version 1.0
-- Authors: Thomas Dormart, Nafis Rahman, Mohammad Junaid
-- Date: March 11, 2024 (enter the date of the latest edit to the file)


library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity g02_SIG_CH_MAJ is
    port (
        A_o, B_o, C_o, E_o, F_o, G_o : in std_logic_vector(31 downto 0);
        SIG0, SIG1, CH, MAJ : out std_logic_vector(31 downto 0)
    );
end g02_SIG_CH_MAJ;

architecture implementation of g02_SIG_CH_MAJ is
begin
    SIG_0 : process (A_o)
    begin
        SIG0 <= (std_logic_vector(rotate_right(unsigned(A_o), 2)) xor std_logic_vector(rotate_right(unsigned(A_o), 13))) xor (std_logic_vector(rotate_right(unsigned(A_o), 22)));
    end process;

    SIG_1 : process (E_o)
    begin
        SIG1 <= (std_logic_vector(rotate_right(unsigned(E_o), 6)) xor std_logic_vector(rotate_right(unsigned(E_o), 11))) xor (std_logic_vector(rotate_right(unsigned(E_o), 25)));
    end process;

    CH_FUNC : process (E_o, F_o, G_o)
    begin
        CH <= (F_o AND E_o) xor (NOT E_o AND G_o); 
    end process;

    MAJ_FUNC : process (A_o, B_o, C_o)
    begin
        MAJ <= ((A_o AND B_o) xor (B_o AND C_o)) xor (C_o AND A_o); 
    end process;

end implementation;