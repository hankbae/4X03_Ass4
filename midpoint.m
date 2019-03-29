function zero = midpoint(f,a,b)
syms x
A = a;
B = b;
out = 1;

while abs(out) >= 1e-10
    zero = (A+B)/2;
    out = eval(subs(f,x,zero));
    if xor(eval(subs(f,x,zero)) > 0 ,eval(subs(f,x,A)) > 0)
        B = zero;
    else
        A = zero;
    end
end
end