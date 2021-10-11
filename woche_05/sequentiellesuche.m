function k = sequentielle_suche(x,x0)
% x_1 < x_2 < x_3 <   < x_n
% Finde kleinstes k, sodass x0 in [x_k, x_(k+1)]
% und setze k = 0, wenn es kein solches k gibt
for k = 1:length(x)-1
    if x(k) <= x0 && x0 <= x(k+1)
        return
    end
end
k = 0;