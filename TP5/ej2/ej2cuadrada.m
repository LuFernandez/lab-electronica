clear all;
clearvars;
clc;

f = (0.3 + 0.2*5) * 1e6;   %Frecuencia de la senial cuadrada
A = 125e-3; %amplitud pico de la senial cuadrada

N  = 30; %cantidad de armonicos que se muestran

x = 1 : N;
x  = x*f;
y = zeros([1 N]);
p = zeros([1 N]);

f0=1.3e6;
T=1/f0;
A=125e-3;
d=(1/3)*T;  %33%
% d=0.5*T;  %50%

% A0 = A*(2*d/T-1);
% An = 2*A/(pi*n)*sin(pi*n*d/T);
% Ann = 2*A/(pi*(-n))*sin(pi*(-n)*d/T);

% PARA 50%
% for n = 1:N  
%      if(rem(n,2))   %si es impar
%          y(n) = (2*A/(pi*n)*sin(pi*n*d/T)+2*A/(pi*(-n))*sin(pi*(-n)*d/T))/2;
%      end;
% end;
% 
% for n = 1:N  
%      if(rem(n,2))   %si es impar
%          p(n) = 10*log10(((y(n)/sqrt(2))^2/50)/1e-3);
%      else
%          p(n)= -50;
%      end;
% end;

% PARA 33.3%
for n = 1:N  
     if(rem(n,3))   %si no es multiplo de 3
         if(n==0)   
            y(n) = A*(2*d/T-1)/2;
         else
            y(n) = (2*A/(pi*n)*sin(pi*n*d/T)+2*A/(pi*(-n))*sin(pi*(-n)*d/T))/2;
         end
     end;
end;
for n = 1:N  
     if(rem(n,3))   %si es impar
         p(n) = 10*log10(((y(n)/sqrt(2))^2/50)/1e-3);
     else
         p(n)= -50;
     end;
end;


xlim([0 (N+1)*f]);

set(gca,'color','none') 


scatter(x,p,'X');
title('Espectro de señal cuadrada con DC:33.3%')
grid on;
xlabel('F[Hz]')
ylabel('P[dBm]')

xticklabels = {'f_0', '3f_0', '5f_0', '7f_0', '9f_0', '11f_0', '13f_0', '15f_0', '17f_0', '19f_0','21f_0','23f_0','25f_0','27f_0','29f_0'};
set(gca,'xtick',f:2*f:N*f); 
set(gca,'xticklabel',xticklabels,'interpreter','latex');



% syms n;
% 
% f0=1.3e6;
% T=1/f0;
% A=125e-3;
% d=0.5*T;
% 
% x = 1 : N;
% x  = x*f0;
% p = zeros([1 N]);
% 
% A0 = A*(2*d/T-1);
% An = 2*A/(pi*n)*sin(pi*n*d/T);
% Ann = 2*A/(pi*(-n))*sin(pi*(-n)*d/T);
% 
% % y = A0*dirac(f) + symsum(An/2 * dirac(f-n/T),n,1,Inf) + symsum(Ann/2 * dirac(f+n/T),n,1,20)
% 
% 
% 
% 
% 
% x = 1 : N;
% x  = x*f;
% y = zeros([1 N]);
% 
% 
% for n = 1:N  
%      if(rem(n,2))   %si es impar
%          y(n) = 4 *A/ n / pi();
%      end;
% end;
% 
% 
% xlim([0 (N+1)*f0]);
% 
% hold on
% stem(x,10*log10(p/1e-3))
% xlabel('Frequency')
% ylabel('P')
