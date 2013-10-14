function saknys = pilnasPIM(func, func_fi,fucn_fiisv,a,b,dx,tol)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - funkcija, kaip m-failas arba anonimine funkcija
% a,b = pirminio intervalo prad�ia ir pabaiga.
% dx = �ingsnio ilgis: (b-a)/n.
%a<b, intervalas, kuriame ieskosime funkcijos nulio(-iu)
%PALEIDIMAS: saknys = pilnasPIM(func,a,b,dx,filter,tol)
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
        saknys = PaprastujuInterakcijuMetodas(func, func_fi,func_fiisv,x1,x2,0.01)
        if ~isnan(saknys)
            saknusk = saknusk + 1;
			if saknys < b
            saknys(saknusk) = saknys;
        end
    end
    end
end
x=a_pradinis:1:b
y = func(x)
plot(x,y)
hold on;
x_saknys = saknys
y_saknys = func(x_saknys)
scatter(x_saknys, y_saknys,'*r');