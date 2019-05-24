function drawsphere(a,b,c,R)
%% ��������
% ��(a,b,c)Ϊ���ģ�RΪ�뾶

    % ��������
    [x,y,z] = sphere(20);

    % �����뾶
    x = R*x; 
    y = R*y;
    z = R*z;

    % ��������
    x = x+a;
    y = y+b;
    z = z+c;

    % ʹ��mesh����
%     figure;
%     axis equal;
%     mesh(x,y,z,'linewidth',1.5);

    % ʹ��surf����
%     figure;
    axis equal;
    surf(x,y,z);
    alpha(0.5) %���͸����
end