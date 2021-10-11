function c = poly_add(a,b)

max_length = max(length(a),length(b));
a_filled = zeros(max_length,1);
b_filled = zeros(max_length,1);

for i = 1:length(a)
    a_filled(i) = a(i);
end

for i = 1:length(b)
    b_filled(i) = b(i);
end

c = a_filled + b_filled;

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