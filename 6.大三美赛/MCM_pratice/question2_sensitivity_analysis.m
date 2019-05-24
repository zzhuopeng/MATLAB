% Sensitivity analysis of second questions£¨global profit£©
load net.mat %Load neural network data
for i=0:2:10
    pnew=[i i i i i      %From 2016 to 2020 global profit
    127626.9142	141297.1222	154967.3302	168637.5382	182307.7462     %From 2016 to 2020 car production
    990.8007232	959.5200064	928.2392896	896.9585728	865.677856       %From 2016 to 2020 oil consumption
    184551.5651	190262.1011	195972.6371	201683.1731	207393.7091];   %From 2016 to 2020 GDP

    pnewn=tramnmx(pnew,minp,maxp); %The normalized parameters of the original input data are used to normalize the new data
    HiddenOut=logsig(W1*pnewn+repmat(B1,1,ForcastSamNum)); % Hidden layer output prediction results
    anewn=W2*HiddenOut+repmat(B2,1,ForcastSamNum); % Output prediction results
    %Restore the data from the network to the original order of magnitude
    anew=postmnmx(anewn,mint,maxt)
    
    xn=[newh anew];
    if i==0
        plot(2010:2020,xn,'y--o') %yellow
        hold on
    end
    if i==2
        plot(2010:2020,xn,'g--o') %green
        hold on
    end
    if i==4
        plot(2010:2020,xn,'b--o') %blue
        hold on
    end
    if i==6
        plot(2010:2020,xn,'red--o') %red
        hold on
    end
    if i==8
        plot(2010:2020,xn,'c--o') %Blue and green
        hold on
    end
    if i==10
        plot(2010:2020,xn,'m--o') %Purple
        hold on
    end
end

%drawing
plot(x,hzss,'k-*');
title('Neural Networks:prediction of sales volume');
legend('Forecast sales£ºprofit=0','Forecast sales£ºprofit=2','Forecast sales£ºprofit=4','Forecast sales£ºprofit=6','Forecast sales£ºprofit=8','Forecast sales£ºprofit=10','The actual car sales');
xlabel('year');ylabel('units');
hold off