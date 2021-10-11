function CK = CurveDerivs(p,U,P,t,d)
% Compute curve derivatives
du = min(d,p);
CK(1:size(P,1) , [p+2:d+1]) = 0;
span = FindSpan(p,U,t);
N = AllBasisFunc(span,p,U,t);
PK = CurveDerivPts(p,U,P,du,span-p-1,span-1);
for k =1:du+1
    CK(:,k) = 0;
    for j=1:p-k+2
        CK(:,k) = CK(:,k) + N(j,p-k+2) * PK(:,k,j);
    end
end