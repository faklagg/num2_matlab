function [c,e] = Loop(c,e)
% The Loop scheme is defined for triangle meshes only, not general 
% polygonal meshes. At each step of the scheme each triangle is split 
% into four smaller triangles.
%
% Edge points are constructed on each edge. These points are three 
% eighths of the sum of the two end points of the edge plus one eighth 
% of the sum of the two other points that form the two triangles that 
% share the edge in question.
%
% Vertex points are constructed for each old vertex. A given vertex 
% has n neighbor vertices. The new vertex point is one minus n times 
% s times the old vertex, plus s times the sum of the neighboring 
% vertices, where s is a scaling factor. 
% For n equal to three, s is three sixteenths. 
% For n greater than three, s is 1/n (5/8 - (3/8 + 1/4 cos(2 pi / n))^2)

[edge2nodes,element2edges] = provideGeometricData34(e);
nC = size(c,1);          % number of nodes
nD = size(c,2);          % space dimension
nT = size(e,1);          % space dimension
nE = size(edge2nodes,1); % number of edges
%*** create midpoints of edges (3/8 endpoints, 1/8 opposite vertices)
cE = zeros(nE,nD);
for k=1:nD
  %*** create sum of vertices per face
  cF = sum(reshape(c(e,k),[],3),2);
  for j=1:3 
    cE(:,k) = cE(:,k) + 1/8 * accumarray(element2edges(:,j),cF,[nE,1]);
  end
  cE(:,k) = cE(:,k) + 1/8 * sum(reshape(c(edge2nodes,k),[],2),2);
end
%*** calculate number of neighbouring elements and scaling factor
idx = accumarray(e(:),ones(3*nT,1),[nC,1]);
s = (1./idx).* (5/8 - (3/8 + 1/4*cos( (2*pi)./idx)).^2);
%*** update vertices
cV = zeros(nC,nD);
for k=1:nD
  tmp = sum(reshape(c(edge2nodes,k),[],2),2);
  cV(:,k) = cV(:,k) + s .* accumarray(edge2nodes(:),[tmp;tmp],[nC,1]);
  cV(:,k) = cV(:,k) + (1 - 2*s.*idx).*c(:,k); 
end
c = [cV;cE];
%*** create new elements
e = [e(:),nC+reshape(element2edges(:,[1:3,3,1,2]),[],2);nC+element2edges];
