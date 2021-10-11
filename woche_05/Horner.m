function fx = Horner(a,t,x)
% a = Koeffizientenvektor der Monomialbasis
% x = Auswertestelle
% t = Stuetzstellen

    fx = a(end);
    for i = length(a)-1:-1:1 
        fx = a(i) + fx.*(x-t);
    end
end
