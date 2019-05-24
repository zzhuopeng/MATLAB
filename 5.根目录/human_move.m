%连续加温，策略
t=50:70;
Q=(5.9312.*t-142.6372+)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'r-*');
hold on 

Q=(5.9312.*t-142.6372+)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'r-*');
hold on 

Q=(5.9312.*t-142.6372+)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'g-*');

%text(60,Q(11),'  (60,2.8206)');
title('The Curve of Water Flow on Temperature');
legend('','','');
%legend('');
xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
hold off