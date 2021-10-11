function [it_itwert_fehlx_fehly] = RegulaFalsi(a,b,func,epsilon,nst1_x_analyt)
fa = func(a); fb = func(b);
m = (a*fb-b*fa)/(fb-fa);  fm = func(m);
i = 1;
while abs(fm) > epsilon
    it_itwert_fehlx_fehly(i,1) = i;
    it_itwert_fehlx_fehly(i,2) = m;
    it_itwert_fehlx_fehly(i,3) = abs(nst1_x_analyt-m);
    it_itwert_fehlx_fehly(i,4) = abs(fm);
    i = i + 1;
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