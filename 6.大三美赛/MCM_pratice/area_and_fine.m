%question 1£ºDrawing and calculate the total amount of fines
%% drawing
x=2010:1:2015;
y=[58710
72262
101803
105899
82319
76604
];
plot(x,y,'b-o');
fill([2010,2010,2011,2012,2013,2014,2015,2015],[0,58710,72262,101803,105899,82319,76604,0],[1 0.78 0.56])
title('P(t)/t Diagram');
xlabel('year');ylabel('units');
%% integral computation
for i=1:5
    k(i)=(y(i)-y(1+i))/(x(i)-x(1+i));
    b(i)=y(i)-k(i)*x(i);
end

S=0;
for i=1:5
    a=x(i);
    syms a
    S=S+int(k(i)*a+b(i),2009+i,2010+i)
end

% %check out
% for i=1:5
%     h(i)=(y(i)+y(i+1))/2
% end
% sum(h(1)+h(2)+h(3)+h(4)+h(5))