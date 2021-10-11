function [it_itwert_fehlx_fehly] = NewtonSimple(x,f,Df,tol,maxit,nst1_x_analyt)
nit = 0;
fx = f(x);
while norm(fx) > tol && nit <= maxit
    nit = nit + 1;
    x = x-Df(x)\fx; %\fx löst LGS (entspricht fx im zaehler)
    fx = f(x);
    
    it_itwert_fehlx_fehly(nit,1) = nit;
    it_itwert_fehlx_fehly(nit,2) = x;
    it_itwert_fehlx_fehly(nit,3) = abs(nst1_x_analyt-x);
    it_itwert_fehlx_fehly(nit,4) = abs(fx);
    
end
