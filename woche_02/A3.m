clc;
clear all;
close all;

C = input('select scenario 1 or 2: ' );

tol = 1e-10;
maxit = 1000;

switch C

    case 1
        %i)
        x1 = 0;
        x2 = 3;
        x3 = 3;

        f = @(x) x^2-cos(x);
        Df = @(x) 2*x+sin(x);
        nst_x_analyt = 0.824132;

    case 2
        %ii)
        x1 = 0.1;
        x2 = 3;
        x3 = 3;

        f = @(x) (x-1)^2;
        Df = @(x) 2*(x-1);
        nst_x_analyt = 1;        


end

%Bisektionsmethode
[fehl_bisektionsmethode] =  BisektionsMethode(x1,x2,f,tol,nst_x_analyt);
%fehl_bisektionsmethode = it_itwert_fehlx_fehly
%     1. Spalte = Anzahl Iterationen
%     2. Spalte = Nst der Näherung 
%     3. Spalte = Fehler in x Richtung
%     4. SPalte = Fehler in y Richtung

%Regula Falsi
[fehl_regulafalsi] = RegulaFalsi(x1,x2,f,tol,nst_x_analyt);
%fehl_regulafalsi = it_itwert_fehlx_fehly
%     1. Spalte = Anzahl Iterationen
%     2. Spalte = Nst der Näherung 
%     3. Spalte = Fehler in x Richtung
%     4. SPalte = Fehler in y Richtung

%Sekantenmethode
[fehl_sekantenmethode] = SekantenMethode(x1,x2,f,tol,nst_x_analyt);
%fehl_sekantenmethode = it_itwert_fehlx_fehly
%     1. Spalte = Anzahl Iterationen
%     2. Spalte = Nst der Näherung 
%     3. Spalte = Fehler in x Richtung
%     4. SPalte = Fehler in y Richtung

%NewtonSimple
[fehl_newtonsimple] = NewtonSimple(x3,f,Df,tol,maxit,nst_x_analyt);
%fehl_newtonsimple = it_itwert_fehlx_fehly
%     1. Spalte = Anzahl Iterationen
%     2. Spalte = Nst der Näherung 
%     3. Spalte = Fehler in x Richtung
%     4. SPalte = Fehler in y Richtung

figure
semilogy(fehl_bisektionsmethode(:,1),fehl_bisektionsmethode(:,3),'*-')
hold on
semilogy(fehl_regulafalsi(:,1),fehl_regulafalsi(:,3),'*-')
hold on
semilogy(fehl_sekantenmethode(:,1),fehl_sekantenmethode(:,3),'*-')
hold on
semilogy(fehl_newtonsimple(:,1),fehl_newtonsimple(:,3),'*-')
hold on
title('Fehler in X / Iterationen der 4 Verfahren')
xlabel('Anzahl Iterationen') 
ylabel('Fehler logarithmisch') 
legend('Bisektion','Regua Falsi','Sekantenverfahren','Newton')
set(gcf,'color','white')
grid on



