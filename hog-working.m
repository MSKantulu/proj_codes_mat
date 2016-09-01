img = imread('D:\ms_class\work\photo-f1-004-01.jpg');
%{imshow(img);%}

T = img;
%{for i=1:row-16
    %for j=1:col-16
      %  T(end-mod(size(T,1),16)+1:end, :) = [];
      %  T(:, end-mod(size(T,2),16)+1:end) = [];
   % end
    %end
%throw away partial blocks

%now break out of loop if T is empty
%below code works
[row,col]=size(img);
for i=1:row-7
    for j=1:col-7
        BLOCK=img(i:i+7,j:j+7);
        
    end
end

%imshow(BLOCK)

fun = @(block_struct) ...
   std2(block_struct.data) * ones(size(block_struct.data));
I2 = blockproc(img,[2 2],fun);
figure;
%imshow(img);
figure;
%imshow(I2,[]);
%imshow(B)

%CurrentImage = img(2:end,2:end);
%imshow(CurrentImage)

%imshow(T)

[featureVector, hogVisualization] = extractHOGFeatures(BLOCK);

%figure;
%imshow(BLOCK); hold on;
%plot(hogVisualization);


%Dividing image into 15x15 [I think 15] overlapping block
[row,col]=size(img);
for i=8:8:col-7
   for  j = 8:8:row-7
       block1=img(j-7:j+7,i-7:i+7);   %semicolon hinders the display of numeric values       
       %[featureVector, hogVisualization] = extractHOGFeatures(block1);
        %figure;
        %imshow(block1);hold on;
        %plot(hogVisualization);
    end
end
[r,c]=size(block1);
[hog1, visualization] = extractHOGFeatures(block1,'CellSize',[1 1]);
subplot(1,2,1);
imshow(block1);
subplot(1,2,2);
plot(hog1);
%plot(visualization);



