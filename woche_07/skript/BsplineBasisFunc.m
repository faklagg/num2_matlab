function value = BsplineBasisFunc(U,t)
%*** given a node-vector, 
%    computes the spline-function of maximal degree
  if t < U(1) | t > U(end)
    value = 0;
  else
    p = length(U)-2;
    if p<0 
      error('Error. \nLenght of first argument must be at least two.');
    end
    N = double( t >= U(1:end-1)  &  t < U(2:end) );
    for k = 1 : p 
      for j = 1 : (p - k + 1) 
        if U(j+k) > U(j) 
          left = ( t-U(j) ) / ( U(j+k) - U(j) );
        else
          left = 0.0;
        end  
        if U(j+k+1) > U(j+1) 
          right = ( U(j+k+1) - t ) / ( U(j+k+1) - U(j+1) ) ;
        else
          right = 0.0;
        end
        N(j) = left * N(j) + right * N(j+1);
      end
    end
    value = N(1);
  end
  
end

