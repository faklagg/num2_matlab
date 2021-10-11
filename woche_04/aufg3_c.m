clc;
close all;
clear all;
format compact;

a = -1;
b = 1;

x_eval = linspace(-1,1,501);

% zu interpolierende Funktion
f = @(x) (1./(1+25*x.^2));
fx_org = f(x_eval);

% ||P-f||_inf
max_anz_stuetz = 200;
x_axis = linspace(2,max_anz_stuetz,max_anz_stuetz);
fehler = zeros(max_anz_stuetz,4);

for n = 2 : max_anz_stuetz
    % äquidistante Stützstellen
    x = linspace(a,b,n);
    fx = f(x);
    a_hn = NewtonInterpolation(x,fx);
    [fx_hn,dfx] = HornerNewton(a_hn,x_eval,x);
    
    max_fehler = max(abs(fx_org - fx_hn));
    fehler(n,1) = max_fehler;
    
    for i = 1 : length(x_eval)
        fx_an(i) = AitkenNeville(x,fx,x_eval(i));
    end
    
    max_fehler = max(abs(fx_org - fx_an));
    fehler(n,2) = max_fehler;
    
    % Tschebyscheff Stützstellen
    for i = 1:n
        x(i) = cos(pi * ((2*i+1) / (2*n+2)));
    end
    fx = f(x);
    a_hn = NewtonInterpolation(x,fx);
    [fx_hn,dfx] = HornerNewton(a_hn,x_eval,x);
    
    max_fehler = max(abs(fx_org - fx_hn));
    fehler(n,3) = max_fehler;
    
    for i = 1 : length(x_eval)
        fx_an(i) = AitkenNeville(x,fx,x_eval(i));
    end
    
    max_fehler = max(abs(fx_org - fx_an));
    fehler(n,4) = max_fehler;
end 

figure
semilogy(x_axis,fehler(:,1),'x-r')
hold on
semilogy(x_axis,fehler(:,2),'*-g')
hold on
semilogy(x_axis,fehler(:,3),'o-b')
hold on
semilogy(x_axis,fehler(:,4),'^-y')
xlabel('Anzahl Stützstellen n')
ylabel('maximaler absoluter Fehler')
legend('äqui HornerNewton','äqui AitkenNeville','Tscheb. HornerNewton','Tescheb. AitkenNeville')
grid on
title('max Fehler des Interpolationspolynoms P über Anzahl Stützstellen n')