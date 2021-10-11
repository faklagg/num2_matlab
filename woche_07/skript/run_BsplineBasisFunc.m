close all;
clear all;
clc;
res = 101;

% U = [0,1,2,3,4]
U = [0,1,2,2.1]
t = linspace(min(U)-1,floor(max(U)+1),res);

for j=1:length(t)
  ft(j) = BsplineBasisFunc(U,t(j));
end
for j=1:length(U)
  fU(1,j) = BsplineBasisFunc(U,U(j));
end
h = plot(t,ft,'linewidth',2,'color','r')
hold on
plot(xlim,0*xlim,'k-')
plot([1;1]*U,[0;1]*fU,':', ...
     'markersize',35,'linewidth',1,'color','r')
plot(U,0*U,'.', ...
     'markersize',35,'color','r')
hold off
axis([min(t),max(t),-0.5,1.5])





