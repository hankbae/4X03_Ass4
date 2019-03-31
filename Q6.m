clear all; close all;

init = [0,1];
options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
[x,fval,exitflag,output] = fsolve(@linsys,init,options);

function F = linsys(X)
    F(1) = exp(-X(1))+exp(-X(2))-1.0001;
    F(2) = 10^6*X(1)*X(2)-1;
end