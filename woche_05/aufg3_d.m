clc;
close all;
clear all;
format compact;

a = -1;
b = 1;
x_eval = linspace(a,b,501);

% zu interpolierende Funktion
f = @(x) (1./(1+25*x.^2));
fx_org = f(x_eval);

% ||s-f||_inf (Maximumsnorm spline - function)
max_anz_stuetz = 200;
x_axis = linspace(2,max_anz_stuetz,max_anz_stuetz);
fehler = zeros(max_anz_stuetz,1);

for n = 2 : max_anz_stuetz
    x = linspace(a,b,n)'; % Achtung Spaltenvektor!
    fx = f(x);
    C = CoeffSpline(x,fx,'nat',[0;0]);
    sfx = evalSpline(x,C,x_eval);
    % Fehlerberechnung
    max_fehler = max(abs(fx_org - sfx));
    fehler(n,1) = max_fehler;
end

%%Plot n=11
n = 11;
figure
subplot(2,1,1)
% Ausgangsfunktion
plot(x_eval,fx_org,'-r')
hold on
x = linspace(a,b,n)'; % Achtung Spaltenvektor!
fx = f(x);
C = CoeffSpline(x,fx,'nat',[0;0]);
axis([a b 0 1.5])
% Splines für jedes Teilintervall
for i=1:length(C(1,:))
%     Aufstellen der Monomialbasis mit dem Koeffizientenvektor für alle Abschnitte
    f = @(r) C(4,i)*(r-x(i)).^3+C(3,i)*(r-x(i)).^2+C(2,i)*(r-x(i)).^1+C(1,i)*(r-x(i)).^0;
    fx = f(x_eval);
    plot(x_eval,fx,'--');
    hold on;    
end
legend('Ausgangsfkt. Runge','splines')

subplot(2,1,2)
semilogy(x_axis,fehler)
xlabel('Anzahl Stützstellen n')
ylabel('maximaler absoluter Fehler')
legend('abs. Fehler Splineinterpolation')
grid on
title('max Fehler des Splines über Anzahl Stützstellen n')