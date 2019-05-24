clear;clc;
f='x^2';
syms x g;
g=x^2;
h=inline('x^2','x');
result=h(2)