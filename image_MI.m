function h = image_MI(I1,I2)

%IMAGE_MI : Calculates the Mutual Information(MI) between given two images.
%The MI tells us about the similarity between the two images.
%INPUT : I1 an image and I2 a sketch
%OUTPUT : MI between two images
%Date of Last Change : 11 October 2016


%considering only one of the layers of the image ; else it  gives error
%giving values for r , c , z(RGB)
image1=I1(:,:,3);
image2=I2;

rows=size(image1,1);
cols=size(image2,2);
N=256;

h1=zeros(N,N);

for i=1:rows;   
  for j=1:cols;   
    h1(image1(i,j)+1,image2(i,j)+1)= h1(image1(i,j)+1,image2(i,j)+1)+1;
  end
end

imshow(h1)

a=h1; % calculating joint histogram for two images
[r,c] = size(a);
b= a./(r*c); % normalized joint histogram
y_marg=sum(b); %sum of the rows of normalized joint histogram
x_marg=sum(b');%sum of columns of normalized joint histogran

Hy=0;
for i=1:c;    %  col
      if( y_marg(i)==0 )
         %do nothing
      else
         Hy = Hy + -(y_marg(i)*(log2(y_marg(i)))); %marginal entropy for image 1
      end
   end
   
Hx=0;
for i=1:r;    %rows
   if( x_marg(i)==0 )
         %do nothing
      else
         Hx = Hx + -(x_marg(i)*(log2(x_marg(i)))); %marginal entropy for image 2
      end   
   end
h_xy = -sum(sum(b.*(log2(b+(b==0))))); % joint entropy
h = Hx + Hy - h_xy;% Mutual information
end

%Usage
%I1 = imread('D:\ms_class\work\o1.jpg');
%I2 = imread('D:\ms_class\work\sketches\m-093-01-sz1.jpg');
%Function call: h = image_MI(I1,I2)

