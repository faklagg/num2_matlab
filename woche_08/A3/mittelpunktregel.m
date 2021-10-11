function val = mittelpunktregel(f,a,b,n)
% f = funktion
% a = linke Intervallgrenze
% b = rechte Intervallgrenze
% n = Anzahl Teilintervalle

h = (b-a)/n;
sum = 0;
for i=1 : n
    sum = sum + f(a-h/2+i*h);
end
val = h * sum;
end 