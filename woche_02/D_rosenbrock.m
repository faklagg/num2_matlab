function D = D_rosenbrock(x,param)
n = size(x,1);
d0(2:n,1) = 200;
d0(1:n-1) = d0(1:n-1) + 2 + 1200*x(1:n-1).^2-400*x(2:n);
dm1 = -400*x;
dp1 = -400*x([1,1:n-1]);
D = spdiags([dm1,dp0,dp1],[-1 0 1],n,n);