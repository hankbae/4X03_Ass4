clear all;
f = @(x) exp(-(x.^2))-cos(x)-1;
df = @(x) sin(x)-2.*x.*exp(-x.^2);
a = newton(f,df,0);
fprintf('f(x)\tx=0 : %f \n', a);
b = newton(f,df,1);
fprintf('f(x)\tx=1 : %f \n', b);

fprintf('f(x) fsolve\tx=1 : %f \n', fsolve(f,1));

plot(-10:0.1:10,f(-10:0.1:10));