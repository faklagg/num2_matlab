close all;
clear all;
clc;
format compact;
% format long;
    
%% Momente berechnen fuer Laguerre
% Grad des Polynoms
n = 4             

momente = calcMoments(n, 'laguerre')        % Momente beginnend bei m0

%% wichtiger Hinweis zur Berechnung
% Momente gegeben: 
%     m_k = int_{a}^{b}(omega(x)x^k dx) (k = 0,1,...,2n-1)
% Skalarprodukt definiert durch:
%     (x p_0, p_0) = int_{0}^{1}(omega(x)*x*1)dx
% Rekursionsformel (Bemerkung 5.31) Zaehler und Nenner durch Momente 
% ersetzbar. 

%% Koeffizienten beta und gamme berechnen

bb = zeros(n,1);    % beta
cc = zeros(n,1);    % gamma
cc(1,1) = 0;        % Term faellt aus REkursionsformel, da p-1(x) = 0
bb(1,1) = momente(1,2)/momente(1,1);        % ersten beiden Werte von ...
                                            % beta und gamma werden wegen
                                            % der Berechnung von gamma
                                            % gefuellt
for i=2:n
    % bb startet bei beta_1
    bb(i,1) = momente(1,i+1)/momente(1,i);
    cc(i,1) = momente(1,i)/momente(1,i-1);
end

bb
cc

%% Tridiagonalmatrix fuellen
cc1 = circshift(cc, -1)     % Hilfsmatrix zur Erstellung mit spdiags
                            % eleganter möglich
J = spdiags([sqrt(cc1) bb sqrt(cc)], -1:1, n, n);
full(J)
eigenvalues = eig(J)


