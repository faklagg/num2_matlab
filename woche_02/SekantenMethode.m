function [it_itwert_fehlx_fehly] = SekantenMethode(x0,x1,func,epsilon,nst1_x_analyt)
%Initialisierung
fx0 = func(x0); fx1 = func(x1);
i = 1;
while abs(fx1) > epsilon && abs(fx0-fx1) > epsilon
    tmp = x1;
    x1 = x1 - fx1 * (x1-x0)/(fx1-fx0);    
    x0 = tmp;
    fx0 = fx1;
    fx1 = func(x1);
    
    it_itwert_fehlx_fehly(i,1) = i;
    it_itwert_fehlx_fehly(i,2) = x1;
    it_itwert_fehlx_fehly(i,3) = abs(nst1_x_analyt-x1);
    it_itwert_fehlx_fehly(i,4) = abs(fx1);
    i = i + 1;
end
