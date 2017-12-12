function nii2workbench(string)
%MNI NII to Workbench Conte MNI surface files

list= dir([string '.nii'])
disp('The following files will be converted to workbench')
list.name
pause(1)

for i=1:length(list)
    filetomap=[list(i).name]
            %map volume to Conte69 Surface we only need 32k for
            %visualization and functional measures, 164k for hi-res
%             command=['/afs/dbic.dartmouth.edu/usr/pkg/workbench/workbench_v1.0/amd64_linux26/bin/wb_command -volume-to-surface-mapping ' filetomap ' /flash/KELLERTON/muffin/Masks/Conte69_atlas_164k_wb/Conte69.L.midthickness.164k_fs_LR.surf.gii ' filetomap '_L.shape.gii -trilinear']
%             system(command)
%             command=['/afs/dbic.dartmouth.edu/usr/pkg/workbench/workbench_v1.0/amd64_linux26/bin/wb_command -volume-to-surface-mapping ' filetomap ' /flash/KELLERTON/muffin/Masks/Conte69_atlas_164k_wb/Conte69.R.midthickness.164k_fs_LR.surf.gii ' filetomap '_R.shape.gii -trilinear']
%             system(command)
            %map volume to Conte69 Surface
    command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' ~/Dropbox/WorkbenchFiles/Conte69_atlas_32k_wb/Conte69.L.midthickness.32k_fs_LR.surf.gii ' filetomap '_L.32k.shape.gii -trilinear']
    system(command)
    command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' ~/Dropbox/WorkbenchFiles/Conte69_atlas_32k_wb/Conte69.R.midthickness.32k_fs_LR.surf.gii ' filetomap '_R.32k.shape.gii -trilinear']
    system(command)
    command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' ~/Dropbox/WorkbenchFiles/Conte69_atlas_164k_wb/Conte69.L.midthickness.164k_fs_LR.surf.gii ' filetomap '_L.164k.shape.gii -trilinear']
    system(command)
    command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' ~/Dropbox/WorkbenchFiles/Conte69_atlas_164k_wb/Conte69.R.midthickness.164k_fs_LR.surf.gii ' filetomap '_R.164k.shape.gii -trilinear']
    system(command)
%         command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' /Users/jhuckins/Dropbox/WorkbenchFiles/Conte69_atlas_32k_wb/Conte69.L.midthickness.32k_fs_LR.surf.gii ' filetomap '_L.32k.shape.gii -trilinear']
%     system(command)
%     command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' /Users/jhuckins/Dropbox/WorkbenchFiles/Conte69_atlas_32k_wb/Conte69.R.midthickness.32k_fs_LR.surf.gii ' filetomap '_R.32k.shape.gii -trilinear']
%     system(command)
%     command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' /Users/jhuckins/Dropbox/WorkbenchFiles/Conte69_atlas_164k_wb/Conte69.L.midthickness.164k_fs_LR.surf.gii ' filetomap '_L.164k.shape.gii -trilinear']
%     system(command)
%     command=['/Applications/workbench/bin_macosx64/wb_command -volume-to-surface-mapping ' filetomap ' /Users/jhuckins/Dropbox/WorkbenchFiles/Conte69_atlas_164k_wb/Conte69.R.midthickness.164k_fs_LR.surf.gii ' filetomap '_R.164k.shape.gii -trilinear']
%     system(command)

end