function saknis = Niutono(func, func_isv, func_isv2,a, b,tol, x0)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcijos f(x) issireiksta: x = funkc_fi(x)   , kaip m-failas arba anonimine funkcija
% x1,x2 = pirminio intervalo pradþia ir pabaiga.
% dx = þingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = PaprastujuInterakcijuMetodas(func,x1,x2,tol,x0)

if nargin < 7
    if (a < 0)
      disp('a b turi buti teigiami ');
      a=str2num(input('a ir b turi buti teigiami ', 's'));
    [x1,x2] = skaidosmetodas(func,a,b,1);
    x0= x1 + (x2 - x1) * rand(1);
end
ss=x1:.1:x2;
y=abs(func_isv(ss));
ma=min(y)
if (and((ma <= y),(ma>=0)))
    j=intmax('int64');
    s1=x1:0.1:x2;
    y1=abs(func_isv2(s1));
    ma2=max(y1)
    if (and((ma2 >= y1),(ma2<=j)))
    else 
     disp('konvergavimo salyga nepatenkinta ') 
     return;
    end   
else 
     disp('konvergavimo salyga nepatenkinta ') 
     return;
end

a_pradinis = x1; % Reikia tik piesimui

n=1;
x(n)=x0;
paklaida=1;

while paklaida > tol
    x(n+1)=x(n)-(func(x(n))/func_isv(x(n)));
    paklaida =abs(x(n+1)-x(n));
    n=n+1;
    if (n > 1000000) 
        disp(['konvergavimo salyga nepatenkinta per ',num2str(n),'interakciju']);
        break;
    end
end
saknis=x(n);


% g=a_pradinis:.1:x2;
% y = func(g);
% plot(g,y);
% hold on;
% x_saknys = saknys;
% y_saknys = func(x_saknys);
% scatter(x_saknys, y_saknys,'*r');
end