close all;
clear all;
clc;
format compact;

f = @(x) (2*x)/(x^2+1);
g = @(x) log(x^2+1); % log zur basis e
% log(5) fuer x = 2

t = 2;
gt = g(t)

anz_teilintervalle = 2;
x = linspace(0,2,anz_teilintervalle+1)
sum = 0;

S = @(a,b,m) ((b-a)/6)*(f(a)+4*f(m)+f(b));
for i=1:length(x)-1
    m = (x(i+1)+x(i))/2;
    a = x(i);
    b = x(i+1);
    S(a,b,m)
    sum = sum + S(a,b,m);
end

sum

fehler = abs(sum - gt)

% weniger Teilintervalle als A1ii trotzdem geringerer Fehler