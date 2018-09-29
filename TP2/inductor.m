syms R(w);
syms C(w1);
L=38e-9;
c=8.2e-12;
Rs=.1;
Rl=5e6;
f=10:1000:10e6;
%w=2*pi*f;
R(w)=Rs+Rl/(1+(w.*c*Rl).^2);
C(w1)=-(w1.*Rl^2*c)/(1+(w1.*c*Rl).^2);
%C(w1)=w1.*L-(w1.*Rl^2*c)/(1+(w1.*c*Rl).^2);

Rposta=R(2*pi*f);
cposta=C(2*pi*f);
semilogx(f,Rposta);
hold on
semilogx(Cs,R1);
xlabel('frecuencia [Hz]');
ylabel('factor de pérdidas');
title('Factor de pérdidas del capacitor de 8.2nF');
%legend('teórico','medido');
grid on
