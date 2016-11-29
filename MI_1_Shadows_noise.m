%D:\1photo_sketch_Oct_2016\CUHK_training_cropped_sketches\sketches\F2-018-01-sz1.jpg
srcFiles1 = dir('D:\1photo_sketch_Oct_2016\CUHK_training_cropped_photos\photos\*.jpg');
max=-999;
prompt = 'Please enter the complete path of the sketch that you want to match>>> ';
input_sketch = sscanf(input(prompt, 's'), '%s');
I2= imread(input_sketch);
J=I2;
for i=1:size(I2,1)
    for j= 1:size(I2,2)
        I2(i,j)=I2(i,j)-150;
    end
end
%%%%%%%
%figure
%subplot(1,2,1);
%imshow(J)
%subplot(1,2,2);

%%%%%%%
for i = 1 : length(srcFiles1)
    filename1 = strcat('D:\1photo_sketch_Oct_2016\CUHK_training_cropped_photos\photos\',srcFiles1(i).name);
    %filename1 = strcat('D:\ms_class\work\dataset_IR_VS\ms_VL\',srcFiles1(i).name);
    I11{i} = imread(filename1);
    %I11{i} = imnoise(I11{i},'gaussian',0.5,0.1);
    %I11{i} = imnoise(I11{i}, 'poisson');
    %I11{i}=imnoise(I11{i},'salt & pepper', 0.1);
    %I11{i} = imnoise(I11{i}, 'speckle',0.15);
    I1 = I11{i}(:,:,3); 
    h = image_MI(I11{i},I2);
    if h>max
        max=h;
        match_photo=I11{i};
        %match_file=filename1;
    end
    %figure, imshow(I);
end

figure
subplot(1,2,1);
imshow(I2);
subplot(1,2,2);
imshow(match_photo);


