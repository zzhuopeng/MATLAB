%�������£�����
t=5:30;

Q=(5.9312.*50-142.6372+(25-t)*15.6583)./(4.2.*(50-42));%50���϶�
plot(t,Q,'m-*');
hold on

Q=(5.9312.*55-142.6372+(25-t)*15.6583)./(4.2.*(55-42));%55���϶�
plot(t,Q,'g-*');
hold on

Q=(5.9312.*60-142.6372+(25-t)*15.6583)./(4.2.*(60-42));%60���϶�
plot(t,Q,'b-*');
hold on

Q=(5.9312.*65-142.6372+(25-t)*15.6583)./(4.2.*(65-42));%65���϶�
plot(t,Q,'r-*');
hold on

Q=(5.9312.*70-142.6372+(25-t)*15.6583)./(4.2.*(70-42));%65���϶�
plot(t,Q,'c-*');
hold on

title('The Curve of Water Flow on Indoor Temperature');
legend('Temperature of Hot Water��50^oC','Temperature of Hot Water��55^oC','Temperature of Hot Water��60^oC','Temperature of Hot Water��65^oC','Temperature of Hot Water��70^oC');
xlabel('Indoor Temperature[^oC]');ylabel('Flow Velocity[L/min]');
hold off