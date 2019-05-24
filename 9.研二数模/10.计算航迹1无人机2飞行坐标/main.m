%% 计算轨迹L1无人机2、3、4的1-20时刻飞行坐标(单位：m)
clc;clear;
% 虚假航迹坐标
VP = xlsread('append1.xls',1,'B2:D21'); %读取sheet1的B2:D21区域数据
% 雷达坐标
% rada_location = zeros(5,3);
% rada_location(1,:) = [80   0    0];
% rada_location(2,:) = [30   60   0];
% rada_location(3,:) = [55   110  0];
% rada_location(4,:) = [105  110  0];
% rada_location(5,:) = [130  60   0];
load('rada_location.mat', 'rada_location')

%状态变量
RADA = 2; % 雷达编号
uavP = zeros(20,4,5); % 无人机航迹 坐标
for RADA=2:4
    for i=1:20  %遍历每一个虚拟航迹点
        %求第一个点坐标
        if i==1
            uavP(i,3,RADA) = 2300; %先随机选择一个高度，计算uav坐标
            [uavP(i,1,RADA), uavP(i,2,RADA)] = CalculateXYFromZ( rada_location(RADA,:), VP(i,:), uavP(i,3,RADA) );
        end

        %遍历第Next个虚拟航迹点和雷达3的连线，找出符合速度要求的点（）
        if i ~= 1
            for height=2000:2:2500
                %先求出备选点的坐标
                uavP(i,3,RADA) = height;
                [uavP(i,1,RADA), uavP(i,2,RADA)] = CalculateXYFromZ( rada_location(RADA,:), VP(i,:), uavP(i,3,RADA) );
                %计算是否满足速度要求
                tempDis = distance(uavP(i,:,RADA), uavP(i-1,:,RADA));

                if tempDis/10 >=29.3 && tempDis/10 <= 50
                    %满足要求直接退出for循环
                    uavP(i,4,RADA) = tempDis/10; %保存所需速度
                    break;
                else
                    %如果最后一个备选点都不满足，则选择中间一个备选点
                    if(height == 2500)
                        uavP(i,3,RADA) = 2300;
                        [uavP(i,1,RADA), uavP(i,2,RADA)] = CalculateXYFromZ( rada_location(RADA,:), VP(i,:), uavP(i,3,RADA) );
                        uavP(i,3,RADA) = 0; %做一个标记Mark，便于阅读
                    end
                    %不满足要求退出当前循环
                    continue;
                end
            end
        end
    end
end

% 提示已经运行完毕
fprintf('Finish');