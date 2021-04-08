clear all
close all
pkg load symbolic

clc

Vx = 8.748008
Tau = 0.0032798


%time axis: 0 to 20ms with 1us steps
t1=-5e-3:1e-5:0; %s
t2=0:1e-5:20e-3; %s

Gain =  0.56801
Phase = -2.9980

Vs1 = 5.21005945917
Vs2 = sin(2 * pi * 1000 * t2)

V61 = 5.7986
V62 = Vx*exp(-t2/Tau) + Gain *sin(2*pi*1000*t2 + Phase)

qr = figure ();
plot (t1*1000, Vs1, "+c", t2*1000, Vs2, "-c");
hold on;
plot (t1*1000, V61, "+y", t2*1000, V62,"-y");

xlabel ("t[ms]");
ylabel ("Vs(t) / V6(t) [V]");
print (qr, "all.eps", "-depsc");


