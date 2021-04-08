clear all
close all
pkg load symbolic



clc

R1 = 1.03246207994e3
R2 = 2.00407938458e3
R3 = 3.09992724929e3 
R4 = 4.11959743399e3 
R5 = 3.13664760831e3 
R6 = 2.00274902802e3 
R7 = 1.04584791445e3 
C = 1.04562966374e-6 
Kb = 7.02164593403e-3 
Kd = 8.21039470748e3 
Tau = 0.0032798

sym t

Vs = 1

Zc = -j/(2*pi*1000*C)

pkg load symbolic

syms v1
syms v2
syms v3
syms v5
syms v6
syms v7
syms v8

G1 = 1 / R1
G2 = 1 / R2
G3 = 1 / R3
G4 = 1 / R4
G5 = 1 / R5
G6 = 1 / R6
G7 = 1 / R7



eq_1 = (v1 - v2) * G1 - (v2- v5) * G3 + (v3 - v2) * G2 == 0
eq_2 = - Kb * (v2 -v5) + (v5 - v6) * G5 - (v6 -v8) * (1 / Zc) ==0
eq_3 = -(v3 - v2) * G2 + Kb * (v2 -v5) == 0
eq_4 = -(v7 - v8) * G7 - v7 * G6 == 0
eq_5 = v1 == Vs
eq_6 = v5 - v8 + Kd * v7 * G6 == 0
eq_7 = (v2 - v5) * G3 - v5 * G4 + (v7 - v8) * G7 - (v5 - v6) * G5 + (v6 -v8) * (1 / Zc) == 0


S = solve( eq_1, eq_2, eq_3, eq_4, eq_5, eq_6, eq_7, v1, v2, v3, v5, v6, v7, v8)


printf("SolveNos_TAB\n")
SolveV1 = double(S.v1)
SolveV2 = double(S.v2)
SolveV3 = double(S.v3)
SolveV5 = double(S.v5)
SolveV6 = double(S.v6)
SolveV7 = double(S.v7)
SolveV8 = double(S.v8)

printf("SolveNos_END\n")


%time axis: 0 to 20ms with 1us steps
t=0:1e-6:20e-3; %s

Gain = 0.56801
Phase = -2.9980

V6f = Gain * sin(2 * pi * 1000 * t + Phase)

qr = figure ();
plot (t*1000, V6f, "g");
hold on;

xlabel ("t[ms]");
ylabel ("V6f(t) [V]");
print (qr, "forced.eps", "-depsc");


