close all;
clear all;
clc;

res = 100;
% Punkte Kontrollpolygon
% P = [0,1,2,3;0,-1,4,3];

% P = [0,1;0,1];
% P = [0,1,2;0,1,-1];
% P = [0,1,2,3;0,1,-1,1];
% P = [0,1,2,3,4;0,1,-2,2,-1];
P = [0,1,2,3,4,5;0,1,-3,4,-2.5,1];

% testpunkt
% P = [0,1,1,2,3,4,5;0,1,1,-3,4,-2.5,1];

t = linspace(0,1,res);

for k = 1:length(t)
    C(:,k) = deCasteljau1(P,t(k));
end
plot(C(1,:),C(2,:),'k-', P(1,:),P(2,:),'r*:');
hold on; 

% Linie plotten
t = linspace(P(1,1)-1,P(1,end)+1,res);
h = @(x) (x-x)+0.1;
ht = h(t);
plot(t,ht);
hold on;


