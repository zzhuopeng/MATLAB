load S 
load nd
S=S(:,1:2);
b={'As','Cd','Cr','Cu','Hg','Ni','Pb','Zn'};
for i=1:1:8
    Y=fix(nd(:,i));
    theta = [10 10]; lob = [1e-1 1e-1]; upb = [20 20];
    
    if (i==1||i==3||i==4||i==6)
         [dmodel, perf] = dacefit(S, Y, @regpoly0, @corrspherical, theta, lob, upb) %��״ģ��
    else
         [dmodel, perf] = dacefit(S, Y, @regpoly0, @correxp, theta, lob, upb) %ָ��ģ��
    %[dmodel, perf] = dacefit(S, Y, @regpoly0, @corrgauss, theta, lob, upb) %��˹ģ��
    end
    
    X = gridsamp([0 0;30000 20000], 100);
    [YX MSE] = predictor(X, dmodel)
    X1 = reshape(X(:,1),100,100);
    X2 = reshape(X(:,2),100,100);
    YX = reshape(YX, size(X1));
    %Semivariogram(distanceh) = 0.5 * average{(valuei-valuej)}2]
    figure(i), mesh(X1, X2, YX);
    hold on,
    plot3(S(:,1),S(:,2),Y,'.k', 'MarkerSize',12)
    hold off
    xlabel('x / m')
    ylabel('y / m')
    zlabel('Ԫ��Ũ��')
    title(b(i))
    %colormap gray
end