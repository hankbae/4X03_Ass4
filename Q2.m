clear all ; close all ;
format long e
f  = @(x) x - exp(2-sqrt(x));

g  = @(x) x*sin(x^2)-1;
dg = @(x) sin(x^2)+2*x^2*cos(x^2);

h  = @(x) x^3-2*x-5;
dh = @(x) 3*x^2-2;

a = midpoint(f,1,3)
b = midpoint(g,0,4.5)

c = newton(h,dh,4.5)
d = newton(g,dg,4.5)

fzero(f,4.5)
fzero(g,4.5)
fzero(h,4.5)








