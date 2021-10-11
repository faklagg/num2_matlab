function value = AitkenNeville(x,fx,x0)
% evaluate the Interpolation polynomial given
% by (x,fx) at the point x0 (MUST only be 1 point x0)
for k = 2: length (fx)
    for j = length (fx):-1:k
        fx(j) = fx(j) + (x0-x(j))/(x(j)-x(j-k+1))*(fx(j)-fx(j-1));
    end
end
value = fx(end);