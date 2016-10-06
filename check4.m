img1 = imread('D:\ms_class\work\photo-f1-004-01.jpg');
%Dividing image into 15x15 overlapping block
[row1,col1]=size(img1);
count1=0;
%block11=[];
v1=[];
for i=8:8:col1-7
   for  j = 8:8:row1-7
       block1=img1(j-7:j+7,i-7:i+7);   %semicolon hinders the display of numeric values       
       v1=[v1,block1]; % concatenating patch vectors to form a long feature vector(col wise)"use n for row wise"
       %count1=count1+1;
    end
end
figure;
[hog1, visualization1] = extractHOGFeatures(block1,'CellSize',[2 2]);
subplot(1,2,1);
imshow(block1);
subplot(1,2,2);
plot(hog1);
%plot(visualization1);

img2 = imread('D:\ms_class\work\sketch-f1-004-01-sz1.jpg');
%Dividing image into 15x15 overlapping block
[row2,col2]=size(img2);
count2=0;
v2=[];
for i2=8:8:col2-7
   for  j2 = 8:8:row2-7
       block2=img2(j2-7:j2+7,i2-7:i2+7);   %semicolon hinders the display of numeric values       
       v2=[v2,block2]; %Combining to form the feature vector
       %count2=count2+1;
    end
end

figure;
[hog2, visualization2] = extractHOGFeatures(block2,'CellSize',[2 2]);
subplot(1,2,1);
imshow(block2);
subplot(1,2,2);
plot(hog2);
%plot(visualization2);
%count1
%count2

%Two histograms are obtained for photo hog1 and sketch hog2 respectively ,next step we need to combine them%

%concatenating 2 HOG
%bothhist = [hog1(:); hog2(:)];
%bothhist
%figure;
%plot(bothhist)


%Extracting  HOG for whole images
%features1 = extractHOGFeatures(img1)
%figure;
%plot(features1)

%features2 = extractHOGFeatures(img2)
%figure;
%plot(features2)

%b2=intersect(block1,block2)
%figure;
%plot(b2)

figure
h1 = stem(hog1);

figure
h2 = stem(hog2);
%change datatype to double so that pca can be applied 
v1=double(v1);
v2=double(v2);
[ra1,ca1]=size(v1);
[ra2,ca2]=size(v2);
%sz1=ra1*ca1/2
%[rh1,ch1]=size(hog1)
%[rh2,ch2]=size(hog2)


%Dividing the long feature vector into row*12 slices

k1=1;
 for n1 = 1:12:ca1-1
    Y1{k1} = v1(:,n1:n1+1);
    P1{k1} = pca(Y1{k1});
    k1 = k1+1;
 end
 
 %T1{k1}= cell2mat(Y1{k1});
 
 k2=1;
 for n2 = 1:12:ca2-1
    Y2{k2} = v2(:,n2:n2+1);
    P2{k2} = pca(Y2{k2});
    k2 = k2+1;
 end

%%%%%%%%%%%%%%%%%
