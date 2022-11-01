folder='D:\Semester 9\Modalities\Task 1\VHF-Head\Head';
filenames=dir(fullfile(folder,'*.dcm'));
Slices=length(filenames);
% images = cell(Slices,1);
%Dialogue box to choose which plane to display
Select = questdlg('Please select output plane', mfilename, 'Axial', 'Sagittal', 'Coronal', 'quit');
%Slicing the images into 3D matrix 
for n=1:Slices
   f=fullfile(folder,filenames(n).name);
   images{n}=dicomread(f);
   img2d = images{n};
   img3d(:,:,n) = img2d;
   %Axial plane along z axis
   Axial = img3d(:, :, n);
   if strcmp(Select, 'Axial')==1
        imshow(squeeze(Axial),[]),colormap gray;
        axis off; 
        pause(0.003);
   end
end
%Sagittal plane along on x axis and coronal plane along y axis
sizeof3d=size(img3d);
m=sizeof3d(1);
for n=1:m
   Sagittal = img3d(:, n, :);
   Coronal = img3d(n, :, :);
   %Conditions for choosing the displayed plane
   if strcmp(Select, 'Sagittal')==1
        imshow(imrotate(squeeze(Sagittal),90),[]),colormap gray;
        axis off; 
        pause(0.003);
   elseif strcmp(Select, 'Coronal')==1
       imshow(imrotate(squeeze(Coronal),90),[]),colormap gray;
       axis off; 
       pause(0.003);
   end
   
end
  