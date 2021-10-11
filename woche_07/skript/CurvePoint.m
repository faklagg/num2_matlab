function value = CurvePoint (p ,U ,P ,t )
% compute point on B- spline curve
span = FindSpan(p,U,t);
B = BasisFunc(span,p,U,t);
value = 0*P(:,1);
for i =0:p
    value = value + B(i+1) * P(:,span-p+i);
end