function batchreslice333(string)
%batch convert 4dfp to nii
%Users will need to change path to bigmask or another standard SPM file in
%the space they want
list= dir([string '.nii'])
disp('The following files will be resliced to 333')
list.name
pause(3)

bigmask='~/Dropbox/Matlab/Masks/bigmask_53x65x53.nii';
niibigmask=load_nii(bigmask);
dim=niibigmask.hdr.dime.dim(2:4);
mat=[-3 0 0 81
    0 3 0 -120
    0 0 3 -75
    0 0 0 1]; %set to same as big brain mask
hld=1;%trilinear interpolation
for i=1:length(list)
    %command=['nifti_4dfp -n ' list(i).name ' ' list(i).name(1:(length(list(i).name)-9)) 't.nii -T /afs/dbic.dartmouth.edu/usr/pkg/4dfp/bin/711-2B_to_MNI152lin_T1_t4 -O333']
    %system(command)
    PI=[list(i).name];
    PO=[list(i).name(1:(length(list(i).name)-4)) '333.nii']
    
    reslice(PI,PO,dim,mat,hld)
      
    %reslice_nii(PI, PO,1,[3 3 3]) %Simply does rounded size from original file
end