function saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcija, kaip m-failas arba anonimine funkcija
% a,b = pirminio intervalo pradþia ir pabaiga.
% dx = þingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
saknusk = 0;
a_pradinis = a;
while 1
    [x1,x2] = skaidosmetodas(func,a,b,dx);
    % jeio buvo NaN priskirtas is karto stabdomas ir grazins NaN(T.y. visas
    % intervalas buvo perzvelgtas)
    if isnan(x1)
        disp('Diaugiau intervalu nebera');
        break
    else
        a = x2;
        saknis = pusiaukirtosmetodas(func,x1,x2,0,tol);
        if ~isnan(saknis)
            saknusk = saknusk + 1;
            saknys(saknusk) = saknis;
        end
    end
end
x=a_pradinis:.1:b;
y = funkcija5(x);
plot(x,y);
hold on;
x_saknys = saknys;
y_saknys = funkcija5(x_saknys);
scatter(x_saknys, y_saknys,'*r');