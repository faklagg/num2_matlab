function [it_itwert_fehlx_fehly] =  BisektionsMethode(a,b,func,epsilon,nst1_x_analyt)
%Initialisierung
temp = [];
fa = func(a); fb = func(b);
i = 1;
while abs(a-b) > epsilon
    m = (a+b)/2;
    fm = func(m);
    it_itwert_fehlx_fehly(i,1) = i;
    it_itwert_fehlx_fehly(i,2) = m;
    it_itwert_fehlx_fehly(i,3) = abs(nst1_x_analyt-m);
    it_itwert_fehlx_fehly(i,4) = abs(fm);
    i = i + 1;
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
