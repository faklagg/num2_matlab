function N = AllBasisFunc (i,p,U,t)
% compute the nonvanishing basis functions
N = zeros(p+1,p+1);
N(1,1) = 1;
for j =1:p
    left(j) = t - U (i+1-j);
    right(j) = U (i+j) - t;
    saved = 0;
    for r = 1:j
        temp = N(r,j)/(right(r) + left(j-r+1));
        N(r,j+1) = saved + right(r) * temp;
        saved = left(j-r+1) * temp;
    end
    N(j+1,j+1) = saved;
end