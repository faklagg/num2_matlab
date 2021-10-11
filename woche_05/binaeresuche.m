function k_unten = binaeresuche(x,x0)

% ACHTUNG! STUETZSTELLEN BENENNUNG!

% x = stuetzstellen
% x0 = zu suchender Wert in Stuetzstellen
% k_unten = unterer Index des beinhaltenden Intervalls

% x_1 < x_2 < x_3 <   < x_n
% Finde kleisntes k so dass x0 in [x_k, x_(k+1)]
% und setze k = 0, wenn es kein solches k gibt

if x0 < x(1) || x(end) < x0
    k_unten = 0;
    return
end
k_unten = 1;
k_oben = length(x);
while k_oben - k_unten > 1
    k_mitte = floor((k_unten + k_oben)/2); %rundet --> -inf
    if x(k_unten) <= x0 && x0 <= x(k_mitte)
        k_oben = k_mitte;
    else
        k_unten = k_mitte;
    end
end