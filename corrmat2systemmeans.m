function [sysmeans systemlist ]=corrmat2systemmeans(zmat)
%change path here to include your system list of choice
load('~/Dropbox/Matlab/Power2011Consensus.mat','BB264Consensus') %systems05 
systems05=BB264Consensus;
sysmeans=[]
systemlist=unique(systems05)
%set zmat diag to 0
for i=1:size(zmat,3)
   zmat(logical(eye(size(zmat(:,:,1))))) = 0;
end

for i=1:length(systemlist)
    for j=1:length(systemlist)
        for k=1:size(zmat,3)
            if i==j
                ind=find(triu(ones(length(find(systems05==systemlist(i)))),1));
                tmp=zmat(find(systems05==systemlist(i)),find(systems05==systemlist(j)),k);
                sysmeans(i,j,k)=nanmean(tmp(ind));
            else
                sysmeans(i,j,k)=nanmean(nanmean(zmat(find(systems05==systemlist(i)),find(systems05==systemlist(j)),k)));
            end
        end
    end
end
