function outmat=matrix_resid(bigmat,nuisancevars)
%get residual from a matrix of numroisXnumroisXsubjects after regressing
%out nuisance varaibles
outmat=[]
for i=1:size(bigmat,1)
    for j=1:size(bigmat,2)
        connectionvalues=squeeze(bigmat(i,j,:));
        X=[ones(size(nuisancevars,1)) nuisancevars];
        [b,bint,r,rint,stats] = regress(connectionvalues,X);
        outmat(i,j,:)=r;
    end
end

