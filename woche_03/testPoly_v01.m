clc;
clear all;
close all;

C = input('select scenario [1,2]: ' );

% switch C
% 
%     case 1
%         p = @(x) 0;
%         q = @(x) 4*x^2-3;
%     case 2
%         p = @(x) 2*x^2-3*x;
%         q = @(x) -2*x^2+3*x;        
% end

syms x;

switch C

    case 1
        p = 0;
        q = 4*x^2-3;
    case 2   
        p = 2*x^2-3*x;
        q = -2*x^2+3*x;        
end

try 
    [c1,t1] = coeffs(p)
    [c2,t2] = coeffs(q)
catch
    fprintf('something went wrong\n');
end


% [c] = poly_add(p,q);