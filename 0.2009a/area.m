%算各个问题的零件总面积。
%问题一零件总面积和板材总面积。
sum1=(350*300+350*200+500*240+500*210+500*350+300*250+250*200+500*400+500*200)*2
area1=(2350*900)
%问题二零件总面积和板材总面积。
sum2=((411*399)-(361*279)*0.5-(49*120)*0.5)*14+((400*350)-(150*150))*14
area2=(2380*1630)
%五边形“最小”面积和“聚合”面积
single_sum5=411*399*2
double_area5_a=((180523-180473)+(180884-180473))*((-342)-(-741))+((-342)-(-462))
double_area5_b=((-342)-(-741))*((181040-180473)+(180523-180473))
%六边形“最小”面积和“聚合”面积
single_sum6=400*350*2
double_area6=(400+250)*(350+50)
%问题三零件总面积和板材总面积。
sum3=(350*300*4+350*200*0+500*240*5+500*210*6+500*350*6+300*250*4+250*200*2+500*400*2+500*200*4)
area3=(4550*1630)

%利用率计算
%问题一
use_rate1=sum1/(area1-50*1350)*100
%问题二
use_rate2=sum2/(area2-650*380)*100
