function SPM12RegressionACF
%run from the regression directory
%this will delete old results - be careful!
%Merge all residulas into one file for afni, unzip it, get acf function,
%read it then use 3dClustSim with -acf option to get voxel-extents for
%volume correction


!rm ./outfile.txt
!rm ./3d*
!fslmerge -t mergedresiduals ResI_*
!gunzip -f ./mergedresiduals.nii.gz
commands=['3dFWHMx -mask mask.nii -input ./mergedresiduals.nii >>outfile.txt']
[status,result]=system(commands)
acfvals=dlmread('outfile.txt');
acfvals=acfvals(2,:);

commands=['3dClustSim -mask mask.nii -acf ' num2str(acfvals(1)) ' ' num2str(acfvals(2)) ' ' num2str(acfvals(3)) ' -pthr 0.1 0.05 0.01 0.005 0.001 -athr 0.10 0.05 0.01 0.005 0.001'];
system(commands)