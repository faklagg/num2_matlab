clear all

coordinates = [0,0,0; 1,0,0; 1,1,0; 0,1,0; 0,0,1; 1,0,1; .2 .3  .2; 0,1,1];
elements = [1,2,3,4; 8,7,6,5; 2,6,7,3; 5,1,4,8; 5,6,2,1; 4,3,7,8];
    
elements = [elements(:,[3,1,2]);elements(:,[1,3,4])];

for k=1:3
  [coordinates,elements] = Loop(coordinates,elements);
end

figure(1),clf
h = trisurf( elements,coordinates(:,1), ...
     coordinates(:,2),coordinates(:,3), 'facecolor','b', ...
     'edgecolor','w');
view(3)
axis equal
axis off

%return

view(0,75)
shading interp
lightangle(-45,30)
h.FaceLighting = 'gouraud';
h.AmbientStrength = 0.3;
h.DiffuseStrength = 0.8;
h.SpecularStrength = 0.9;
h.SpecularExponent = 25;
h.BackFaceLighting = 'unlit';


