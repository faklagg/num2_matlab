function [koeff_m_diag] = newton_interpol_ouk35(stuetz, f_stuetz)

anz_stuetz = length(stuetz);
koeff_m = zeros(anz_stuetz,anz_stuetz+1);
koeff_m(:,1) = stuetz;      %initialisieren der ersten Spalte mit den Stuetzstellen
koeff_m(:,2) = f_stuetz;    %initialisieren der zweiten Spalte mit den Funktionswerten der Stuetzstellen

anz_z = length(koeff_m(:,1));
anz_s = length(koeff_m(1,:));
 
for spalte = 3 : anz_s 
%     Berechnung Differenz der Indizes des Vorfaktors (zB 1/(x2-x1))
    vorfaktor_dif = spalte - 2;
    
    for zeile = spalte-1 : anz_z
        div_diff = 1/(koeff_m(zeile,1)-koeff_m(zeile-vorfaktor_dif,1))*(koeff_m(zeile,spalte-1)-koeff_m(zeile-1,spalte-1));
        koeff_m(zeile,spalte) = div_diff;
    end
end

for spalte = 2 : anz_s
    koeff_m_diag(spalte-1,1) = koeff_m(spalte-1,spalte);
end

end