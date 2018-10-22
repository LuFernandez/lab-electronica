[r1,d]=meshgrid(33.86:1:169.4,0.02:0.001:0.1);
c1=4.7e-9;
r3=10e3;
cx=220e-9;
rx=d./(20e3.*2.*pi.*cx);
r4=(rx.*r3)./r1

w=i*2*pi*20e3;
z1=r1+(1./(w.*c1))
zx=rx+(1./(w.*cx))
vd=((r3./(r3+z1))-(r4./(r4+zx)))
surf(r1,d,abs(vd))
