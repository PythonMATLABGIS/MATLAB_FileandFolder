File_operation_dir = 'C:\Users\lsxin\OneDrive\Máy tính\MATLAB_FileandFolder-master'
src_folder = fullfile(File_operation_dir,"images");
dest_folder = fullfile(File_operation_dir,'images_copy');

%check if destination folder is not created then create it
if exist(dest_folder,'dir')
    fprintf('%s already existed \n',dest_folder);
elseif mkdir(dest_folder)
    fprintf('%s is just created \n',dest_folder);
end

cd(src_folder)
%list all images in source folder
image_files_dir = dir('*.jpg');
for i = 1: numel(image_files_dir)
    src_name = image_files_dir(i).name;
    src_file = fullfile(src_folder,src_name);
    src_name_split= split(src_name,".");
    %dst_name = src_name_split(1)+"_copy."+src_name_split(2);
    dst_name = strcat(src_name_split(1),"_copy.",src_name_split(2));
    dst_file = fullfile(dest_folder,dst_name);
    if exist(dst_file,'file')
        fprintf('Already existed %s\n',dst_file);
    else
        copyfile(src_file,dst_file);
        fprintf('Just copied %s\n',dst_file);
    end
end

cd(dest_folder)