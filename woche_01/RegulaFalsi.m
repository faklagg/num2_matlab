function Nullstelle = RegulaFalsi(a,b,func,epsilon)
fa = func(a); fb = func(b);
m = (a*fb-b*fa)/(fb-fa);  fm = func(m);
while abs(fm) > epsilon
    if fa*fm < 0
        b = m;
        fb = fm;
    else 
        a = m;
        fa = fm;
    end
    m = (a*fb-b*fa)/(fb-fa);
    fm = func(m);
end
Nullstelle = m; %Loesung