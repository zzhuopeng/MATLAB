% %连续加温，策略
% t=50:70;
% Q=(5.9312.*t-142.6372+0)./(4.2.*(t-42));%-142.6372%153.9228
% plot(t,Q,'r-*');
% hold on 
% 
% Q=(5.9312.*t-142.6372+20)./(4.2.*(t-42));%-142.6372%153.9228
% plot(t,Q,'g-*');
% 
% %text(60,Q(11),'  (60,2.8206)');
% title('The Curve of Water Flow on Temperature');
% legend('without body temperature','with body temperature');
% %legend('');
% xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% hold off

t=50:70;
Q1=0:30;
[t,Q1] = meshgrid(t,Q1);
Q=(5.9312.*t-142.6372+Q1)./(4.2.*(t-42));
surf(t,Q1,Q);
colorbar; %右边那个色卡
title('The curve of water flow on temperature');
xlabel('Temperature[^oC]');ylabel('Q^，[kj/min]');zlabel('Flow Velocity[L/min]');