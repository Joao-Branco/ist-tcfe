
clear all
close all
pkg load symbolic


syms f

f = logspace(1, 8, 100);

R1 = 1e3
R2 = 100e3
R3 = 1e3 
R4 = 100e3 
C1 = 330e-9

Gain = 1 + (R4 / R3)


for i = 1:100

s(i) = 2*pi*f(i)*j
Tf(i) = Gain * ((R1 * C1 * s(i)) / (1 + (R1 * C1 * s(i)))) * ( 1e10 / ((s(i) + 1e4) * (s(i) + 1e6)))

Tf_abs(i)=20*log10(Tf(i));
Tf_fas(i)=arg(Tf(i))*180/pi;
endfor

qr = figure()
semilogx(f, Tf_abs,"-;Vi/Vo;");
grid on;

qe = figure()
semilogx(f, Tf_fas,"-;Vi/Vo;");
grid on;


print (qr, "bodemag.eps", "-depsc");
print (qe, "bodepha.eps", "-depsc");
