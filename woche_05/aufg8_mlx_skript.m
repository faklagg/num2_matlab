clear all
%*** Problem Daten
n = 8;                     % wähle Anzahl der Stuetzstellen
f = @(x) sin(2*pi*x); x = sort(rand(n,1));  % Beispiel 1
% f = @(x) sin(2*pi*x); x = linspace(-pi,pi,n)' ;  % Beispiel
%
% f = @(x) (x>1/2); x = linspace(0,1,n)';    % Beispiel 2
y  = f(x);                 % berechne Funktionswerte abhängig von f
%*** bilde Differenzvektoren h(i) = x(i+1)-x(i), etc.
h  = x(2:end)- x(1:end-1);
dy = y(2:end)- y(1:end-1);
%*** stelle Matrix und rechte Seite auf
% nur A durch spdiags gefuellt gilt nur für periodische Randbedingung!!!
% um andere RB zu realisieren muessen die entsprechenden werte der 
% ersten und letzten Zeile nachgelagert ueberschrieben werden!!
A = spdiags([h(2:end),2*(h(1:end-1)+h(2:end)),h(1:end-1)],-1:1,n-2,n-2);
% fuer andere RB muss erste und letzte Zeile von rhs ueberschrieben werden
rhs = 6*(dy(2:end)./h(2:end)-dy(1:end-1)./h(1:end-1));
%*** loese LGS und packe fehlende Daten an den Endpunkten hinzu
y2 = [0;A\rhs;0];          
%*** plotte Loesung
s = linspace(0,1,100)';
figure
plot(x,y,'g.',s,f(s),'k-','markersize',22)
hold on
for i = 1:n-1               % Schleife über alle Intervalle
  %*** bestimme Koeffizienten a,b,c,d
  abcd = [     0,      0, -1/(6*h(i)), 1/(6*h(i)); ...
               0,      0,         1/2,          0; ...
         -1/h(i), 1/h(i),     -h(i)/3,    -h(i)/6; ...
               1,      0,           0,          0] * [y(i:i+1);y2(i:i+1)];
  xi = x(i) + s * h(i);                % bilde [0,1] auf [x(i),x(i+1)] ab       
  fxi = ((s*h(i)).^(3:-1:0))*abcd;     % werte s auf [x(i),x(i+1)] aus
  plot(xi,fxi,'r-')       
end
hold off