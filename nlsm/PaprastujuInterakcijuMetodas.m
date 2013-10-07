function saknys = PaprastujuInterakcijuMetodas(func_fi,x1,x2,tol, x0)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcijos f(x) issireiksta: x = funkc_fi(x)   , kaip m-failas arba anonimine funkcija
% a,b = pirminio intervalo pradþia ir pabaiga.
% dx = þingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = PaprastujuInterakcijuMetodas(func,x1,x2,tol,x0)

x(1)=x0;
if nargin < 5; x(1) = a + (b-a).*rand(1,1); end
if nargin < 4; tol = 0.01; end
if nargin <3; error('Nemaziau negu 3 parametrai turi buti ivesti');


f1 = func(x1);
if abs(f1) < 10^(-10); saknis = x1; return; end
f2 = func(x2);
if abs(f2) < 10^(-10); saknis = x2; return; end
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end

q=0.5;
n=1;
paklaida=abs(x2 - x1);
while paklaida > tol
    x(n+1)=func_fi(x(n));
    paklaida =((1-q)/q)*abs(x(n+1)-x(n));
    n=n+1;
    if (n > 10000) 
        disp(['konvergavimo salyga nepatenkinta per ',num2str(n),'interakciju']);
        break;
    end
end