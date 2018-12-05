function [r,p,n]=nancorr_exclude(x,y)
%JFH 2017 written to get correlation, significance and final N after
%excluding NaNs

xtoss=find(isnan(x));
ytoss=find(isnan(y));
toss=unique([xtoss; ytoss]);
x(toss)=[];
y(toss)=[];
if isempty(x)
    r=0;
    p=1;
    n=0;
else
    [r,p]=corr(x,y);
    n=length(x);
end