%Second exponential smoothing method£ºForecast global profit¡¢car production¡¢oil consumption and GDP for Volkswagen in the next five years.
clc,clear
t=2010:2020;
% y=[7.23	15.8	21.88	9.12	10.93	9.78]; %From 2010 to 2015 global profit( +2 )
% y=[38231	40401	107232	132520	117628	109379];%From 2010 to 2015 car production( -1 )
% y=[850	894.72	963.08	983.94	836.1	1057.86];%From 2010 to 2015 oil consumption( -1 )
y=[149644	155179	161632	167681	174190	178700];%From 2010 to 2015 GDP( +2 )
n=length(y);
alpha=0.6; st1(1)=y(1); st2(1)=y(1);
for i=2:n
    st1(i)=alpha*y(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
%xlswrite('fadian.xls',[st1',st2'])
a=2*st1-st2;
b=alpha/(1-alpha)*(st1-st2);
y_fit=a+b;
%xlswrite('fadian.xls',yhat','Sheet1','C2')
s=y_fit;
%predict
for i=1:5
    s(n+i)=a(n)+i*b(round(n/2)+2); 
end
plot(t(1:6),y,'-*',t,s(1:11),'-O')
% title('Second exponential smoothing method:prediction of Selling profit');xlabel('year');ylabel('Billion Euro');legend('The actual selling profit','Forecast selling profit',2);
% title('Second exponential smoothing method:prediction of Automotive output');xlabel('year');ylabel('units');legend('The actual Automotive output','Forecast Automotive output',2);
% title('Second exponential smoothing method:prediction of oil consumption');xlabel('year');ylabel('Million ton');legend('The actual oil consumption','Forecast oil consumption',2);
title('Second exponential smoothing method:prediction of GDP');xlabel('year');ylabel('Billion dols');legend('The actual GDP','Forecast GDP',2);
for i=1:5
    s(6+i) %2016 to 2020
end
