close all;
clear all;
clc;
format compact;

f = @(x) (1/(2*pi))*sin(pi*x);
x = linspace(-1,1);
fx_org = f(x);
x_stuetz = [-1,0,1];
fx_stuetz = f(x_stuetz);

figure
plot(x,fx_org)
hold on
plot(x_stuetz,fx_stuetz,'*r')

A = [0,0,0,1;
    1,0,0,0;
    0,0,1,0;
    3,2,1,0];
stuetz1 = [0,0,-0.5,0.5]';
stuetz2 = [0,0,0.5,-0.5]';
abcd1 = flip(A\stuetz1);
abcd2 = flip(A\stuetz2);

C = [abcd1,abcd2];
% l = [-0.25,0.75,-0.5,0]';
% m = [-0.25,0,0.25,0]';
% C = [l,m];

for i=1:length(C(1,:))
%     Aufstellen der Monomialbasis mit dem Koeffizientenvektor für alle Abschnitte
    f = @(r) C(4,i)*(r-x_stuetz(i)).^3+C(3,i)*(r-x_stuetz(i)).^2+C(2,i)*(r-x_stuetz(i)).^1+C(1,i)*(r-x_stuetz(i)).^0;
    fx = f(x);
    plot(x,fx,'--');
    hold on;    
end
legend('fkt org','fkt stuetz','s1','s2')



