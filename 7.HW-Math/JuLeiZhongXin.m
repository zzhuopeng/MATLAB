%聚类-重心法
clear
clear all
A  = xlsread('D:\test', 1, 'A1:E110');
B  = A(:,1);
C =  A(:,2);
D =  A(:,3);
%Q =  A(:,4)
Q =  A(:,5);
NU = 790;
point01 = 854;%
point_res(1) = point01;
[n,N] = size(C);
Dis_max =0;
for i = 1:n
     Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2);
       if i < 885-790
       if Dis_max < Dis
           Dis_max = Dis ;
           point  = i+790;
       end
       end
end
Dis_max =0;
point02 = point ; %862
point_res(2) = point02;
for i= 1:n
     Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2) + sqrt( (B(i) -B(point02-790) )^2 + ( C(i) -C(point02-790) )^2);
     if i < 885-790
     if Dis_max <= Dis
         Dis_max = Dis ;
         point = i+790 ;
     end
     end
end
Dis_max =0;
point03 = point;%896
point_res(3) = point03;
for i= 1:n
     Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2) + sqrt( (B(i) -B(point02-790) )^2 + ( C(i) -C(point02-790) )^2)+...
         sqrt( (B(i) -B(point03-790) )^2 + ( C(i) -C(point03-790) )^2);
    if i < 885-790
        if Dis_max <= Dis
            Dis_max = Dis ;
            point = i+790;
        end
    end
end
Dis_max =0;
point04 = point ;%792
point_res(4) = point04;
for i= 1:n
     Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2) + sqrt( (B(i) -B(point02-790) )^2 + ( C(i) -C(point02-790) )^2) + ...
         sqrt( (B(i) -B(point03-790) )^2 + ( C(i) -C(point03-790) )^2)+sqrt( (B(i) -B(point04-790) )^2 + ( C(i) -C(point04-790) )^2);
    if i < 885-790
        if Dis_max <= Dis
            Dis_max = Dis ;
            point = i+790;
        end
    end
end
Dis_max =0;
point05 = point; %798
point_res(5) = point05;
for i= 1:n
     Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2) + sqrt( (B(i) -B(point02-790) )^2 + ( C(i) -C(point02-790) )^2) + ...
         sqrt( (B(i) -B(point03-790) )^2 + ( C(i) -C(point03-790) )^2)+sqrt( (B(i) -B(point04-790) )^2 + ( C(i) -C(point04-790) )^2)+sqrt( (B(i) -B(point05-790) )^2 + ( C(i) -C(point05-790) )^2);
    if i < 885-790
        if Dis_max <= Dis
            Dis_max = Dis ;
            point = i+790;
        end
    end
end
Dis_max =0;
point06 = point; %884
point_res(6) = point06;
for i= 1:n
     Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2) + sqrt( (B(i) -B(point02-790) )^2 + ( C(i) -C(point02-790) )^2) + ...
         sqrt( (B(i) -B(point03-790) )^2 + ( C(i) -C(point03-790) )^2)+sqrt( (B(i) -B(point04-790) )^2 + ( C(i) -C(point04-790) )^2)+sqrt( (B(i) -B(point05-790) )^2 + ( C(i) -C(point05-790) )^2)...
         + sqrt( (B(i) -B(point06-790) )^2 + ( C(i) -C(point06-790) )^2);
    if i < 885-790
        if Dis_max <= Dis
            Dis_max = Dis ;
            point = i+790;
        end
    end
end
Dis_max =0;
point07 = point; %884
point_res(7) = point07;
point08 = 888;
point_res(8) = point08;
for i= 1:n
     Dis = sqrt( (B(i) -B(point08-790) )^2 + ( C(i) -C(point08-790) )^2) ;
     if i > 885-790
     if Dis_max <= Dis
         Dis_max = Dis ;
         point = i+790 ;
     end
     end
end
Dis_max =0;
point09 = point; %896
point_res(9) = point09;
%{
for i =1:9
    if i < 7
    point_ok(i) = point_res(i);
    end
    if i> 7
        point_ok(i-1) = point_res(i);
    end
 
end
point_ok ;
%}
for i=1:n
        if i == point01 -NU 
       h1 = plot(B(i),C(i),'rx');
        hold on 
    elseif i == point02 -NU  
        h2 =plot(B(i),C(i),'bo');
        hold on
    elseif i == point03 -NU
        h3=plot(B(i),C(i),'kd');
        hold on
    elseif i == point04 -NU
        h4=plot(B(i),C(i),'k+');
        hold on
    elseif i == point05 -NU
       h5 =plot(B(i),C(i),'m^');
        hold on
    elseif i == point06 -NU
       h6= plot(B(i),C(i),'ch');
        hold on
    elseif i == point07 -NU
       h7= plot(B(i),C(i),'kd');
        hold on
    elseif i == point08 -NU
       h8= plot(B(i),C(i),'r<');
        hold on
    elseif i == point09 -NU
       h9= plot(B(i),C(i),'r^');
        hold on
    else
        h10= plot(B(i),C(i),'g*') ;
         hold on
    end
