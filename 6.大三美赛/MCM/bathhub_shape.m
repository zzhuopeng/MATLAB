% %连续加温，策略
% t=50:70;
% Q=((5.9312.*t-142.6372).*1.28./2.64)./(4.2.*(t-42));%-142.6372%153.9228
% plot(t,Q,'r-*');
% hold on 
% 
% Q=((5.9312.*t-142.6372).*2.64./2.64)./(4.2.*(t-42));%-142.6372%153.9228
% plot(t,Q,'b-*');
% hold on 
% 
% Q=((5.9312.*t-142.6372).*4.10./2.64)./(4.2.*(t-42));%-142.6372%153.9228
% plot(t,Q,'g-*');
% 
% %text(60,Q(11),'  (60,2.8206)');
% title('The curve of water flow on temperature');
% legend('Superficial Area：F=1.28m^2','Superficial Area：F=2.64m^2','Superficial Area：F=4.10m^2');
% xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% hold off

t=50:70;
A=1:0.2:5;
[t,A] = meshgrid(t,A);
Q=((5.9312.*t-142.6372).*A./2.64)./(4.2.*(t-42));
surf(t,A,Q);
colorbar; %右边那个色卡
title('The curve of water flow on temperature');
xlabel('Temperature[^oC]');ylabel('Superficial Area[m^2]');zlabel('Flow Velocity[L/min]');


