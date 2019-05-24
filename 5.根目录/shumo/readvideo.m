% %% 
% clc;clear;
% % this to read avi by using mmread to get every frame
% video = mmreader('D:\My Documents\MATLAB\森林火灾\My\fire.avi');
% nFrames = video.NumberOfFrames;   %得到帧数
% H = video.Height;     %得到高度
% W = video.Width;      %得到宽度
% Rate = video.FrameRate;
% % Preallocate movie structure.
% mov(1:nFrames) = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]);
% 
% 
% %read one frame every time
% for i = 1:nFrames
%     mov(i).cdata = read(video,i);
%     P = mov(i).cdata;
%      disp('当前播帧数：'),disp(i);
%      imshow(P),title('原始图片');
% 
% %     P2=rgb2gray(P);
%  
% end
% 
% 
% 
% %% read image by frame
% %aviFile='example.avi';
% myvideo=VideoReader('G:\Users\pengpeng\Desktop\Appendix4.avi');
% get(myvideo);
% nFrames = myvideo.NumberOfFrames;
% vidHeight = myvideo.Height;
% vidWidth = myvideo.Width;
% %Preallocate movie structure.
% mov(1:nFrames) = ...
%     struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
%            'colormap', []);
% %Read one frame at a time.
% for k = 1 : nFrames
%     mov(k).cdata = read(myvideo, k);
% end
% %Size a figure based on the video's width and height.
% hf = figure;
% set(hf, 'position', [150 150 vidWidth vidHeight])
% %Play back the movie once at the video's frame rate.
% movie(hf, mov, 25, myvideo.FrameRate);


%%
%aviinfo('G:\Users\pengpeng\Desktop\Appendix4.avi');  
%显示存在d 盘文件abc.avi 的信息,在matlab2010 版本中，该函数可以换成mmreader 
mov=VideoReader('G:\Users\pengpeng\Desktop\Appendix4.avi');   %读入电影abc.avi 
movie(mov);             %放映电影  
