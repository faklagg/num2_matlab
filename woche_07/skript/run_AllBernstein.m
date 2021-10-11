close all
clear all
clc

f = @(x) abs(x(:)-0.5);

n = 2; 

res = 101;
t = linspace(0,1,res);
B = zeros(n+1,res);
for k=1:res
    B(:,k) = AllBernstein(n,t(k));
end
ft = f(t);
Bf = B'*f(linspace(0,1,n+1));
min(Bf)
plot(t,ft,'r-',t,Bf,'k:')

