%Sensitivity analysis of fourth questions
x=linspace(0,1);
Z1=1.2*x+1.4*0+3.3*0.0232+0.6*0.2074+1.0*0.5883;
Z2=1.2*0.0067+1.4*x+3.3*0.0232+0.6*0.2074+1.0*0.5883;
Z3=1.2*0.0067+1.4*0+3.3*x+0.6*0.2074+1.0*0.5883;
Z4=1.2*0.0067+1.4*0+3.3*0.0232+0.6*x+1.0*0.5883;
Z5=1.2*0.0067+1.4*0+3.3*0.0232+0.6*0.2074+1.0*x;
plot(x,Z1,'red*',x,Z2,'yellow*',x,Z3,'green*',x,Z4,'blue*',x,Z5,'black*');
title('sensitivity analysis of Z-scores');
legend('X1:Assets rate of working capital','X2:Asset retention ratio','X3:Return on assets','X4:Debt equity market rate','X5:Total asset turnover',5);
xlabel('Xn');ylabel('Z');