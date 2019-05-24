% % %连续加温，策略
% % t=50:70;
% % Q=((5.9312.*t-142.6372).*9.0./9.0)./(4.2.*(t-42));%-142.6372%153.9228
% % plot(t,Q,'r-*');
% % hold on
% % 
% % Q=((5.9312.*t-142.6372).*3./9.0)./(4.2.*(t-42));%-142.6372%153.9228
% % plot(t,Q,'g-*');
% % 
% % %text(60,Q(11),'  (60,2.8206)');
% % title('The Curve of Water Flow on Temperature');
% % legend('without bubble','with bubble');
% % %legend('');
% % xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% % hold off
% 
% %连续加温，策略
% t=50:70;
% Q=(5.9312.*t.*0.6./0.6-142.6372)./(4.2.*(t-42));% 
% plot(t,Q,'r-*');
% hold on
% 
% Q=(5.9312.*t.*0.44./0.6-142.6372)./(4.2.*(t-42));%泡泡剂导热系数0.33~0.54
% plot(t,Q,'g-*');
% 
% %text(60,Q(11),'  (60,2.8206)');
% title('The Curve of Water Flow on Temperature');
% legend('without bubble','with bubble');
% %legend('');
% xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% hold off

t=50:70;
alpha=0.1:0.1:0.8;
[t,alpha] = meshgrid(t,alpha);
Q=(5.9312.*t.*alpha./0.6-142.6372)./(4.2.*(t-42));
surf(t,alpha,Q);
colorbar; %右边那个色卡
title('The curve of water flow on temperature');
xlabel('Temperature[^oC]');ylabel('Alpha[W/(m^2·^oC)]');zlabel('Flow Velocity[L/min]');