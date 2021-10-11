function C = deCasteljau1(P,t)
% Compute point on a bezier curve using Casteljau
% *** P = d x no of control points
for k = 1:size(P,2)-1
    for i=1:size(P,2)-k
        P(:,i) = (1-t)*P(:,i) + t*P(:,i+1);
    end
end
C = P(:,1);