close; % alle offenen Fenster schließen
clear; % workspace löschen
clc;   % command window löschen

% stuetz = [0;0.4;1.0;2.5;5;8;10;14];   %Eingabe der Stuetzstellen (x)
stuetz = [0.5;1;2];
% f = @(x) exp(-x);           
f = @(x) log(x)+2*x.^2;
f_stuetz = f(stuetz);       %Berechnung der Funktionswerte f(x)

[koeff_m_diag] = newton_interpol_ouk35(stuetz, f_stuetz);