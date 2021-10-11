close all;
clear all;
clc;
format compact;
format long;

g = @(x) cos(x);
n=2;         % Anzahl der Stuetzstellen

[weights, nodes, kn] = GaussQuadratur(n, 'log')
% weights
% nodes 
% kn


sum=0;
for i=1:n
    sum = sum + weights(i) * g(nodes(i));
end

sum

