function [p,  A] = LegendreCoeffs_n(n)
% n = Grad des Legendre Polynoms 
% n = 3;
a = -1;
b = 1;

%% initialisieren der gegebenen Polynome
len = n+1;
p0 = zeros(1,len);
p0(1,end) = 1;
p1 = zeros(1,len);
p1(1,end-1) = 1;
p = zeros(len,len);
p(1,:) = p0;
p(2,:) = p1;


%% Rekursionsvorschrift zur Berechnugn der Legendre Polynome 
% i = grad, n = maximaler grad
% Achtung! nicht mit den Indizes durcheinanderkommen!

for i = 2:n
%     p_temp_1 = ((2*(i-1)+1)/((i-1)+1))*circshift(p(i,:),-1)
%     p_temp_2 = ((i-1)/(i-1+1))*p(i-1,:)
%     p(i+1,:) = p_temp_1 - p_temp_2
    p(i+1,:) = ((2*(i-1)+1)/((i-1)+1))*circshift(p(i,:),-1) - ...
                ((i-1)/(i-1+1))*p(i-1,:);
end


%% Integration des Intervalls zur Bestimmung der Koeffizienten a(i,j)
A = zeros(len,len);
for i=1:len
    for j=1:len
        A(i,j) = diff(polyval(polyint(conv(p(i,:), p(j,:))),[a b]));
        % integral von -1 bis 1 P^2 nten grades dx = 2/(2n+1) n=0,1,2,...
    end
end


end