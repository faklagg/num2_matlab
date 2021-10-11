function x1 = NewtonMethode(x0,func,epsilon)
%Initialisierung
syms x;
fx0 = subs(func,x0); 
while abs(fx0) > epsilon
    fs = diff(func,x);
    fsx0 = subs(fs,x0);
    x1 = x0 - fx0/fsx0;
    fx1 = subs(func,x1);
    x0 = x1;
    fx0 = fx1;
end