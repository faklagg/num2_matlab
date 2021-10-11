clc;
close all;
clear all;
format compact;

n = 11;
% n = 20;
a = -1;
b = 1;

C = input('select scenario [1,2]: ' );
switch C
    case 1 % äquidistante Stützstellen
        x = linspace(a,b,n);
    case 2 % Tschebyscheff Stützstellen
        for i = 1:n
            x(i) = cos(pi * ((2*i+1) / (2*n+2)));
        end
end

% zu interpolierende Funktion
f = @(x) (1./(1+25*x.^2));

% Auswertestellen
x_eval = linspace(-1,1);

% Position der Stützstellen plotten
figure('Name','Verteilung der Stützstellen');
plot(x,1,'*r')

% zu interpolierende Funktion plotten
fx = f(x_eval);
figure('Name','zu interpolierende Funktion');
plot(x_eval,fx,'-g')
grid on
legend('fx')

% Interpolationspolynom plotten 
% Koeffizienten a mit NewtonInterpolation bestimmen
% Auswertung an length(x_eval) Stellen des Interpolationspolynoms mit HornerNewton 
fx = f(x);
a = NewtonInterpolation(x,fx);
[fx_hn,dfx] = HornerNewton(a,x_eval,x);
figure('Name','Interpolationspolynom HornerNewton');
plot(x_eval,fx_hn,'-b')

% Interpolationspolynom mit AitkenNeville auswerten ohne aufstellen
% Achtung! AitkenNeville verträgt immer nur einen Punkt x0 auf einmal
for i = 1 : length(x_eval)
    fx_an(i) = AitkenNeville(x,fx,x_eval(i));
end
figure('Name','Interpolationspolynom AitkenNeville');
plot(x_eval,fx_an,'-y')