end
%        title('聚类中心点图');
%       xlabel('中心点X')
%       ylabel('中心点Y')
%        legend([h1,h2,h3,h4,h5,h6,h8,h9,h10],'聚类中心点一','聚类中心点二','聚类中心点三','聚类中心点四','聚类中心点五','聚类中心点六','聚类中心点七','聚类中心点八','其他中心点')
 
 
%point00 = 890 point01 = 862 point02 = 896  
%point03 = 792 point04 = 798 point05 = 884 
% 854   812   862   884   798   799   888   896
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point01-790) )^2 + ( C(i) -C(point01-790) )^2);
    if Dis <= 8400
       if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU      
    h1=    plot(B(i),C(i),'rx');
        hold on
       end
        ponit = i+ NU;
        point001(j) = i+NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point02-790) )^2 + ( C(i) -C(point02-790) )^2);
    if Dis <= 6300
       if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU    
     h2=  plot(B(i),C(i),'bo');
       hold on
       end
        ponit = i+ NU;
        point002(j) = i+NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point03-790) )^2 + ( C(i) -C(point03-790) )^2);
    if Dis <= 4700
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU     
      h3=  plot(B(i),C(i),'kd');
        hold on
       end
        ponit = i+ NU;
        point003(j) = i+NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point04-790) )^2 + ( C(i) -C(point04-790) )^2);
    if Dis <= 6000
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU     
     h4=   plot(B(i),C(i),'y+');
        hold on
       end
        ponit = i+ NU;
        point004(j) = i+NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point05-790) )^2 + ( C(i) -C(point05-790) )^2);
    if Dis <= 5000
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU     
     h5=   plot(B(i),C(i),'m^');
        hold on
       end
        ponit = i+ NU;
        point005(j) = i+NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point06-790) )^2 + ( C(i) -C(point06-790) )^2);
    if Dis <= 5000
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU     
      h6=  plot(B(i),C(i),'ch');
        hold on
       end
        ponit = i+ NU;
        point006(j) = i+ NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point07-790) )^2 + ( C(i) -C(point07-790) )^2);
    if Dis <= 4700
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU    
     h7=   plot(B(i),C(i),'kd');
        hold on
       end
        ponit = i+ NU;
        point007(j) = i+ NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point08-790) )^2 + ( C(i) -C(point08-790) )^2);
    if Dis <= 6000
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU    
     h8=   plot(B(i),C(i),'y<');
        hold on
       end
        ponit = i+ NU;
        point008(j) = i+ NU;
        j = j+1;
    end
end
j=1;
for  i=1:n
    Dis = sqrt( (B(i) -B(point09-790) )^2 + ( C(i) -C(point09-790) )^2);
    if Dis <= 5000
        if i ~= point01 -NU && i ~= point02 -NU  && i ~= point03 -NU...
         && i ~= point04 -NU && i ~= point05 -NU && i ~= point06 -NU &&i ~= point07 -NU...
         &&i ~= point08 -NU    &&i ~= point09 -NU  
      h9=  plot(B(i),C(i),'r^');
        hold on
%       title('聚类中心及聚类区图');
        xlabel('中心点X')
        ylabel('中心点Y')
       end
        ponit = i+ NU;
        point009(j) = i+ NU;
        j = j+1;
    end
end
%point00 = 890 point01 = 862 point02 = 896  
%point03 = 792 point04 = 798 point05 = 884 
 
[N,n] = size(point001);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point001(i)-790);
    y(i) = C(point001(i)-790);
    a(i) = Q(point001(i)-790);
end
 
 
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
while(T1-T0<=0)                                              
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
 
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(1) = x1;
r_y(1) = y1;
plot(x1,y1,'rs') % 重心
hold on 
%798;
 
[N,n] = size(point002);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point002(i)-790);
    y(i) = C(point002(i)-790);
    a(i) = Q(point002(i)-790);
end
 
 
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
while(T1-T0<=0)                                                 
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
 
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(2) = x1;
r_y(2) = y1;
plot(x1,y1,'rs') % 重心
hold on 
%point00 = 890 point01 = 862 point02 = 896  
%point03 = 792 point04 = 798 point05 = 884 
 
[N,n] = size(point003);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point003(i)-790);
    y(i) = C(point003(i)-790);
    a(i) = Q(point003(i)-790);
end
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
while(T1-T0<=0)                                                
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end    
    x1=a1/a2;
    y1=b1/b2;    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end  
    T0;
    T1;
end
x1;
y1;
r_x(3) = x1;
r_y(3) = y1;
plot(x1,y1,'rs') % 重心
hold on 
%point00 = 890 point01 = 862 point02 = 896  
%point03 = 792 point04 = 798 point05 = 884 
[N,n] = size(point004);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point004(i)-790);
    y(i) = C(point004(i)-790);
    a(i) = Q(point004(i)-790);
