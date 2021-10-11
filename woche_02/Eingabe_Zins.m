clear all;

n=48;
K0=10000;
R=250;
f=@(m) (m*K0-R)*(1+m)^n+R;

%[Nullstelle,it_wert] = BisektionsMethode(eps ,1,f,1e-7)
%[Nullstelle,it_wert] = RegulaFalsi(1e-5,0.1,f,1e-7)
%[x1,it_wert] =  SekantenMethode (1e-2,0.1 ,f,1e-7)

Df=@(m) K0*(1+m)^48+(K0*m-R)*48*(1+m)^47;

%[x,nit,it_wert] = NewtonSimple(0.1,f,Df,1e-7,500)