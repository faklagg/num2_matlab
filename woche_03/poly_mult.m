function c = poly_mult(a,b)
max_length = max(length(a),length(b));
a_filled = zeros(max_length,1);
b_filled = zeros(max_length,1);

c=zeros(2*max_length-1,1);

for i = 1:length(a)
    a_filled(i) = a(i);
end

for i = 1:length(b)
    b_filled(i) = b(i);
end

for j = 1:length(b_filled)
    for i = 1:length(a_filled)
        prod_ab = a_filled(i) * b_filled(j);
        potenz = i-1 + j-1;
        c(potenz+1) = c(potenz+1) + prod_ab;
    end
end
   

for i = 1:length(c)
    if c(i) ~= 0
        empty = false;
        break
    else 
        empty = true;
    end  
end

if empty 
    c = [];
end

end