f = @(x) x^5 - x^3 - 4*x;
df = @(x) 5*x^4 - 3*x^2 - 4;
a = newton(f,df,1);
fprintf('newton\t\tf(x) = %f \n', a);