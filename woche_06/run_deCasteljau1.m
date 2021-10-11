clear all;
close all;
clc;

P = [0,1,2,3;0,-1,4,3];
% P = [0,0,4;0,2,4];
% P = [0,0,-4;0,2,0];
t = linspace(0,1,100);
% t = 0.5;
for k = 1:length(t)
    C(:,k) = deCasteljau1(P,t(k));
end
plot(C(1,:),C(2,:),'k-', P(1,:),P(2,:),'r*:');
 