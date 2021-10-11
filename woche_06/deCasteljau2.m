function S = deCasteljau2(P,s,t)
% Compute a point on a Bezier surface
n = size(P,2); 
m = size(P,3);
if n <= m
    for j = 1:m
        Q(:,j) = deCasteljau1(squeeze(P(:,:,j)),s);
    end
    S = deCasteljau1(Q,t);
else
    for i = 1:n
        Q(:,1) = deCasteljau1(squeeze(P(:,i,:)),t);
    end
    S = deCasteljau1(Q,s);
end