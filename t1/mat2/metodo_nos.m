clear all
close all
warning('off', 'all');

clc

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

pkg load symbolic

syms v1
syms v2
syms v3
syms v4
syms v5
syms v6
syms v7

G1 = 1 / R1
G2 = 1 / R2
G3 = 1 / R3
G4 = 1 / R4
G5 = 1 / R5
G6 = 1 / R6
G7 = 1 / R7



eq_1 = (v2 - v1) * G1 + (v2- v5) * G3 + (v2 - v3) * G2 == 0
eq_2 = -(v4 -v5) * G5 - Kb * (v2 -v5) + Id == 0
eq_3 = (v3 -v2) * G2 - Kb * (v2 -v5) == 0
eq_4 = (v6 -v7) * G7 + v6 * G6 == 0
eq_5 = v1 == Va
eq_6 = v5 - v7 + Kc * v6 * G6 == 0
eq_7 = (v4 - v5) * G5 - (v5 - v2) * G3 - v5 * G4 - (v7 - v6) * G7 == Id


S = solve( eq_1, eq_2, eq_3, eq_4, eq_5, eq_6, eq_7, v1, v2, v3, v4, v5, v6, v7)

printf("SolveNos_TAB\n")
SolveV1 = double(S.v1)
SolveV2 = double(S.v2)
SolveV3 = double(S.v3)
SolveV4 = double(S.v4)
SolveV5 = double(S.v5)
SolveV6 = double(S.v6)
SolveV7 = double(S.v7)
printf("SolveNos_END\n")
