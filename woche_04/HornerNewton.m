function [fx,dfx] = HornerNewton(a,x0,x)

% evaluate Newton polynom
% p(x0) = a(1) + a (2) *(x0 -x(1) ) + a(3) *(x0 -x(1) )*(x0 -x(2) ) + 
% ...
%       = a(1) + ( (x0 -x(1) ) * ( a(2) + (x0 -x(2)) * ( a(3) ....
% at given x0 (can be vector of evaluation points)
% x is vector of interpolationpoints

dfx = 0;
fx = a(end);

% Gedacht wird die das Array von links nach rechts 
% und von unten nach oben ausgefüllt (Dreiecksschema)
% die vorherigen Werte werden hier allerdings überschrieben
% so wwird nur der letzte wert ausgegeben.

for i = length(a)-1:-1:1 
    dfx = fx + (x0-x(i)).*dfx;
    fx = a(i) + fx.*(x0-x(i));
end