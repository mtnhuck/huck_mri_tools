function [r,p,n]=corrtable(yourtable,exclude)
%Jeremy Huckins 2017 Correlate Table values, excluding first exclude rows
r=[];
p=[];
n=[];
for i=(exclude+1):size(yourtable,2)
    for j=exclude:size(yourtable,2)
        x=yourtable{:,i};
        y=yourtable{:,j};
        [r(i,j) p(i,j) n(i,j)]=nancorrJFH(x,y);
    end
end