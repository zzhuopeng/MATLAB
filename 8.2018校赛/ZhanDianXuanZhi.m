% ������վ��ѡַ
clear all
%��ȡ����վ����Ϣ
lat=xlsread('AllZhanDianData.xlsx',1, 'B1:B643');
long=xlsread('AllZhanDianData.xlsx',1, 'A1:A643');

% NUM=200;%���ѡȡ��վ��
% Dis_max =0;
% for i = 1:n
%     Dis = sqrt( (lat(i) -lat(NUM) )^2 + ( long(i) -long(NUM) )^2);
%     if Dis_max < Dis
%         Dis_max = Dis ;
%         point  = i;%��һ���ۺ����ĵ�
%     end
% end
% 
% 
% 
% B  = A(:,1);
% C =  A(:,2);
% D =  A(:,3);
% %Q =  A(:,4)
% Q =  A(:,5);
% NU = 790;
% point01 = 854;%
% point_res(1) = point01;
% [n,N] = size(C);
% Dis_max =0;
% for i = 1:n
%      Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2);
%        if i < 885-790
%        if Dis_max < Dis
%            Dis_max = Dis ;
%            point  = i+790;
%        end
%        end
% end



%% �������к�ѡ��վ
plot(lat,long,'*');hold on
%������Ӷ�Ӧ��ע
% for i=1:size(lat)
%     text( lat(i,1)+0.00001, long(i,1)+0.00001, int2str(i) ); 
% end

%% ��Բ(RΪ50�����Ӧ�ľ�γ��)
% R=sqrt((107.846288820827-107.332148640443)^2+(29.233971349701-29.235031756472)^2); %R=0.514141273919743;
R=0.589141273919743;
%����վ
SUZ=[205,128,247,253,117,86,45,452,301,414,412,147,329,325,347,198,216];
length(SUZ)
for i=SUZ
    plot(lat(i,1), long(i,1),'ro');hold on;%�������վ
    plotCircle(lat(i,1), long(i,1), R, 'c');hold on;%����վ��Բ
    text( lat(i,1)+0.00001, long(i,1)+0.00001, int2str(i) );%����վ��ע
end

%��������վ
for i=1:length(SUZ)
    for j = (i+1):length(SUZ)
        m=SUZ(i);
        n=SUZ(j);
        if (sqrt((lat(m)-lat(n))^2+(long(m)-long(n))^2) < 0.589141273919743)
            x=[lat(m),lat(n)];
            y=[long(m),long(n)];
            plot( x, y,'-r','MarkerSize',2);hold on;
        end
    end
end

%% (��һ��)����վ������վ
% SUZ_S = [253,247,128];
% %����վ���÷�Χ
% for i=SUZ_S
%     plotCircle(lat(i,1), long(i,1), R*2/5, 'g');hold on;%����վ��Բ
% end
% 
% %����1����վ
% SUZ_S1 = [285,102,291];
% SUZ_S2 = [248,225,274];
% SUZ_S3 = [122,135];
% for i=253
%     for j=SUZ_S1
%         plot(lat(j,1), long(j,1),'go');hold on;%���1��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% for i=247
%     for j=SUZ_S2
%         plot(lat(j,1), long(j,1),'go');hold on;%���1��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% for i=128
%     for j=SUZ_S3
%         plot(lat(j,1), long(j,1),'go');hold on;%���1��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% %������1��2����վ
% SUZ_S11 = [283];
% for i=285
%     for j=SUZ_S11
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% SUZ_S12 = [105];
% for i=102
%     for j=SUZ_S12
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% SUZ_S13 = [287];
% for i=291
%     for j=SUZ_S13
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% %������2��2����վ
% SUZ_S21 = [242];
% for i=248
%     for j=SUZ_S21
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% %������3��2����վ
% SUZ_S31 = [123];
% for i=122
%     for j=SUZ_S31
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% SUZ_S32 = [116,233];
% for i=135
%     for j=SUZ_S32
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end
% 
% SUZ_S321 = [13];
% for i=233
%     for j=SUZ_S321
%         plot(lat(j,1), long(j,1),'go');hold on;%���2��
%         plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
%         text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
%     end
% end

