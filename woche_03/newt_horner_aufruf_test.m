close;
clear;
clc;

x = linspace(0,2,3);
a = NewtonInterpolation(x,x.^2)
HornerNewton(a,2,x)

% x = linspace(0,1,5);
% a = NewtonInterpolation(x,sin(x))
% sqrt(3)/2 - HornerNewton(a,pi/3,x)

% x = linspace(0,2,3);
% f = @(x) 2*x.^4-x.^3-x-18;
% a = NewtonInterpolation(x,f(x))
% HornerNewton(a,2,x)