function corrmat=linmat2corrmat(linmat,numrois)
bigcorrmat=[];
for i=1:size(linmat,1)
    corrmat=ones(numrois,numrois);
    corrmat = triu(corrmat,1);
    index=find(corrmat);
    corrmat(index)=linmat(i,:);
    corrmat = corrmat + corrmat';
    bigcorrmat(:,:,i)=corrmat;
end
corrmat=bigcorrmat;
    