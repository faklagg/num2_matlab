function val = trapezregel(f,a,b,n)
% f = funktion
% a = linke Intervallgrenze
% b = rechte Intervallgrenze
% n = Anzahl Teilintervalle

h = @(a,b,i,n) f(a+i*((b-a)/n));

sum = 0;
for i=1:n-1
    sum = sum + h(a,b,i,n);
end
val = ((b-a)/n)*(f(a)/2+f(b)/2+sum);
end