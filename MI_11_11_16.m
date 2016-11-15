srcFiles1 = dir('D:\1photo_sketch_Oct_2016\CUHK_training_cropped_photos\photos\*.jpg');
max=-999;
%Input sketch read
prompt = 'Please enter the complete path of the sketch that you want to match>>> ';
input_sketch = sscanf(input(prompt, 's'), '%s');
%D:\photo_sketch_Oct_2016\CUHK_training_cropped_sketches\sketches\F2-018-01-sz1.jpg
I2= imread(input_sketch);
for i = 1 : length(srcFiles1)
    filename1 = strcat('D:\1photo_sketch_Oct_2016\CUHK_training_cropped_photos\photos\',srcFiles1(i).name);
    I11{i} = imread(filename1);
    %I1 = I11{i}(:,:,3); 
    h = image_MI(I11{i},I2);
    if h>max
        max=h;
        match_photo=filename1;
    end
    %figure, imshow(I);
end

figure
subplot(1,2,1);
imshow(I2);
subplot(1,2,2);
imshow(match_photo);
