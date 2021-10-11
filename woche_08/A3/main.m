close all;
clear all;
clc;

%% i) [-1,1] Integral f = pi

% erg = pi;
% a = -1;
% b = 1;
% f = @(x) 2/(1+x^2);

%% ii) [0,1] Integral g = e-1

erg = exp(1)-1;
a = 0;
b = 1;
f = @(x) exp(x);


%% Fehlerberechnung

i_max = 10;
fehler = zeros(i_max+1, 4);

for i=0:10
    n = 2^i;
    fehler(i+1,1) = n;
    fehler(i+1,2) = abs(erg-mittelpunktregel(f,a,b,n));
    fehler(i+1,3) = abs(erg-trapezregel(f,a,b,n));
    fehler(i+1,4) = abs(erg-simpsonregel(f,a,b,n));
end

%% Plots

figure
loglog(fehler(:,1), fehler(:,2),'ro-')
hold on 
loglog(fehler(:,1), fehler(:,3),'gx-')
hold on 
loglog(fehler(:,1), fehler(:,4),'b^-')
grid on
xlabel('Anzahl der Teilintervalle')
ylabel('absoluter Fehler')

legend('Fehler Mittelpunkt', 'Fehler Trapez', 'Fehler Simpson')