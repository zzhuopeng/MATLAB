%连续加温，策略
t=50:70;
Q=((5.9312.*t-142.6372).*2.64./2.64)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'r-*');
hold on 

Q=((5.9312.*t-142.6372).*2.74./2.64)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'b-*');
hold on 

Q=((5.9312.*t-142.6372).*2.84./2.64)./(4.2.*(t-42));%-142.6372%153.9228
plot(t,Q,'g-*');

%text(60,Q(11),'  (60,2.8206)');
title('The Curve of Water Flow on Temperature');
legend('Superficial Area：F=2.64m^2','Superficial Area：F=2.74m^2','Auperficial Area：F=2.84m^2');
%legend('');
xlabel('Temperature[^oC]');ylabel('Flow Velocity[L/min]');
hold off

