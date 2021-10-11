close all;
clear all;
clc;
format compact;
% format long;

%% Grad
n = 3

%% Ausgabe der Matrizen für die Legendre Polynome 
% und die Koeffizienten a
% Legendre Polynome in monomialer Form spalte mit absteigenden potenzen
[p, A] = LegendreCoeffs_n(n)

%% zu approximierende Funktion
f = @(x) sin(x);
a = -1;
b = 1;
n_iter = 1000;

%% Berechnung von d und alpha
d = calc_d(n,p,f,n_iter,a,b)
alpha = inv(A)*d
% alpha = A\d       aequivalent zu Zeile 18 

%% Approximationsfunktion g bilden 
gn=0;
for i = 0:n
    gn = gn + alpha(i+1,:)*p(i+1,:);
end

for i = 1:n_iter+1
    leg_val(i,1) = a + (i-1)*((b-a)/n_iter);
    leg_val(i,2) = polyval(gn, a + (i-1)*((b-a)/n_iter));
end

%% Fehler an jeder Stelle ausrechnen
for i = 1:n_iter+1
    error(i,1) = a + (i-1)*((b-a)/n_iter);
    error(i,2) = abs(f(a + (i-1)*((b-a)/n_iter)) - polyval(gn, a + (i-1)*((b-a)/n_iter)));
%     error(i,2) = f(a + (i-1)*((b-a)/n_iter)) - polyval(gn, a + (i-1)*((b-a)/n_iter));
end


%% Plotting
figure 
subplot(2,1,1)
plot(linspace(a,b,n_iter), f(linspace(a,b,n_iter)))
hold on
plot(leg_val(:,1), leg_val(:,2))
hold on
axis([-1 1 -1 1])
legend('sin(x)', 'Legendre')

subplot(2,1,2)
plot(error(:,1), error(:,2))
legend('Fehler absolut')








