clc;
close;
clear;

a = [2 1 3 -4];
x = [1 -1 2];



% wähle ein x0
% t = 3;
% t = 4;
t = [3;4];

% Funktionsaufruf 
[fx,dfx] = HornerNewton(a,x,t)