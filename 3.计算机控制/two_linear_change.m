%计算函数g = z^3 + k*z^2 + (3*k*z)/2 - k - 1的双线性变换。(z = (w+1)/(w-1), 其中k为未知数)。
syms k z w
g = z^3 + k*z^2 + (3*k*z)/2 - k - 1; %目标函数
g1=simplify(subs(g,z,(s+1)/(s-1)))     %结果