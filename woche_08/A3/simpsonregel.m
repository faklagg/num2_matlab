function val = simpsonregel(f,a,b,n)
% f = funktion
% a = linke Intervallgrenze
% b = rechte Intervallgrenze
% n = Anzahl Teilintervalle

x = linspace(a,b,n+1);
sum = 0;

S = @(a,b,m) ((b-a)/6)*(f(a)+4*f(m)+f(b));
for i=1:length(x)-1
    m = (x(i+1)+x(i))/2;
    a = x(i);
    b = x(i+1);
    S(a,b,m);
    sum = sum + S(a,b,m);
end
val = sum;
end