%% Clear temporary variables
clearvars data raw R;

Rs= 1e-1;
Rl=5e6;
L=38e-9;
C= 8.2e-9;

% s = tf('s');
s = tf('s');
% H = 1/(s*C*R+1);
f1 = 10: 200 : 10e6;
H =  (s^2*L*C*Rl+s*(L+C*Rl*Rs)+Rl+Rs)/(s*C*Rl+1);
% ZR = Rs + (s*L)^2*Rp/((Rp-s^2*C*Rp*L)^2+(s*L)^2)

[magn, phase] = bode(H,2*pi*f1);
magn = squeeze (magn);
phase = squeeze(phase);
Hdb = 20*log10(magn);

% [magn, phase] = bode(ZR,2*pi*f1);
% magn = squeeze (magn);
% phase = squeeze(phase);



figure
semilogx(Cs, Fasegrado)
hold on
semilogx(f1, phase);
title('Bode de Fase');
xlabel('frecuencia[Hz]');
ylabel('Fase [Grados]');
grid on
legend('Medido','Teórico');
hold off

figure
semilogx(Cs, 20*log10(Modulo))
hold on
semilogx(f1, Hdb);
title('Bode de Magnitud');
xlabel('frecuencia[Hz]');
ylabel('magnitud[dB]');
grid on
legend('Medido','Teórico');
hold off
