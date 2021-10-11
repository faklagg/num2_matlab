close all;
clear all;
clc;

vx = linspace(-1.5,1.5,100);
vy = linspace(-5,2,100);
[X,Y] = meshgrid(vx,vy);

F = rosen(X,Y);
 
% for i = 1:length(vx)
%     for j = 1:length(vy)
%         %F(j,i) = rosen(X(j,i),Y(j,i));
%         %F(j,i) = 100*(Y(j,i)-X(j,i)^2)^2+(1-X(j,i))^2;
%     end
% end

figure('Name','Rosenbrock function')
surf(X,Y,F)
shading flat
figure('Name','contour of Rosenbrock function')
contour(X,Y,F,logspace(-2,3,20))
% contour(X,Y,F,[1e-2,0.02,0.05,0.1,0.5,1,10,50,100,600,1000])
colorbar
