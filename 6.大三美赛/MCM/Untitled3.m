% t=0:70;
% Q=log(t)/2+40;
% plot(t,Q,'g-');
% title('Temperature Curve of Continuous heating');
% %legend('Temperature Curve of Continuous heating');
% xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% hold off

%连续
T(1)=39;
t=1:1:70;
for t=1:1:70
    %Q1*t=20*(T(t+1)-T(t))+10*(T(t)-10)*t;
    %T(t+1)=T(t)+(80*t-2.*(T(t)-2).*t)./20;
    T(t+1)=(1-t./41.5).*T(t)+t+t./100;
end
t=1:2:142;
plot(t(1:30),T(1:30),'g-');
title('The Temperature Curve of Continuous Heating');%Intermittent Heating %Continuous Heating
xlabel('time[min]');ylabel('Temperature[^oC]');
% hold on

% %不连续
% T(1)=39;
% t=1:1:70;
% for t=1:1:70
%     %Q1*t=20*(T(t+1)-T(t))+10*(T(t)-10)*t;
%     %T(t+1)=T(t)+(80*t-2.*(T(t)-2).*t)./20;
%     if(41.4<=T(t)<=41.8)
%         T(t+1)=(1-t./41.5).*T(t)+t+t./100;
%     end
%     if(T(t)>41.8)
%         T(t+1)=(1+t./41.5).*T(t)-t-t./100;
%     end
% end
% t=1:2:142;
% plot(t(1:30),T(1:30),'g-');
% hold on