end
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
while(T1-T0<=0)                                                 
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end   
    x1=a1/a2;
    y1=b1/b2;   
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end    
    T0;
    T1;
end
x1;
y1;
r_x(4) = x1;
r_y(4)= y1;
plot(x1,y1,'rs') % 重心
hold on 
%point00 = 890 point01 = 862 point02 = 896  
%point03 = 792 point04 = 798 point05 = 884 
[N,n] = size(point005)
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point005(i)-790);
    y(i) = C(point005(i)-790);
    a(i) = Q(point005(i)-790);
end
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
for i =1:50                                              
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end    
    x1=a1/a2;
    y1=b1/b2;    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    T0;
    T1;
end
x1;
y1;
r_x(5) = x1;
r_y(5) = y1;
plot(x1,y1,'rs') % 重心
hold on 
%point00 = 890 point01 = 862 point02 = 896  
%point03 = 792 point04 = 798 point05 = 884 
[N,n] = size(point006);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point006(i)-790);
    y(i) = C(point006(i)-790);
    a(i) = Q(point006(i)-790);
end
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
%while(T1-T0<=0)   
while(T1-T0<=0)  
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(6) = x1;
r_y(6) = y1;
plot(x1,y1,'rs') % 重心
[N,n] = size(point007);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point007(i)-790);
    y(i) = C(point007(i)-790);
    a(i) = Q(point007(i)-790);
end
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
%while(T1-T0<=0)   
while(T1-T0<=0)  
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(7) = x1;
r_y(7) = y1;
plot(x1,y1,'rs') % 重心
[N,n] = size(point008);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    x(i) = B(point008(i)-790);
    y(i) = C(point008(i)-790);
    a(i) = Q(point008(i)-790);
end
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
%while(T1-T0<=0)   
while(T1-T0<=0)   
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
 
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(8) = x1;
r_y(8) = y1;
plot(x1,y1,'rs') % 重心
 
[N,n] = size(point009);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
for i=1:n
    point009(i);
    x(i) = B(point009(i)-790);
    y(i) = C(point009(i)-790);
    a(i) = Q(point009(i)-790);
end
 
 
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
%while(T1-T0<=0)   
for i =1:10  
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
 
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(9) = x1;
r_y(9) = y1;
plot(x1,y1,'rs') % 重心
 
point_node_01 = [867,883,860,856,870,878,866,863,865,864,861,875,881,883];
[N,n] = size(point_node_01);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
point_node_01;
for i=1:n
    point_node_01(i);
    x(i) = B(point_node_01(i)-790);
    y(i) = C(point_node_01(i)-790);
    a(i) = Q(point_node_01(i)-790);
end
 
 
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
%while(T1-T0<=0)   
while(T1-T0<=0)  
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
 
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(10) = x1;
r_y(10) = y1;
h11 =plot(x1,y1,'rp') % 重心
point_node_02 = [792,791,794,796,795,804,806,809,818,811,821,807,816,828];
[N,n] = size(point_node_02);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
 
for i=1:n
    x(i) = B(point_node_02(i)-790);
    y(i) = C(point_node_02(i)-790);
    a(i) = Q(point_node_02(i)-790);
end
 
 
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
%while(T1-T0<=0)   
while(T1-T0<=0)  
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*d(i);
    end
 
    for i=1:n
        a1=a1+a(i)*x(i)/d(i);
        a2=a2+a(i)/d(i);
        b1=b1+a(i)*y(i)/d(i);
        b2=b2+a(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(11) = x1;
r_y(11) = y1;
h12 = plot(x1,y1,'bp') % 重心
point_node_03 = [898,894,900];
[N,n] = size(point_node_03);
x0=0;
y0=0;
x1=0;
y1=0;
%x=[];
%y=[];
%d=[];
%a=[];
 
for i=1:n
    x(i) = B(point_node_03(i)-790);
    y(i) = C(point_node_03(i)-790);
    a(i) = Q(point_node_03(i)-790);
end
 
 
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
T0=200;
T1=100;
 
%while(T1-T0<=0)   
for i =1:10   
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:n
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+d(i);
    end
 
    for i=1:n
        a1=a1+x(i)/d(i);
        a2=a2+1/d(i);
        b1=b1+y(i)/d(i);
        b2=b2+1/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:n
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*d(i);
    end
    
    T0;
    T1;
end
x1;
y1;
r_x(12) = x1;
r_y(12) = y1;
h13=plot(x1,y1,'kp') % 重心
r_x;
r_y;
%}
%title('聚类区域选址选址示意图');
title('优化后聚类-重心法区域节点选址示意图');
        legend([h1,h2,h3,h4,h5,h6,h8,h9,h11,h12,h13,h10],'聚类区域一','聚类区域二','聚类区域三','聚类区域四','聚类区域五','聚类区域六','聚类区域七','聚类区域八','聚类区域九','聚类区域十','聚类区域十一','其他区域')
for i =1:12
    rectangle('position',[r_x(i)-3000,r_y(i)-3000,6000,6000],'curvature',[1,1]),axis equal  
end
