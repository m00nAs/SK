function saknys = PaprastujuInterakcijuMetodas(func, func_fi, func_fiisv, x1,x2,tol, x0)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcijos f(x) issireiksta: x = funkc_fi(x)   , kaip m-failas arba anonimine funkcija
% x1,x2 = pirminio intervalo pradþia ir pabaiga.
% dx = þingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = PaprastujuInterakcijuMetodas(func,x1,x2,tol,x0)

if nargin < 7; x0= x1 + (x2 - x1) * rand(1); end
if nargin < 6; tol = 0.01; end
if nargin < 5; error('Nemaziau negu 4 parametrai turi buti ivesti'); end
x(1)=x0;

f1 = func(x1);
if abs(f1) < 10^(-10); saknis = x1; return; end
f2 = func(x2);
if abs(f2) < 10^(-10); saknis = x2; return; end
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end

s=x1:0.1:x2;


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
    saknys=x(n);
end