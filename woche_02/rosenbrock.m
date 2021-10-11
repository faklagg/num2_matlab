function value = rosenbrock(x,param)
n = size(x,1);
value(2:n,1) = 200 * (x(2:end)-x(1:end-1).^2);
value(1:n-1,n) = value(1:n-1,1) - 2 *(1-x(1:end-1)) - 400*x(1:end-1).*(x(2:end)-x(1:end-1).^2);