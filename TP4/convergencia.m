[r4,cx]=meshgrid(100:1:1000,47e-9:5e-9:470e-9);
c1=15e-9;
r3=10e3;
rx=0.05./(20e3.*2.*pi.*cx);
r1=(cx.*rx)./c1

w=i*2*pi*20e3;
z1=r1+(1./(w.*c1))
zx=rx+(1./(w.*cx))
vd=((r3./(r3+z1))-(r4./(r4+zx)))
surf(r4,cx,abs(vd))
