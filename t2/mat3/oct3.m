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
Vs = 0
Vx = 8.748008
C = 1.04562966374e-6 
Kb = 7.02164593403e-3 
Kd = 8.21039470748e3 
tau = 0.0032798

syms t
syms Vn(t)


%time axis: 0 to 20ms with 1us steps
t=0:1e-6:20e-3; %s

Vn = Vx * exp( -t / tau )

hf = figure ();
plot (t*1000, Vn, "g");
hold on;

xlabel ("t[ms]");
ylabel ("V6n(t) [V]");
print (hf, "natural.eps", "-depsc");


