clc;
close all;
clear all;
% format compact;

n = 11;
% n = 200;
a = -1;
b = 1;

C = input('select scenario [1,2]: ' );
switch C
    case 1 % äquidistante Stützstellen
        x = linspace(a,b,n);
        name = 'P(x) mit äquidistanten Stützstellen';
    case 2 % Tschebyscheff Stützstellen
        for i = 1:n
            x(i) = cos(pi * ((2*i+1) / (2*n+2)));
        end
        name = 'P(x) mit Tschebyscheff Stützstellen';
end

% zu interpolierende Funktion
f = @(x) (1./(1+25*x.^2));

% Auswertestellen
x_eval = linspace(-1,1,100);
 
% Koeffizienten a mit NewtonInterpolation bestimmen
% Auswertung an length(x_eval) Stellen des Interpolationspolynoms mit HornerNewton 
fx = f(x);
a = NewtonInterpolation(x,fx);
[fx_hn,dfx] = HornerNewton(a,x_eval,x);

% Interpolationspolynom mit AitkenNeville auswerten ohne aufstellen
% Achtung! AitkenNeville verträgt immer nur einen Punkt x0 auf einmal
for i = 1 : length(x_eval)
    fx_an(i) = AitkenNeville(x,fx,x_eval(i));
end

% Plotten
% figure('Name',name)
figure

% Position der Stützstellen plotten
% plot(x,linspace(1,1,length(x)),'*r')
plot(x,fx,'*r')
hold on 

% zu interpolierende Funktion plotten
fx = f(x_eval);
plot(x_eval,fx,'-m')
hold on 

% Interpolationspolynom HornerNewton plotten
plot(x_eval,fx_hn,'*-g')
hold on 

% Interpolationspolynom AitkenNeville plotten
plot(x_eval,fx_an,'-b')

% legend('Vert. Stützstellen', 'Originalfunktion', 'Interpolationspolynom HornerNewton', 'Interpolationspolynom AitkenNeville')
set(gcf,'color','white')
legend('Vert. Stützstellen', 'Originalfunktion', 'P(x) HornerNewton', 'P(x) AitkenNeville')
% legend('Originalfunktion', 'P(x) HornerNewton', 'P(x) AitkenNeville')
xlabel('x')
ylabel('fx')
grid on
title(name)