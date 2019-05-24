%% ����켣L1���˻�2��3��4��1-20ʱ�̷�������(��λ��m)
clc;clear;
% ��ٺ�������
VP = xlsread('append1.xls',1,'B2:D21'); %��ȡsheet1��B2:D21��������
% �״�����
% rada_location = zeros(5,3);
% rada_location(1,:) = [80   0    0];
% rada_location(2,:) = [30   60   0];
% rada_location(3,:) = [55   110  0];
% rada_location(4,:) = [105  110  0];
% rada_location(5,:) = [130  60   0];
load('rada_location.mat', 'rada_location')

%״̬����
RADA = 2; % �״���
uavP = zeros(20,4,5); % ���˻����� ����
for RADA=2:4
    for i=1:20  %����ÿһ�����⺽����
        %���һ��������
        if i==1
            uavP(i,3,RADA) = 2300; %�����ѡ��һ���߶ȣ�����uav����
            [uavP(i,1,RADA), uavP(i,2,RADA)] = CalculateXYFromZ( rada_location(RADA,:), VP(i,:), uavP(i,3,RADA) );
        end

        %������Next�����⺽������״�3�����ߣ��ҳ������ٶ�Ҫ��ĵ㣨��
        if i ~= 1
            for height=2000:2:2500
                %�������ѡ�������
                uavP(i,3,RADA) = height;
                [uavP(i,1,RADA), uavP(i,2,RADA)] = CalculateXYFromZ( rada_location(RADA,:), VP(i,:), uavP(i,3,RADA) );
                %�����Ƿ������ٶ�Ҫ��
                tempDis = distance(uavP(i,:,RADA), uavP(i-1,:,RADA));

                if tempDis/10 >=29.3 && tempDis/10 <= 50
                    %����Ҫ��ֱ���˳�forѭ��
                    uavP(i,4,RADA) = tempDis/10; %���������ٶ�
                    break;
                else
                    %������һ����ѡ�㶼�����㣬��ѡ���м�һ����ѡ��
                    if(height == 2500)
                        uavP(i,3,RADA) = 2300;
                        [uavP(i,1,RADA), uavP(i,2,RADA)] = CalculateXYFromZ( rada_location(RADA,:), VP(i,:), uavP(i,3,RADA) );
                        uavP(i,3,RADA) = 0; %��һ�����Mark�������Ķ�
                    end
                    %������Ҫ���˳���ǰѭ��
                    continue;
                end
            end
        end
    end
end

% ��ʾ�Ѿ��������
fprintf('Finish');