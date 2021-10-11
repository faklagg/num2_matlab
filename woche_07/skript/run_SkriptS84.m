close all;
clear all;
clc;

% P = Stuetzpunkte
% p = grad des Splines
% U = Knotenvektor

P = [0,1,5,5;
     0,2,0,1];
U = [0,0,0,0,1,1,1,1];
p = 3;
s = linspace(U(1),U(end),201);
for k = 1:length(s)
    C(:,k) = CurvePoint(p,U,P,s(k));
end
plot(C(1,:),C(2,:),'-',P(1,:),P(2,:),'o:');
hold on
for j = 1:25:length(s)
    V = CurveDerivs(p,U,P,s(j),1);
    quiver(V(1,1),V(2,1),0.2*V(1,2),0.2*V(2,2));
end