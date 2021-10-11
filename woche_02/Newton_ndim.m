function [it_itx1_itx2_fehls] = Newton_ndim(x,tol,maxit)
nit = 0;
[y] = DFrosen(x(1,1),x(2,1));
[dy] = HFrosen(x(1,1),x(2,1)); % Jacobi Matrix (?)
s = dy\y;

while norm(s) > tol && nit <= maxit
    nit = nit + 1;
    [y] = DFrosen(x(1,1),x(2,1));
    [dy] = HFrosen(x(1,1),x(2,1));
    s = dy\y;
    x = x - s;
    
    it_itx1_itx2_fehls(nit,1) = nit;
    it_itx1_itx2_fehls(nit,2) = x(1,1);
    it_itx1_itx2_fehls(nit,3) = x(2,1);
    it_itx1_itx2_fehls(nit,4) = abs(norm(s));
    
end
