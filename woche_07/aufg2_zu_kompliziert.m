close all;
clear all;
clc;
format compact;

%% Benutzereingabe
% Gerade mit Parametern eingeben
m = 1/2;    % Steigung
x0 = 0;     % Verschiebung auf x-achse
c = 0;      % Verschiebung auf y-achse

g = @(x) m*(x-x0) + c;
x = linspace(-2,2);
gx = g(x);

plot(x,gx,'r')
hold on
grid on

% Anzahl Punkte
anz_p = 6;

%% Steigung Gerade h senkrecht zu Benutzergerade g bestimmen
% maximale Anzahl an Schnittpunkten 
s = anz_p -1;

% Steigung senkrecht zu gewaehlter Geraden
m_neu = -1/m;
x0_neu = 0;
c_neu = 0;

h = @(x) m_neu*(x-x0_neu) + c_neu;
x = linspace(-2,2);
hx = h(x);

plot(x,hx,'r')
hold on
grid on

axis([-3 3 -1 5])

%% Bezier Punkte bestimmen

% Anzahl Punkte definieren (Funktionswerte auf g)
SP = zeros(2,anz_p);

% Schnittpunktvektor bestimme
for i = 1:anz_p
    SP(1,i) = -1+i;     % x-Werte
    SP(2,i) = g(-1+i);  % y-Werte
end

% Spacing berechnen 
distance = 1; %ggf Wert fuer sehr steile geraden vergroessern
spacing = distance * abs(1/m_neu);

% Gewichte der Punkte, damit maximale Anzahl an Schnitten erreicht wird
% P = [0,1,2,3,4,5;0,1,-3,4,-2.5,1];
gew = [0.1,1,3,4,2.5,1];

BPx = 0;
for i = 1:anz_p
    VZ = (-1)^i; % alternierendes Vorzeichen bestimmen
    j = @(x) (-1/m)*(x - SP(1,i) + SP(2,i));%Gerade j senkrecht zu g durch SP(i)
    
    %% Fehlerhaft
    BPx = spacing * VZ * i *gew(i);        % BezierPunkt x
    BPy = j(BPx);        % BezierPunkt y
    
    BP(1,i) = BPx;
    BP(2,i) = BPy;
    l = linspace(-3,3);
    jl = j(l);
    plot(l,jl);
    hold on
end

%% Algorithmus von deCasteljau anwenden und plotten

t = linspace(0,1);

for k = 1:length(t)
    C(:,k) = deCasteljau1(BP,t(k));
end
plot(C(1,:),C(2,:),'k-', BP(1,:),BP(2,:),'r*:');
hold on;


