function c = poly_derivate(a)

c = zeros(length(a-1),1);

for i = 1:length(a)-1
      power = i;
      c(i) = a(i+1) * power;        
end

c = c(1:end-1,:);
if isempty(c)
    c=[];
end

end
