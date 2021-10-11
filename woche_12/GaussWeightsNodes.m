function [weights,nodes,kn] = GaussWeightsNodes(momente)
n = (length(momente)+1)/2;
% Orth.polynome und Koeff. mit 3-Term-Rekursion bestimmen
% p_k = ( x - bb_(k-1) ) * p_(k-1) - cc_(k-1) * p_(k-2)
h(1) = momente(1);                % h  = ( p_k , p_k )
hx(1) = momente(2);               % hx = ( x * p_k , p_k )
bb(1) = hx(1)/h(1);
p{1} = 1; 
p{2} = [-bb(1);1];
for k = 3:n                      % best. p_k mit 3-Term-Rekur.
  q = conv(p{k-1},p{k-1});       % ber.  q = p_(k-1) * p_(k-1) 
  h(k-1) = integ(q,momente);     % ber.  int_a^b omega*q dx 
  hx(k-1) = integ([0;q],momente);% ber.  int_a^b omega*x*q dx
  bb(k-1,1) = hx(k-1)/h(k-1);    % best. Koeff. vor p_(k-1)
  cc(k-1,1) = h(k-1)/h(k-2);     % best. Koeff. vor p_(k-2)
  p{k} = [0;p{k-1}]-bb(k-1)*[p{k-1};0]-cc(k-1) * [p{k-2};0;0];                   
end
if length(bb)==1                 % sym. Matrix A aufstellen
  A = bb;
else
  A = full(spdiags([[sqrt(cc(2:end));0],bb,sqrt(cc)],...
      [-1 0 1],n-1,n-1));
end
[V,D] = eig(A);                  % Eigenwerte bestimmen
nodes = diag(D);                 % Quad.pkte EW von A
weights = zeros(n-1,1);          % Quad.qewichte skalierte 
for k = 1:n-1                    % Skalarprodukte der EV
  weights(k) = momente(1) * V(1,k)^2 / (V(:,k)' * V(:,k));
end
kn = integ(conv(p{n},p{n}),momente); % Koeff. im Fehlerterm
% Integral auswerten
  function r = integ(p,momente)
    r = (p(:))'*momente(1:length(p))';
  end
end