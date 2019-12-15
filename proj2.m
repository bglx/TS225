% 2*4 pts en commun sur images
% calcule homographie H
% projection image entiere pour avoir le cadre (attention sens)
% fusion des 2 images dans cadre + grand
% masque : pour faire moyennage des images (nombre de pixels communs)
% 

clear ; clc ; close all ;

IMG1 = double(imread("Dragon02.png"))/256;
IMG2 = double(imread("Dragon01.png"))/256;

[h1, w1] = size(IMG1);
[h2, w2] = size(IMG2);

IMG1 = rgb2gray(IMG1);
IMG2 = rgb2gray(IMG2);

[IMG1, Mask1, box1] = mib(IMG1);
[IMG2, Mask2, box2] = mib(IMG2);

% figure(1), imagesc(IMG1), colormap(gray);
% [XA, YA] = ginput(4);
% close(1);
% 
% figure(2), imagesc(IMG2), colormap(gray);
% [XB, YB] = ginput(4);
% close(2);

load("points.mat");

%% PROJECTION

% calcul des homographies dans les deux sens differents

H1 = homographie(XA, YA, XB, YB);
H2 = homographie(XB, YB, XA, YA);

[IMG11, Mask11, box11] = mib2(IMG1, Mask1, box1, H2, H1);

[IMG, Mask, box] = fusion(IMG11, Mask11, box11, IMG2, Mask2, box2);

