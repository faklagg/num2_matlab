close all;
clear all;
clc;

t = [0 1 2 3]';
y = [1 2 7 13]';
x = [0.5 0.75 2.5]';
C = CoeffSpline(t,y,'nat',[0 0]');
sfx = evalSpline(t,C,x)

xp = linspace(t(1),t(end));
figure

for i=1:length(C(1,:))
%     Aufstellen der Monomialbasis mit dem Koeffizientenvektor für alle Abschnitte
    f = @(r) C(4,i)*(r-t(i)).^3+C(3,i)*(r-t(i)).^2+C(2,i)*(r-t(i)).^1+C(1,i)*(r-t(i)).^0;
    fx = f(xp);
    plot(xp,fx);
    hold on;
end

plot(t,y,'*');
plot(x,sfx,'o');
legend('spline 0-1','spline 1-2','spline 2-3','Stuetzstellen','Horner Stellen');
