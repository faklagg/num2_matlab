function [edge2nodes,element2edges,varargout] ...
             = provideGeometricData(elements,varargin)

nV = size(elements,2);
ptr = [size(elements,1)*nV;zeros(nargin-1,1)]; 
%*** Collect all edges
edges = reshape(elements(:,[1:nV,2:nV,1]),[],2);           
for j = 2:nargin
  edges = [edges;varargin{j-1}];
  ptr(j) = size(edges,1);
end           
%*** Create numbering of edges
[edge2nodes,ia,ie] = unique(sort(edges,2),'rows');
element2edges = reshape(ie(1:ptr(1)),[],nV);
%*** Provide boundary2edges
for j = 2:nargin
  varargout{j-1} = ie(ptr(j-1)+1:ptr(j));
end