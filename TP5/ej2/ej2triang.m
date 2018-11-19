f = 0.2* 1e6;   %Frecuencia de la senial triangular
A = 250e-3; %amplitud pico de la senial triangular

N  = 30; %cantidad de armonicos que se muestran

x = 1 : N;
x  = x*f;
y = zeros([1 N]);
p = zeros([1 N]);
% \frac{8\cdot A\cdot (-1)^\frac{n-1}{2}}{(n\cdot\pi)^2}

for n = 1:N  
     if(rem(n,2))   %si es impar
         y(n) = ((4 *A/ n^2 / pi()^2))/2;
     end;
end;

hold on
for n = 1:N  
     if(rem(n,2))   %si es impar
         p(n) = 10*log10(((y(n)/sqrt(2))^2/50)/1e-3);
         quiver(x(n), -80, 0, p(n)+80, 0, 'Color', 'b', 'LineWidth', .2);
     end;
end;

xlim([0 (N+1)*f]);

set(gca,'color','none') 


% scatter(x,p,'X');
title('Espectro de señal Triangular')
grid on;
xlabel('F[Hz]')
ylabel('P[dBm]')

xticklabels = {'f_0', '3f_0', '5f_0', '7f_0', '9f_0', '11f_0', '13f_0', '15f_0', '17f_0', '19f_0','21f_0','23f_0','25f_0','27f_0','29f_0'};
set(gca,'xtick',f:2*f:N*f); 
set(gca,'xticklabel',xticklabels,'interpreter','latex');