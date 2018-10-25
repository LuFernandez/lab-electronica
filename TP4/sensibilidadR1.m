Vg=1;
R=530.5165:50:5305.165;
deltaR=200;
R1=R+deltaR;
R3=R;
C=15e-9;
C1=C;
C3=C;
R4=10e3;
R2=2*R4;

%f=(1/2*pi)*sqrt(1/(C^2*R3*R3));
%w=2*pi*f;
w=1./(C*sqrt(R1.*R3));
Vd=sqrt((C1^2.*C3^2.*R1.^2.*R3.^2.*R4^2.*w.^4+C1^2.*R1.^2.*R4^2.*w.^2-2.*C1^2.*R1.*R2.*R3.*R4.*w.^2+C1^2.*R2^2.*R3.^2.*w.^2-2.*C1.*C3.*R2.*R3.^2.*R4.*w.^2+C3^2.*R3.^2.*R4^2.*w.^2+R4^2)./((R2+R4)^2.*C1^2.*w.^2.*(C3^2.*R2^2.*R3.^2.*w.^2+R2^2+2.*R2.*R3+R3.^2)));


%Vd=sqrt(C1^2*C3^2*R1.^2*R3^2*R4^2*Vg^2*w^4+C1^2*R1.^2*R4^2*Vg^2*w^2+C3^2*R3^2*R4^2*Vg^2*w^2-2*C1^2*R1.*R2*R3*R4*Vg*w^2-2*C1*C3*R2*R3^2*R4*Vg*w^2+C1^2*R2^2*R3^2*w^2+R4^2*Vg^2)/(C1^2*w^2*(C3^2*R3^2*w^2+1));

%plot(w/(2*pi),Vd)
%plot(R,Vd)
%title('Sensibilidad en funci�n de R1');
%grid on
surf(R,w/(2*pi),Vd);

