function B = AllBernstein(n,x)
% ***   Compute all n-th Bernstein polynomials
B = zeros(n+1,1);
B(1) = 1;
for j = 1:-1:1
    for k = j:-1:1
        B(k+1)  = B(k+1) + x * B(k);
        B(k)    = (1-x) * B(k);
    end
end
