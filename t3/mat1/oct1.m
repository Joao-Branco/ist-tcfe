close all 
clear all
f=50;
w=2*pi*f;
R=300e3
C=150e-6

%envelope detector
A=230*0.73896;  %%%%%transformador
t=linspace(0, 200e-3, 5000);
vT = 230 * sin(w*t);
vS = A * sin(w*t);
vOhr = zeros(1, length(t));
vO = zeros(1, length(t));

tOFF = 1/w * atan(-C*R*w);
k = 1;
vOnexp = A*sin(w*tOFF)*exp(-(t-tOFF)/R/C);



figure
plot(t*1000, vT)
hold
plot(t*1000, vS)
grid on
title("Input voltage v_S(t)")
xlabel ("t[ms]")
legend(" Before the transformer", " After the transformer")
print ("inputWave.eps", "-depsc");

figure
for i=1:length(t)   %%%%%retificador de onda completa
  if (vS(i) > 0)
    vOhr(i) = vS(i) - 0.7;
  else
    vOhr(i) = -vS(i)-0.7;
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
    vOnexp =abs( (A - 0.7)*sin(w*tOFF))*exp(-(t-tOFF)/R/C);
  endif
endfor

plot(t*1000, vO)
grid on
title("Output voltage v_o(t)")
xlabel ("t[ms]")
legend("full-wave rectified","envelope")
print ("venvlope.eps", "-depsc");

