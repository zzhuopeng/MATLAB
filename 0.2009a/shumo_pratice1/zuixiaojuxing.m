clc; clear all; close all;
I = imread('six.png');
%%
bw = im2bw(I);
[r, c]=find(bw==1);
[rectx, recty, area, perimeter] = minboundrect(c, r, 'a')
% 'a'是按面积算的最小矩形，如果按边长用'p'
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(bw); hold on
line(rectx, recty, 'color', 'r');
[L, num] = bwlabel(bw); % 区域标记
stats = regionprops(L); % 区域属性
subplot(1, 2, 2); imshow(bw); hold on
for i = 1 : num
    rect = stats(i).BoundingBox;
    cen = stats(i).Centroid;
    rectangle('Position', rect, 'EdgeColor', 'r');
end

% disp('面积是');
% disp(area)
% % 
% disp('周长是');
% disp(value)
% % value;
% 
% disp('短轴是')
% w=sqrt((rectx(1)-rectx(2))^2+(recty(1)-recty(2))^2);
% disp(w)
% disp('长轴是')
% h=sqrt((rectx(3)-rectx(2))^2+(recty(3)-recty(2))^2);
% disp(h)
% disp('长短轴之比是')
% ratio=h/w;
% disp(ratio)