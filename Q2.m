clear all ; close all ;
format long e
f  = @(x) x - exp(2-sqrt(x));

g  = @(x) x*sin(x^2)-1;
dg = @(x) sin(x^2)+2*x^2*cos(x^2);

h  = @(x) x^3-2*x-5;
dh = @(x) 3*x^2-2;


a = midpoint(f,1,3);
fprintf('midpoint\tf(x) = %f \n', a);
b = midpoint(g,0,4.5);
fprintf('midpoint\tg(x) = %f \n', b);



c = newton(h,dh,4.5);
fprintf('newton\t\th(x) = %f \n', c);
d = newton(g,dg,4.5);
fprintf('newton\t\tg(x) = %f \n', d);


fprintf('fzero\t\tf(x) = %f \n', fzero(f,4.5));

fprintf('fzero\t\tg(x) = %f \n', fzero(g,4.5));

fprintf('fzero\t\th(x) = %f \n', fzero(h,4.5));







