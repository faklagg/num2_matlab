function PK = CurveDerivPts(p,U,P,d,r1,r2)
% compute control points of curve derivatives
r = r2-r1;
for i =1:r+1
    PK(:,1,i)= P(:,r1+i);
end
for k =2:d+1
    tmp = p-k+2;
    for i =1:r-k+2
        PK(:,k,i)= tmp *(PK(:,k-1,i+1) - PK(:,k-1,i)) ...
            /(U(r1+i+p+1)-U(r1+i+k-1));
    end
end