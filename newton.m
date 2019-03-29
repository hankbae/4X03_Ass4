function zero = newton(f,df,a)
zero = a;
while abs(f(zero)) >= 1e-10
    zero = zero-f(zero)/df(zero);
end
end