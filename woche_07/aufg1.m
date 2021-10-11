close all;
clear all;
clc;

res = 100;
t = linspace(0,1,res);

figure

%% 1. Quadrant
% Viertelkreis als Referenz ausdrucken
% (2,2,2) = 2 Zeilen, 2 Zeilen, 2 Spalten, 2. subplot  = rechts oben
subplot(2,2,2)
s = linspace(0,pi/2,res);
x = cos(s);
y = sin(s);
plot(x,y,'r-');
grid on
hold on

% Kontrollpunkte 
c = 1; % mit c = 1.1 sieht man den Einfluss/Unterschied zum idealen Einheitskreis
P = [1, 1, 0; ...   %x-Komponente
     0, 1, 2; ...   %y-Komponente
     1, c, 2];      %z-Komponente
 
%  Punktweise auswerten mit deCasteljau
C = zeros(3,res);
for k=1:res
    C(:,k) = deCasteljau1(P,t(k));
end

% rationale Funktion C Viertelkreis
Crat = [C(1,:)./C(3,:) ; C(2,:)./C(3,:)];
plot(Crat(1,:),Crat(2,:),'b-');

%% 2. Quadrant
% Viertelkreis als Referenz ausdrucken
subplot(2,2,1) 
s = linspace(pi/2,pi,res);
x = cos(s);
y = sin(s);
plot(x,y,'r-');
grid on
hold on

% Kontrollpunkte 
% c = 1.1;
P = [-1, -1, 0; ...   %x-Komponente
     0, 1, 2; ...   %y-Komponente
     1, c, 2];      %z-Komponente
 
%  Punktweise auswerten mit deCasteljau
C = zeros(3,res);
for k=1:res
    C(:,k) = deCasteljau1(P,t(k));
end

% rationale Funktion C Viertelkreis
Crat = [C(1,:)./C(3,:) ; C(2,:)./C(3,:)];
plot(Crat(1,:),Crat(2,:),'b-');


%% 3. Quadrant
% Viertelkreis als Referenz ausdrucken
subplot(2,2,3) 
s = linspace(pi,3/2*pi,res);
x = cos(s);
y = sin(s);
plot(x,y,'r-');
grid on
hold on

% Kontrollpunkte 
% c = 1.1;
P = [-1, -1, 0; ...   %x-Komponente
     0, -1, -2; ...   %y-Komponente
     1, c, 2];      %z-Komponente
 
%  Punktweise auswerten mit deCasteljau
C = zeros(3,res);
for k=1:res
    C(:,k) = deCasteljau1(P,t(k));
end

% rationale Funktion C Viertelkreis
Crat = [C(1,:)./C(3,:) ; C(2,:)./C(3,:)];
plot(Crat(1,:),Crat(2,:),'b-');

%% 4. Quadrant
% Viertelkreis als Referenz ausdrucken
subplot(2,2,4) 
s = linspace(3/2*pi,2*pi,res);
x = cos(s);
y = sin(s);
plot(x,y,'r-');
grid on
hold on

% Kontrollpunkte 
% c = 1.1;
P = [1, 1, 0; ...   %x-Komponente
     0, -1, -2; ...   %y-Komponente
     1, c, 2];      %z-Komponente
 
%  Punktweise auswerten mit deCasteljau
C = zeros(3,res);
for k=1:res
    C(:,k) = deCasteljau1(P,t(k));
end

% rationale Funktion C Viertelkreis
Crat = [C(1,:)./C(3,:) ; C(2,:)./C(3,:)];
plot(Crat(1,:),Crat(2,:),'b-');