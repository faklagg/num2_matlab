function mid = FindSpan(p,U,t)
% returns the knot span index
n = length (U)-p;
if t == U(end) % special case
    mid = n-1;
    return
end
low = p;
high = n ;
mid = floor((low+high)/2);
while t <U ( mid ) | t >= U( mid +1)
    if t < U(mid)
        high = mid ;
    else
        low = mid ;
    end
    mid = floor((low+high)/2);
end