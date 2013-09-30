function saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcija, kaip m-failas arba anonimine funkcija
% a,b = pirminio intervalo pradþia ir pabaiga.
% dx = þingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
saknusk = 0;
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