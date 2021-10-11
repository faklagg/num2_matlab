close all;
clear all;
clc;
format compact;

f = @(x) (2*x)/(x^2+1);
g = @(x) log(x^2+1); % log zur basis e
% log(5) fuer x = 2

t = 2;
gt = g(t)

anz_teilintervalle = 4;
x = linspace(0,2,anz_teilintervalle+1)
sum = 0;
for i=1:length(x)-1
    sum = sum + (x(i+1)-x(i))/2*(f(x(i))+f(x(i+1)));
end
sum

a = 0;
b = 2;
n = 4;
% h = (b-a)/n;
h = @(a,b,i,n) f(a+i*((b-a)/n));

sum = 0;
for i=1:n-1
    sum = sum + h(a,b,i,n);
end
sum = ((b-a)/n)*(f(a)/2+f(b)/2+sum)

fehler = abs(sum - gt)


