clear all;
format long e
f = @(x) exp(-(x.^2))-cos(x)-1;
df = @(x) sin(x)-2.*x.*exp(-x.^2);
a = newton(f,df,0)
b = newton(f,df,1)
fsolve(f,1)

plot(-10:0.1:10,f(-10:0.1:10));