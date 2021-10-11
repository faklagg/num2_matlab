function [u,nit] = newton(u,F,DF,tol,maxit,param)
Fu = F(u,param);
DFu = DF(u,param);
s = -DFu\Fu; %\Fu = Fu/-DFu löst LGS
lam = 1;
tmp = max(tol,tol*norm(s));
nit = 0;
while norm(s) > tmp && nit <= maxit
    nit = nit + 1;
    u_old = u;
    lam = min(1,2*lam);
    for k = 1:30
        u = u_old + lam * s; %Daempfung mit Parameter lam
        Fu = F(u,param);
        if norm(DFu\Fu) <= (1-lam/2) * norm(s
            break       %Abbruch der for-Schleife, falls
        end             % Konvergenztest erfuellt
        lam = lam/2;    %lam noch zu gross --> halbieren
    end
    DFu = DF(u,param);
    s = -DFu\Fu;
end
    