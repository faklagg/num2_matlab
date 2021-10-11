function coeff = CoeffSpline(t,y,kind,param)
% t = stuetzstellen
% y = stuetzwerte
% kind = art der Randbedingung
% param = Wert der Randbedingung am Intervallanfang/ende 

% param (1,1)=f '(a) bzw . f ' '(a) ( abhaengig von der Wahl von kind )
% param (2,1)=f '(b) bzw . f ' '(b)
n = length(t);
dy = y(2:end)-y(1:end-1);

%% Berechnung des " Kerns " von A und b
h1 = t(2:n)-t(1:n-1);
h2 = t(3:end)-t(1:end-2);
A = sparse(n,n);
B = [h1,[2*h2;0],[h1(2:end);0]];
A(2:n-1,:)= spdiags(B,[0,1,2],n-2,n);
b = zeros(n,1);
b(2:n-1)=6*((y(3:n)-y(2:n-1))./h1(2:n-1) - (y(2:n-1)-y(1:n-2))./h1(1:n-2));

%% Erweiterung von A und b fuer unterschiedliche Randbedingungen
switch kind
    case 'nat' % natuerlich
        A(1,1)=1; A(n,n)=1;
        b(1)=param(1); b(end)=param(2);
    case 'per' % periodisch
        if y(1) ~= y( end)
            error ('This data is not applicable for periodic splines ')
        end
        A(1,[1,2,n-1])=[2*(h1(1)+h1(end)),h1(1),h1(end)];
        A(n,[1,n])=[1,-1];
        b(1) =6*((y(2)-y(1))/h1(1) -(y(1)-y(end -1))/h1(end));
    case 'compl' % komplett / hermite
        A(1,[1,2])=[2*h1(1),h1(1)];
        A(n,[n-1,n])=[h1( end) ,2*h1( end)];
        b(1)=6*(y(2)-y(1)-param(1));
        b(n)=-6*(y(end )-y(end -1)+param(2));
    otherwise
        error ('This kind does not exist !')
end

%% Berechnung der y''
y2d=A\b;

%% Berechnung der Koeffizienten a,b,c,d
coeff = [ y(1:end-1) , ...
        (y(2:end)-y(1:end-1))./h1(1:end)-h1(1:end).*(y2d(2:end)+2*y2d(1:end-1))/6 , ... 
        y2d(1:end-1)/2 , ...
        (y2d(2:end)-y2d(1:end-1))./(6*h1(1:end)) ]';
% Reihenfolge der Zeilen : d,c,b,a
