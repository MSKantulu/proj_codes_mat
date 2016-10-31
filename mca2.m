
%CM calculation and basic step in Base paper MCA Approach
%Musica
%31-Oct-2016
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

M1 = cell2mat(I1);
M2 = cell2mat(I2);

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

[U, S_a, V_a] = svd(CM); %S_a is 500x500 I need to remove 
%smaller values at the last rows and make it 250x200<-assumption
%below , half of the matrix is considered, rest values are very small
S_a1= S_a(1:250,1:250);

dlmwrite('sample1.txt',S_a1, ' '); %Eigen vectors I have put into file

[V,E] = eig(S_a1); %V_a is the eigen vector

%dlmwrite('sample1.txt',V, ' '); %Eigen vectors I have put into file
S=V*sqrt(E);

%N=88 No. of training samples
%b_k is used for beta_k
[r,N]=size(I1);
sum_1=0;
for i=1:N
    sum_1=sum_1+I1{i};
end

sum_2=0;
for i=1:N
    sum_2=sum_2+I2{i};
end
b_1=(1/N)*sum_1;
b_2=(1/N)*sum_2;

%For modality 1 : Actually we bneed to find y_i, Y_i is independent of
%modality so here only moadlity 1 is considered
o=ones(250,250);
S_11=o*inv(S); % 1/S division -> [1]*inv([S])
for i=1:N
    y{i}= S_11*(I1{i}-b_1);
end
sum_x=0;
for i=1:N
    x{i}=V*y{i};
    sum_x=sum_x+x{i};
end
Mu=(1/N)*sum_x;
%finding mutual component h

for i=1:N
    h{i}=Mu+x{i};
end



 




