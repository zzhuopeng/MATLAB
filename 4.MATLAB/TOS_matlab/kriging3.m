load data3;
Y=fix(Y);
theta = [10 10]; lob = [1e-1 1e-1]; upb = [1 1];
[dmodel, perf] =dacefit(S, Y, @regpoly0, @correxp, theta, lob, upb);
X = gridsamp([0 0;30000 20000], 100);
[YX MSE] = predictor(X, dmodel);
X1 = reshape(X(:,1),100,100); X2 = reshape(X(:,2),100,100);
YX = reshape(YX, size(X1));
figure(9), mesh(X1, X2, YX)
hold on,
plot3(S(:,1),S(:,2),Y,'.k', 'MarkerSize',10);
hold off;
%[emodel perf] = dacefit(S, Y, @regpoly0, @correxp, 2);
%figure(2), mesh(X1, X2, reshape(MSE, size(X1)) );