clc;
clear all;
I = imread('img2.jpg');
figure, imshow(I);
Ig = rgb2gray(I); 
figure,
subplot(2,2,1), imshow(Ig); %soldaki resim olarak gösterir
 
Ih = histeq(Ig); %histogramý eþitleyerek kontrastý artýrýr
subplot(2,2,2), imshow(Ih); %saðdaki resim olarak gösterir

figure,
subplot(1,2,1), imhist(Ig); %griye çevrilen görüntü üzerindeki deðerlerin daðýlýmýný gösterir
subplot(1,2,2), imhist(Ih);

Ie = edge(Ih, 'sobel'); %sobel kenar bulma algoritmasýyla kenarlar bulunur
figure, 
subplot(1,2,1), imshow(Ie);
coin1 = im2bw(imread('img2.jpg'));
coin2 = imfill(coin1,'holes');
figure; imshow(imread('img2.jpg'));
B = bwboundaries(coin2);
text(10,10,strcat('\color{red}Objects Found:',num2str(length(B)))) 
hold on;
     for k=1:length(B),
       boundary = B{k};
       plot(boundary(:,2),boundary(:,1),'b','LineWidth',2);
     end
     
     
[Bilgi Number]=bwlabel(coin2);
prop=regionprops(Bilgi,'Area','Centroid');
total=0;
 
figure; imshow(imread('img2.jpg'));hold on
for n=1:size(prop,1)
    cent=prop(n).Centroid;
    X=cent(1);Y=cent(2);
    if prop(n).Area>1000
        text(X-10,Y,'akyuvar') 
        total=total+1;
    else
        total=total+1;
        text(X-10,Y,'alyuvar') 
    end
end

hold on
title(['Toplam: ',num2str(total),'Alyuvar ve Akyuvar'])