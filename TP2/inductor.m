syms R(w);
syms L12(w1);
L=1e-3;
c=7.82e-12;
Rs=1;
Rp=5e6;
f=10:1000:10e6;
%w=2*pi*f;
R(w)=Rs+((w.*L).^2*Rp)/(w.^2*L^2+(Rp-w.^2*c*Rp*L).^2);
L12(w1)=(w1.*L*(Rp-w1.^2*c*Rp*L))/(w1.^2*L^2+(Rp-w1.^2*c*Rp*L).^2);

Rposta=R(2*pi*f);
L12posta=L12(2*pi*f);
semilogx(f,L12posta./Rposta);
hold on
semilogx(Ls,Q);
xlabel('frecuencia [Hz]');
ylabel('factor de calidad');
title('Factor de calidad de la bobina');
legend('teórico','medido');
grid on
