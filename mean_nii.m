function mean_nii(string,outfile)
%mean_nii(selection_string,outfilebase)
%user must setpath to DICOM2NIfTI
addpath(genpath('~/matlab/DICOM2NIfTI/'))
list=dir([string '.nii']);
nii=load_nii(list(1).name);
allimg=int16(zeros(size(nii.img)));
allimg=allimg;
for i=1:length(list)
    nii=load_nii(list(i).name);
    nii.img(find(nii.img==Inf))=0;
    allimg=allimg+int16(nii.img);
end
nii.img=allimg;
%save_nii(nii,['Count_' outfile '.nii'])
meanimg=zeros(size(allimg));
meanimg=(meanimg);
meanimg(find(allimg))=(allimg(find(allimg)))/(length(list));
nii.img=meanimg;
nii.hdr.dime.datatype=64; %set to double so we can have fractions
save_nii(nii,['Mean_' outfile '.nii'])