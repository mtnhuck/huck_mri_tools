function linmat=corrmat2linmat(corrmat,varargin)
if ~isempty(varargin)
    triuk=varargin{1}
else
    triuk=1 %for standard correlation matrices
end
numnodes=size(corrmat,1);
mask = ones(numnodes);
mask = triu(mask,triuk);
linmat=[];
for s = 1:size(corrmat,3)
    temp = corrmat(:,:,s);
    linmat(:,s) = temp(logical(mask));
end
linmat=linmat';