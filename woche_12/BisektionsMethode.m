function Nullstelle = BisektionsMethode(a,b,func,epsilon)
%Initialisierung
temp=[];

% fuer anonyme functionen
% fa = func(a); 
% fb = func(b);

fa = polyval(func, a);
fb = polyval(func, b);
while abs(a-b) > epsilon
    m = (a+b)/2;
%     fm = func(m);
    fm = polyval(func, m);
    if fm == 0
        Nullstelle = m;
        return
    elseif fa*fm < 0
        b = m;
        fb = fm;
    else
        a = m;
        fa = fm;
    end
    temp = [temp;m];
end
% Loesung
Nullstelle = m;