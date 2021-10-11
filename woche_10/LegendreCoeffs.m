function coeffs = LegendreCoeffs(n)
% n = Grad des Legendre Polynoms
% P0 = 1
% P1 = x
% P2 = 1/2(3x^2-1)

%% Matrizen und Koeffizienten deklarieren und initialisieren
len_Z = n+1;            % Laenge der Zaehlermatrix, Anzahl Zeilen
N = zeros(n,n);         % Laenge der Nennermatrix, Anzahl Zeilen
c = zeros(1,2*n-1+1);   % Koeffizienten c0,...,cn folgen einer Reihe


% c0=2; c1=0; c2=2/3; c3=0; c4=2/5; c5=0
for i = 1:2:length(c)   % i in Zweierschritten hochzaehlen
    c(1,i) = 2/i;
end

%% Symbolische Matriz fuer den Zaehler initialisieren
% Achtung!: Matrix darf davor nicht mit doubles initialisiert sein
syms x 
for i=1:n+1
    Z(n+1,i) = x^(i-1);
end
for i = 1:len_Z-1 
    for j = 1:n+1
        Z(i,j) = c(1,j+i-1);
    end
end

%% Matrix fuer den Nenner initialisieren
for i = 1:length(N)
    for j = 1:length(N(i,:))
        N(i,j) = c(1,j+i-1);
    end
end

%% Berechnung der Determinanten

detZ = det(Z)
detN = det(N)

coeffs = detZ / detN;

end
