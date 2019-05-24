clc; clear all; close all;
I = imread('six.png');
%%
bw = im2bw(I);
[r, c]=find(bw==1);
[rectx, recty, area, perimeter] = minboundrect(c, r, 'a')
% 'a'�ǰ���������С���Σ�������߳���'p'
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(bw); hold on
line(rectx, recty, 'color', 'r');
[L, num] = bwlabel(bw); % ������
stats = regionprops(L); % ��������
subplot(1, 2, 2); imshow(bw); hold on
for i = 1 : num
    rect = stats(i).BoundingBox;
    cen = stats(i).Centroid;
    rectangle('Position', rect, 'EdgeColor', 'r');
end

% disp('�����');
% disp(area)
% % 
% disp('�ܳ���');
% disp(value)
% % value;
% 
% disp('������')
% w=sqrt((rectx(1)-rectx(2))^2+(recty(1)-recty(2))^2);
% disp(w)
% disp('������')
% h=sqrt((rectx(3)-rectx(2))^2+(recty(3)-recty(2))^2);
% disp(h)
% disp('������֮����')
% ratio=h/w;
% disp(ratio)