function yournetworkvals = networkmeanextract(varargin)%(yournetworkmask,yourfiles)
%mask MUST be in same resolution/alignment as your 
%written by Jeremy Huckins, 2018
%example using data from JP: https://www.jonathanpower.net/2011-neuron-bigbrain.html
%use batchreslice333labels if you need to change your
%mask to the SPM grid
switch (nargin)
    case 0
        yourfiles=uigetfiles('*.nii','Multiselect','on')
        yournetworkmask='~/Matlab/Power2011NeuronMask/Neuron_consensus_MNI_333SPM.nii' %version that was changed to SPM grid while maintaining labels with NN interpolation
    case 1
        yourfiles=uigetfiles('*.nii','Multiselect','on')
        yournetworkmask=varargin{1}
    case 2
        yournetworkmask=varargin{1}
        yourfiles=varargin{2}
end
%load mask and get unique values in mask
niimask=load_untouch_nii(yournetworkmask);
networklabels=unique(niimask.img);
resmat=[]
for i=1:length(yourfiles)
    yourfile=yourfiles{i};
    tempnii=load_untouch_nii(yourfile);
    for j=1:length(networklabels)
        resmat(i,j)=mean(mean(mean(tempnii.img(find(niimask.img==networklabels(j))))));
    end
end
yournetworkvals=resmat;