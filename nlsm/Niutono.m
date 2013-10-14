function saknys = Niutono(func, func_isv, func_isv2, x1,x2,tol, x0)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcijos f(x) issireiksta: x = funkc_fi(x)   , kaip m-failas arba anonimine funkcija
% x1,x2 = pirminio intervalo pradþia ir pabaiga.
% dx = þingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = PaprastujuInterakcijuMetodas(func,x1,x2,tol,x0)

x(1)=x0;
n=1;
paklaida=1;

while paklaida > tol
    x(n+1)=x(n)-(func(x(n))/func_isv(x(n)));
    paklaida =abs(x(n+1)-x(n));
    n=n+1;
    if (n > 10000) 
        disp(['konvergavimo salyga nepatenkinta per ',num2str(n),'interakciju']);
        break;
    end
    saknys=x(n);
end
end