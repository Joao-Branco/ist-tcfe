close all 
clear all
f=50;
w=2*pi*f;
R=300e3
C=150e-6

%envelope detector
A=230*0.73896;  %%%%%transformador
t=linspace(0, 200e-3, 5000);

vS = A * sin(w*t);
vOhr = zeros(1, length(t));
vO = zeros(1, length(t));

tOFF = 1/w * atan(-C*R*w);
k = 1;
vOnexp = A*sin(w*tOFF)*exp(-(t-tOFF)/R/C);

figure
for i=1:length(t)   %%%%%retificador de onda completa
  if (vS(i) > 0)
    vOhr(i) = vS(i);
  else
    vOhr(i) = -vS(i);
  endif
endfor

plot(t*1000, vOhr)
hold

for i=1:length(t)
  if t(i) < tOFF
    vO(i) = vOhr(i);
  elseif vOnexp(i) > vOhr(i)
    vO(i) = vOnexp(i);
  else 
    vO(i) = vOhr(i);
    tOFFA(k) = tOFF;
    k = k+1;
    tOFF = tOFF + 1/(2*f);
    vOnexp =abs( A*sin(w*tOFF))*exp(-(t-tOFF)/R/C);
  endif
endfor


for i=200:length(t) 
vOmin=vO(i);
if(vOmin<vO(i))
vOmin=vO(i);
endif
endfor
vOmin

plot(t*1000, vO)
grid on
title("Output voltage v_o(t)")
xlabel ("t[ms]")
legend("full-wave rectified","envelope")
print ("venvlope.eps", "-depsc");


ripple=max(vO)-vOmin;
ripplef=ripple*459.828/(459.828+100*10^3);



