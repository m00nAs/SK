function saknis = pusiaukirtosmetodas(func,x1,x2,filter,tol)
% Pusiaukirtos metodu surandamas funkcijos f(x) nulis intervale (x1,x2).
% IVEDIMO PARAMETRAI:
%func - funkcija, kaip m-failas arba anonimine funkcija
%x1<x2, intervalas, kuriame ieskosime funkcijos nulio
%PALEIDIMAS: saknis = pusiaukirtosmetodas(func,x1,x2,filter,tol)

% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.01).

% nargin grazina ivesties argumenta skaiciu
%filter filtruoja skaiciu skaitmeniniu butu
% Tikrina kiek parametru ivesta: 
% jei ivedama 5, tai vartotojas pasirenka paklaida ir ijungia filtra
% jei ivedama 4, tai automatiskai nustatoma paklaida
% jei ivedana 3, tai pradedama isjungtu filtru ir numatyta pakalida
% truksta apsaugos ribos ivedimui. pvz
if nargin < 5; tol = 0.01; end
if nargin < 4; filter = 0; end
if nargin < 3; disp('Nemaziau negu tris parametrai turi buti ivesti'); saknis = NaN; return; end

% Atliekamas ribos krastu patikrinimas
% Jei ribos galas tenkina salyga tai is kart grazinama saknis
% jei ribos galai neigija 0 
% kai galai vienodu zenklu  naudoji error ir ji ivigdo sustoja ir ismeta paaiskinima nurode eilute 
f1 = func(x1);
if abs(f1) < 10^(-10); saknis = x1; return; end
f2 = func(x2);
if abs(f2) < 10^(-10); saknis = x2; return; end
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end


% Atliekamas saktu patikrinimas ir priskirimas
% Ceil apvalina sveika skaciu i didesnio puse
% n skaiciuoja kiek zinksniu bus vigdoma
n = ceil(log2(abs(x2 - x1)/tol));
for i = 1:n
    %suranda nauja vidurio taska ir apskaiciuoja funkcijos reiksme
    x3 = 0.5*(x1 + x2);
    f3 = func(x3);
    if (filter == 1) & (abs(f3) > abs(f1)) & (abs(f3) > abs(f2))
        saknis = NaN; return
    end
    if  abs(f3) < 10^(-10)
        saknis = x3; return
    end
    %Tikrina, kurioje dalyje (puseja)yra sprendinys
    if f2*f3 < 0.0
        x1 = x3; f1 = f3;
    else
        x2 = x3; f2 = f3;
    end
    end
    saknis = (x1 + x2)/2;
end