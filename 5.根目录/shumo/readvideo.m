% %% 
% clc;clear;
% % this to read avi by using mmread to get every frame
% video = mmreader('D:\My Documents\MATLAB\ɭ�ֻ���\My\fire.avi');
% nFrames = video.NumberOfFrames;   %�õ�֡��
% H = video.Height;     %�õ��߶�
% W = video.Width;      %�õ����
% Rate = video.FrameRate;
% % Preallocate movie structure.
% mov(1:nFrames) = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]);
% 
% 
% %read one frame every time
% for i = 1:nFrames
%     mov(i).cdata = read(video,i);
%     P = mov(i).cdata;
%      disp('��ǰ��֡����'),disp(i);
%      imshow(P),title('ԭʼͼƬ');
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
%��ʾ����d ���ļ�abc.avi ����Ϣ,��matlab2010 �汾�У��ú������Ի���mmreader 
mov=VideoReader('G:\Users\pengpeng\Desktop\Appendix4.avi');   %�����Ӱabc.avi 
movie(mov);             %��ӳ��Ӱ  
