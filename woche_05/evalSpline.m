function sfx = evalSpline(t,C,x)
% x = auszuwertende Stellen 
% C = Koeffizientenmatrix der Spline Interpolation
% t = Stuetzstellen

    for j = 1:length(x)
        k_unten = binaeresuche(t,x(j));
        ah = C(:,k_unten);
        sfx(j) = Horner(ah,t(k_unten),x(j));
    end
end