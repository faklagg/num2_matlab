function d = calc_d(n,p,f,n_iter,a,b)
% n = grad
% p = Koeffizienten des Polynoms in Monomialer Basis
% f = function
% n_iter = Anazhl Stuetzstellen
% a = linke intervallgrenze
% b = rechte intervallgrenze

len = n+1;
d = zeros(len,1);

%% Integration des Intervalls zur Bestimmung der Koeffizienten a(i,j)
% Achtung Indizes!!!
h = (b-a)/n_iter;
for i = 1:len
    sum = 0;
    for j = a:h:b-2*h 
        fx_temp = f(j+h);
        p_temp = polyval(p(i,:), j+h);
        sum = sum + fx_temp*p_temp;
    end
    d(i,1) = h*(0.5*f(a)*polyval(p(i,:), a) + ...
        0.5*f(b)*polyval(p(i,:), b) + sum);
end
