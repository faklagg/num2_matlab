close all;
clear all;
clc;
format compact;
% format long;
    
%% Momente berechnen fuer Laguerre
% Grad des Polynoms
n = 3             

momente = calcMoments(n, 'laguerre')        % Momente beginnend bei m0
% momente = calcMoments(n, 'tschebyscheff')        % Momente beginnend bei m0

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

%% Polynome in monomialer Darstellung berechnen
% die ersten beiden gegeben Polynome einfügen 

% pm1 = [0];          % p-1(x)      = 0
% p0 = [1];           % p0(x) = x^0 = 1
% p1 = [1,0];         % p1(x) = x^1 = x

p = zeros(n+2,n+1);
p(1,end) = 0;
p(2,end) = 1;
% p(3,end-1) = 1;

p

% 3 Zeile von p entspricht den Koeffizeinten von p1(x)
for i=3:length(p)
    p(i,:) = circshift(p(i-1,:),-1) - bb(i-2)*p(i-1,:) ...
                - cc(i-2)*p(i-2,:);
end

p

%% Plotting

figure

% plot single function: 
% grad = 3
% plot(linspace(-1,10,1000), polyval(p(grad+2,:), linspace(-1,10,1000)));

for i=3:length(p)
    plot(linspace(-1,10,1000), polyval(p(i,:), linspace(-1,10,1000)));
    hold on;
end

% plot(linspace(-10,20,1000), linspace(0,0,1000), 'k')
grid on
axis([-1 10 -4 10])
% legend('p-1', 'p0', 'p1', 'p2', 'p3', 'p4', 'p5', ...
%         'p6', 'p7', 'p8', 'p9', 'p10') % plot ab p-1(x)
legend('p1', 'p2', 'p3', 'p4', 'p5', ...
        'p6', 'p7', 'p8', 'p9', 'p10') % plot ab p1(x)
    
    
%% Nullstellen berechnen

a = -1;
b = 10;
epsilon = 10^-7;

nst = zeros(n,n);   % x-Werte der Nullstellen 
                    % Zeile 1 sind Nullstellen von p1(x)

nst(1,1) = BisektionsMethode(a,b,p(1+2,:),epsilon);                    
    
for i=2:length(nst)
    % Idee: linke Grenze wird immer eins weiter verschoben, 
    % da die Nst des naechst hoeheren Polynoms durch die Nst des
    % vorangegangen eingegrenzt ist
    for j=1:i-1
        nst(i,j) = BisektionsMethode(a, nst(i-1,j), p(i+2,:), epsilon);
        a = nst(i-1,j);
    end
    nst(i,j+1) = BisektionsMethode(a, b, p(i+2,:), epsilon);
    a = -1;
end

nst