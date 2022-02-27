clc;
clear all;
close all;
rgb = imread('img3.jpg');
figure;
imshow(rgb);
gray_image = rgb2gray(rgb);
figure;
imshow(gray_image);
[size1,size2]=size(gray_image);
for i=1:size1
   for j=1:size2
      if gray_image(i,j)<100
          gray_image(i,j)=255;
      end
   end
end
%%Nucleus removal

im1=im2bw(gray_image,graythresh(gray_image));
figure;
imshow(im1);
figure;
imshow(im1);
[centers, radii, metric] = imfindcircles(rgb,[5 15],'ObjectPolarity','dark','Sensitivity',0.97,'Method','twostage');
h = viscircles(centers,radii);
[m,n]=size(centers);
disp(m); %RBC COUNT