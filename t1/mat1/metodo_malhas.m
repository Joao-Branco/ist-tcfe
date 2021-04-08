clear all
close all
warning('off', 'all');


clc

pkg load symbolic

Id = 1.04562966374e-3
R1 = 1.03246207994e3
R2 = 2.00407938458e3
R3 = 3.09992724929e3
R4 = 4.11959743399e3
R5 = 3.13664760831e3
R6 = 2.00274902802e3
R7=1.04584791445e3
Va = 5.21005945917
Kb = 7.02164593403e-3
Kc = 8.21039470748e3



syms J_a
syms J_b
syms J_c
syms J_d


eq_1 = J_a * R1 + Va + R4 * (J_a - J_c) + R3 * (J_a -J_b) == 0
eq_2 = J_b == Kb * R3 * (J_b - J_a)
eq_3 = J_c * R7 - Kc * J_c + R4 * (J_c -J_a) + R6 * J_c == 0
eq_4 = J_d == Id




S = solve( eq_1, eq_2, eq_3, eq_4, J_a, J_b, J_c, J_d)

printf("SolveMalhas_TAB\n")
SolveJa = double(S.J_a)
SolveJb = double(S.J_b)
SolveJc = double(S.J_c)
SolveJd = double(S.J_d)
printf("SolveMalhas_END\n")
