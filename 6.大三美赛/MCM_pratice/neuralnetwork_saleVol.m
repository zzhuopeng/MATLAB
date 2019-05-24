%"Neural network algorithm" to predict the next five years sales of Volkswagen
clc 
clear all;
close all;
SamNum=6; %The number of input samples is 6
TestSamNum=6; %The number of test samples is also 6
ForcastSamNum=5; %Forecast sample number is 5
HiddenUnitNum=8; %The number of hidden nodes in the middle layer is 8
InDim=4; %Network input dimension is 4
OutDim=1; %The network output dimension is 1
%data
%global profit(billion)
profit=[7.23	15.8	21.88	9.12	10.93	9.78];
%car production(units)
cp=[38231	40401	107232	132520	117628	109379];
%oil consumption(million ton)
oil_c=[850	894.72	963.08	983.94	836.1	1057.86];
%GDP(billion)
gdp=[149644	155179	161632	167681	174190	178700];
%Volkswagen sales volume of 2010 to 2015(ten thousand)
sale_vol=[58710	72262	101803	105899	82319	76604];
p=[profit;cp;oil_c;gdp]; %Input data matrix
t=sale_vol; %Target data matrix
[SamIn,minp,maxp,tn,mint,maxt]=premnmx(p,t); %Original sample pair (input and output) initialization
rand('state',sum(100*clock)) %According to the system clock to generate random numbers
NoiseVar=0.01; %Noise intensity is 0.01 (the purpose of adding noise is to prevent the network over fitting)
Noise=NoiseVar*randn(1,SamNum); %Generated noise
SamOut=tn + Noise; %Add noise to the output sample
TestSamIn=SamIn; %The input sample is the same as the test sample, because the sample size is small
TestSamOut=SamOut; %The output sample is the same as the test sample
MaxEpochs=50000; %The maximum number of training was 50000
lr=0.035; %The learning rate is 0.035
E0=0.65*10^(-4); %Target error is 0.65*10^ (-4)
W1=0.5*rand(HiddenUnitNum,InDim)-0.1; %Initialize the weights between the input layer and the hidden layer
B1=0.5*rand(HiddenUnitNum,1)-0.1; %The threshold between the input layer and the hidden layer is initialized
W2=0.5*rand(OutDim,HiddenUnitNum)-0.1; %Initialize the weights between the output layer and the hidden layer
B2=0.5*rand(OutDim,1)-0.1; %Threshold between the output layer and the hidden layer
ErrHistory=[]; %Pre occupied memory for intermediate variables
for i=1:MaxEpochs
    HiddenOut=logsig(W1*SamIn+repmat(B1,1,SamNum)); % Hidden layer network output
    NetworkOut=W2*HiddenOut+repmat(B2,1,SamNum); % Output layer network output
    Error=SamOut-NetworkOut; % The difference between the actual output and the network output
    SSE=sumsqr(Error) %Energy function (error sum of squares)
    ErrHistory=[ErrHistory SSE];
    if SSE<E0,break, end %To achieve the error requirement is to jump out of the learning cycle
    % The following six lines are the core of the BP network program
    % Weights (threshold) dynamically adjusted based on Negative energy function gradient descent principle
    Delta2=Error;
    Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);
    dW2=Delta2*HiddenOut';
    dB2=Delta2*ones(SamNum,1);
    dW1=Delta1*SamIn';
    dB1=Delta1*ones(SamNum,1);
    %The weights and thresholds between the output layer and the hidden layer are modified
    W2=W2+lr*dW2;
    B2=B2+lr*dB2;
    %The weights and thresholds of the input layer and the hidden layer are modified
    W1=W1+lr*dW1;
    B1=B1+lr*dB1;
end
HiddenOut=logsig(W1*SamIn+repmat(B1,1,TestSamNum)); % The hidden layer outputs the final result
NetworkOut=W2*HiddenOut+repmat(B2,1,TestSamNum); % The output layer outputs the final result
a=postmnmx(NetworkOut,mint,maxt); % Results of the output layer of the reduced network
x=2010:2015; % time
newh=a; 
% figure;
% plot(x,hzss,'r-*',x,newh,'b--o') 
% title('Neural Networks:prediction of sales volume');
% legend('The actual car sales','Forecast sales',2);
% xlabel('year');ylabel('units');

% Use the trained network to predict
% The data predicted by the two exponential smoothing method
pnew=[6.789184	7.3963392	6.2134944	5.0306496	3.8478048      %From 2016 to 2020 global profit
127626.9142	141297.1222	154967.3302	168637.5382	182307.7462     %From 2016 to 2020 car production
990.8007232	959.5200064	928.2392896	896.9585728	865.677856       %From 2016 to 2020 oil consumption
184551.5651	190262.1011	195972.6371	201683.1731	207393.7091];   %From 2016 to 2020 GDP

pnewn=tramnmx(pnew,minp,maxp); %The normalized parameters of the original input data are used to normalize the new data
HiddenOut=logsig(W1*pnewn+repmat(B1,1,ForcastSamNum)); % Hidden layer output prediction results
anewn=W2*HiddenOut+repmat(B2,1,ForcastSamNum); % Output prediction results
%Restore the data from the network to the original order of magnitude
anew=postmnmx(anewn,mint,maxt)

xn=[newh anew];
figure;
plot(x,sale_vol,'r-*',2010:2020,xn,'b--o')
title('Neural Networks:prediction of sales volume');
legend('The actual car sales','Forecast sales',2);
xlabel('year');ylabel('units');