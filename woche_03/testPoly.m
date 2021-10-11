clc;
clear all;
close all;

C = input('select scenario [1,2]: ' );

switch C

    case 1
%         p = @(x) 0;
%         q = @(x) 4*x^2-3;
        a = [0];
        b = [-3;0;4];
%         Eingabe als Spaltenvektor der Koeffizienten 
%         erster Eintrag x^0 dann x^1 usw.
%         Achtung Nullen müssen gefüllt sein
    case 2
%         p = @(x) 2*x^2-3*x;
%         q = @(x) -2*x^2+3*x;        
        a = [0;-3;2];
        b = [0;3;-2];
%         Eingabe als Spaltenvektor der Koeffizienten 
%         erster Eintrag x^0 dann x^1 usw.
%         Achtung Nullen müssen gefüllt sein        
end

% [c] = poly_add(a,b)
% [c] = poly_mult(a,b)
[c] = poly_derivative(a)