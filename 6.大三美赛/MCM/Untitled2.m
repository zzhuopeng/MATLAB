% f=@(Q,T)(4.2*Q*(50-T)-2)*3600-(T-42)*4.2*1*1.176;%���庯��f=x^2+y^2-10
% ezplot(f)%��x^2+y^2-10=0��ͼ��
% axis equal;

% f=@(Q,T)-T-(15.658.*T-439.922-210.*Q-0.0576)./(4.2.*Q+0.0014);
% ezplot(f,[0,0.1],[]);

% %�������£�����
% t=50:70;
% Q=(15.658.*t-439.922)./(4.2.*(t-42));
% plot(t,Q,'b-*');
% title('');
% %legend('');
% xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% hold off

%�������£�����
t=50:70;
Q=(5.9312.*t-142.6372)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'b-*');
%text(60,Q(11),'  (60,2.8206)');
title('The Curve of Water Flow on Temperature');
%legend('');
xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
hold off

% %�������£�����
% t=50:70;
% Q=(5.9312.*t-142.6372+0.00000014340.*((t-273).^4-9845600000))./(4.2.*(t-42));%-142.6372%153.9228
% plot(t,Q,'b-*');
% %text(60,Q(11),'  (60,2.8206)');
% title('The curve of water flow on temperature');
% %legend('');
% xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
% hold off