%% (�ڶ���)����վ������վ
SUZ_S = [253,247,128];
%����վ���÷�Χ
for i=SUZ_S
    plotCircle(lat(i,1), long(i,1), R*2/5, 'g');hold on;%����վ��Բ
end

%����1����վ
SUZ_S1 = [285,102,291];
SUZ_S2 = [248,225,274];
SUZ_S3 = [122,135];
for i=253
    for j=SUZ_S1
        plot(lat(j,1), long(j,1),'go');hold on;%���1��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
for i=247
    for j=SUZ_S2
        plot(lat(j,1), long(j,1),'go');hold on;%���1��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
for i=128
    for j=SUZ_S3
        if(j==135)
            plot(lat(j,1), long(j,1),'mo');hold on;%���1��
            plot([lat(i),lat(j)], [long(i),long(j)],'--m','MarkerSize',1);hold on;
            text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
        end
        
        plot(lat(j,1), long(j,1),'go');hold on;%���1��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
%������1��2����վ
SUZ_S11 = [283];
for i=285
    for j=SUZ_S11
        plot(lat(j,1), long(j,1),'go');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
SUZ_S12 = [105];
for i=102
    for j=SUZ_S12
        plot(lat(j,1), long(j,1),'go');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
SUZ_S13 = [287];
for i=291
    for j=SUZ_S13
        plot(lat(j,1), long(j,1),'go');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
%������2��2����վ
SUZ_S21 = [242];
for i=248
    for j=SUZ_S21
        plot(lat(j,1), long(j,1),'go');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
%������3��2����վ
SUZ_S31 = [123];
for i=122
    for j=SUZ_S31
        plot(lat(j,1), long(j,1),'go');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
SUZ_S32 = [116,233];
for i=135
    for j=SUZ_S32
        plot(lat(j,1), long(j,1),'mo');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--m','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end
%��3��2����վ���ӵ�3����վ
SUZ_S321 = [13];
for i=233
    for j=SUZ_S321
        plot(lat(j,1), long(j,1),'go');hold on;%���2��
        plot([lat(i),lat(j)], [long(i),long(j)],'--g','MarkerSize',1);hold on;
        text( lat(j,1)+0.00001, long(j,1)+0.00001, int2str(j) );%����վ��ע
    end
end

%������վ��
xz=[(lat(122)+lat(267))/2 , (long(122)+long(267))/2;
    (lat(118)+lat(242))/2 , (long(118)+long(242))/2;
    (lat(124)+lat(123))/2 , (long(124)+long(123))/2;
    (lat(124)+lat(121))/2 , (long(124)+long(121))/2];
%247����վ
plot( xz(1,1) , xz(1,2) , 'bo','MarkerFaceColor','b');hold on;%���1��
plot([lat(247),xz(1,1)], [long(247),xz(1,2)],'--b','MarkerSize',1);hold on;
%247����վ�Լ���վ
plot( xz(2,1) , xz(2,2) , 'bo','MarkerFaceColor','b');hold on;%���1��
plot([xz(2,1),xz(1,1)], [xz(2,2),xz(1,2)],'--b','MarkerSize',1);hold on;

%128����վ
plot(xz(3,1) , xz(3,2) , 'bo','MarkerFaceColor','b');hold on;%���1��
plot([lat(128),xz(3,1)], [long(128),xz(3,2)],'--b','MarkerSize',1);hold on;
%128����վ�Լ���վ
plot( xz(4,1) , xz(4,2) , 'bo','MarkerFaceColor','b');hold on;%���1��
plot([xz(4,1),xz(3,1)], [xz(4,2),xz(3,2)],'--b','MarkerSize',1);hold on;


xlabel('����');
ylabel('γ��');
title('��վ�ֲ�ͼ');
