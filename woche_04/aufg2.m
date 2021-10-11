clc;
clear;
close;

% vandermonde-matrix
v_x = [1,1,1,1,1 ; 0,1,2,3,4 ; 0,0,2,6,12 ; 1,2,4,8,16 ; 0,1,4,12,32];
a = [];
fx = [3;4;6;7;0];

a = v_x\fx

x = linspace(-1,3,100);
f = @(x) 3-4*x+3*x.^2+2*x.^3-x.^4;
f_1s = @(x) -4+6*x+6*x.^2-4*x.^3;
f_2s = @(x) 6+12*x-12*x.^2;

f0 = f(x);
f1 = f_1s(x);
f2 = f_2s(x);

figure
plot(x,f0)
hold on
plot(x,f1)
plot(x,f2)

xlabel("x")
ylabel("y")
legend("f0","f1","f2")