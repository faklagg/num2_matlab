function [weights,nodes,kn] = GaussQuadratur(anz_Gewichte,typ)
  N = 2 * anz_Gewichte+1;         % Anzahl benoetiger Momente
  switch typ
    case 'legendre'
      momente = 2./(1:N); momente(2:2:end) = 0;    
    case 'tschebyscheff'
      momente = [pi,0,pi/2];
      for j= 2:anz_Gewichte
        momente = [momente,0,momente(end)*(2*j-1)/(2*j)];
      end
    case 'laguerre'
      momente = factorial(0:N-1);
    case 'hermite'
      momente = gamma((1:N)./2); momente(2:2:end) = 0; 
    case 'log'
      momente = (1./(1:N)).^2;   
    otherwise
      disp('Nur "legendre", "tschebyscheff", ', ...
           '"laguerre", "hermite", "log" moeglich!')
      return
  end
  [weights,nodes,kn] = GaussWeightsNodes(momente);
end