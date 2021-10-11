function [it_itwert_fehlx_fehly] = Newton_ndim(x,y,dy,tol,maxit)
nit = 0;

y = 

s = x_k+1 - x_k
J(x_k) * s = f(x_k)
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
