
clear all
close all
pkg load symbolic


syms f

f = logspace(-1, 6, 8*5);

R1 = 1.03246207994e3
R2 = 2.00407938458e3
R3 = 3.09992724929e3 
R4 = 4.11959743399e3 
R5 = 3.13664760831e3 
R6 = 2.00274902802e3 
R7 = 1.04584791445e3 
Vs = 1 
Vx = 8.748008
C = 1.04562966374e-6 
Kb = 7.02164593403e-3 
Kd = 8.21039470748e3 

G1=1/R1;
G2=1/R2;
G3=1/R3;
G4=1/R4;
G5=1/R5;
G6=1/R6;
G7=1/R7;
Vs = 1;


for i = 1:40

Zc(i) = -j/(2*pi*f(i)*C);

A=[
G1,-G1-G2-G3,G2,G3,0,0,0;
0,-Kb,0,Kb+G5,-G5-1/Zc(i),0,1/Zc(i);
0,G2+Kb,-G2,-Kb,0,0,0;
0,0,0,0,0,-G6-G7,G7;
1,0,0,0,0,0,0;
0,0,0,1,0,Kd*G6,-1;
0,G3,0,-G4-G5-G3,G5+1/Zc(i),G7,-G7-1/Zc(i)];

B=[0;0;0;0;Vs;0;0];

N=A\B;

V01(i) = N(1);
V02(i) = N(2);
V03(i) = N(3);
V05(i) = N(4);
V06(i) = N(5);
V07(i) = N(6);
V08(i) = N(7);

V06_abs(i)=20*log10(V06(i));
V06_arg(i)=arg(V06(i))*180/pi;

VS_abs(i)=20*log10(V01(i));
VS_arg(i)=arg(V01(i))*180/pi;

VC_abs(i)=20*log10(V06(i)-V08(i));
VC_arg(i)=arg(V06(i)-V08(i))*180/pi;

endfor

qr = figure()
semilogx(f, V06_abs,"-;V6;", f, VS_abs,"-;VS;", f, VC_abs,"-;VC;");

qe = figure()
semilogx(f, V06_arg,"-;V6;", f, VS_arg,"-;VS;", f, VC_arg,"-;VC;");

print (qr, "bodemag.eps", "-depsc");
print (qe, "bodepha.eps", "-depsc");
