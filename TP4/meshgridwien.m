[r,f]=meshgrid(500:100:5000,2000:100:20000);
c=15e-9;
r4=10e3;
r2=20e3;
%rx=f./(20e3.*2.*pi.*cx);
%cx=220e-9;

%r4=(rx.*r4)./r

w=2*pi.*f;
%z1=r+(1./(w.*c));
%z3=r./(1+w.*c.*r);
%vd=(r4.*z1)-(r2.*z3);
vd=sqrt((c^2.*c^2.*r.^2.*r.^2.*r4^2.*w.^4+c^2.*r.^2.*r4^2.*w.^2-2.*c^2.*r.*r2.*r.*r4.*w.^2+c^2.*r2^2.*r.^2.*w.^2-2.*c.*c.*r2.*r.^2.*r4.*w.^2+c^2.*r.^2.*r4^2.*w.^2+r4^2)./((r2+r4)^2.*c^2.*w.^2.*(c^2.*r2^2.*r.^2.*w.^2+r2^2+2.*r2.*r+r.^2)));
surf(r,f,vd)
title('Vd en funci�n de R y f');