
%CM calculation and basic step in Base paper MCA Approach
%Musica
%25-Oct-2016
%Read the input images folder : photos
srcFiles1 = dir('D:\photo_sketch_Oct_2016\CUHK_training_cropped_photos\photos\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles1)
    filename1 = strcat('D:\photo_sketch_Oct_2016\CUHK_training_cropped_photos\photos\',srcFiles1(i).name);
    I11{i} = double(imread(filename1));
    I1{i} = I11{i}(:,:,3); 
    %figure, imshow(I);
end
%Read the input images folder : sketches
srcFiles2 = dir('D:\photo_sketch_Oct_2016\CUHK_training_cropped_sketches\sketches\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles2)
    filename2 = strcat('D:\photo_sketch_Oct_2016\CUHK_training_cropped_sketches\sketches\',srcFiles2(i).name);
    I21{i} = double(imread(filename2));
    I2{i} = I21{i};
end
c=[];
%for i = 1 : length(srcFiles2)
   %c{i} = cov(I1{i},I2{i}); %covariance 4444 4for the two datasets(photos and sketches) is obtained
%end



M1 = cell2mat(I1);
M2 = cell2mat(I2);
%CM = cov(M1,M2)
%[L,D1,U] = svd(CM);
%[V,D] = eig(D1);


%ms_new_code added

m_x=mean2(M1);
[xr xc]=size(M1);

m_y=mean2(M2);
[yr yc]=size(M2);

for i=1:xr
    for j=1:xc
        M1(i,j) = M1(i,j)-m_x;
    end
end

for i=1:yr
    for j=1:yc
        M2(i,j) = M2(i,j)-m_y;
    end
end


%Concatenate the above two matrices columnwise

A=[M1;M2];
B=transpose(A);
CM=1/(xr*xc)*(A*B);

[L,D1,U] = svd(CM);
%[V,D] = eig(D1);
e=eig(D1);

dlmwrite('sample1.txt',D1, ' ');




