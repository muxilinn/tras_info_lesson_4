clc;
clear all;

% 读取图像
I = imread('lenna.jpg');
subplot(2,3,1);
imshow(I);
title('原始图像');

R_data = I(:,:,1);
G_data = I(:,:,2);
B_data = I(:,:,3);

% 加权平均灰度化
I_weighted = 0.299*R_data + 0.587*G_data + 0.114*B_data;
subplot(2,3,2);
imshow(I_weighted);
title('加权平均图像');

% 最大值灰度化
I_max = max(max(R_data, G_data), B_data);
subplot(2,3,3);
imshow(I_max);
title('最大值灰度化图像');

% 平均值灰度化
I_mean = (R_data + G_data + B_data) / 3;
subplot(2,3,4);
imshow(I_mean);
title('平均值灰度化图像');

% 自带灰度化
I_builtin = rgb2gray(I);
subplot(2,3,5);
imshow(I_builtin);
title('自带灰度化图像');

% 灰度直方图
subplot(2,3,6);
histogram(I_weighted(:), 256);
title('灰度直方图');

figure;

% 中值滤波
I_median = medfilt2(I_weighted, [3 3]);
subplot(2,3,1);
imshow(I_median);
title('中值滤波图像');

% 平均值滤波
I_mean = imfilter(I_weighted, fspecial('average', 3));
subplot(2,3,2);
imshow(I_mean);
title('平均值滤波图像');

% 高斯滤波
I_gaussian = imfilter(I_weighted, fspecial('gaussian', 3, 1));
subplot(2,3,3);
imshow(I_gaussian);
title('高斯滤波图像');