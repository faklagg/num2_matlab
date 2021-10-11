clc;
clear all;
close all;

C = input('select scenario [1,2,3,4]: ' );

vx = linspace(-1.5,1.5,100);
vy = linspace(-5,2,100);
[X,Y] = meshgrid(vx,vy);

F = rosen(X,Y);

tol = 1e-10;
maxit = 1000;

switch C

    case 1
        x_i = [-1.5 , 1.5];
        x = x_i.';
    
    case 2
        x_ii = [-1 , 1];
        x = x_ii.';
        
    case 3
        x_iii = [-1 , 4];
        x = x_iii.';
    
    case 4
        x_iv = [1.4 , -4];
        x = x_iv.';
end

figure('Name','contour of Rosenbrock function')
contour(X,Y,F,logspace(-2,3,20))
hold on
plot(x(1,1),x(2,1),'-g*')
hold on

[it_itx1_itx2_fehls] = Newton_ndim(x,tol,maxit)

plot(it_itx1_itx2_fehls(:,2),it_itx1_itx2_fehls(:,3),'-r*')
text(-1,-4,[num2str(it_itx1_itx2_fehls(end,1),'%2.1d') ' Iteration Steps']);
colorbar
% figure('Name','Rosenbrock function')
% surf(X,Y,F)
% shading flat
