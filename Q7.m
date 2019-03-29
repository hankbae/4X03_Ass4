close all; clear all;
mu = 0.012277471;
mu_h = 1-mu;
steps = [100, 1000, 10000, 20000];
h = 17.1./(steps-1); % step size
%% functions
du1 = @(u1,u2,v1,v2) v1;
dv1 = @(u1,u2,v1,v2) u1 + 2*v2 - mu_h*(u1 + mu)/((u1 + mu)^2 + u2^2)^(3/2) - mu*(u1 - mu_h)/((u1 - mu_h)^2 + u2^2)^(3/2);
du2 = @(u1,u2,v1,v2) v2;
dv2 = @(u1,u2,v1,v2) u2 - 2*v1 - mu_h*u2/((u1 + mu)^2 + u2^2)^(3/2) - mu*u2/((u1 - mu_h)^2 + u2^2)^(3/2);

for j = 1:length(steps)
    %% initial values
    u1 = zeros(steps(j),1);
    u2 = zeros(steps(j),1);
    v1 = zeros(steps(j),1);
    v2 = zeros(steps(j),1);
    u1(1) = 0.994;
    u2(1) = 0;
    v1(1) = 0;
    v2(1) = -2.001585106379082522420537862224;


    %% for loop

    for i = 1:steps(j)-1
        K1_u1 = du1(u1(i) , u2(i) , v1(i) , v2(i));
        K1_v1 = dv1(u1(i) , u2(i) , v1(i) , v2(i));
        K1_u2 = du2(u1(i) , u2(i) , v1(i) , v2(i));
        K1_v2 = dv2(u1(i) , u2(i) , v1(i) , v2(i));

        K2_u1 = du1(u1(i) + h(j)*K1_u1/2 , u2(i) + h(j)*K1_u2/2 , v1(i) + h(j)*K1_v1/2 , v2(i) + h(j)*K1_v2/2);
        K2_v1 = dv1(u1(i) + h(j)*K1_u1/2 , u2(i) + h(j)*K1_u2/2 , v1(i) + h(j)*K1_v1/2 , v2(i) + h(j)*K1_v2/2);
        K2_u2 = du2(u1(i) + h(j)*K1_u1/2 , u2(i) + h(j)*K1_u2/2 , v1(i) + h(j)*K1_v1/2 , v2(i) + h(j)*K1_v2/2);
        K2_v2 = dv2(u1(i) + h(j)*K1_u1/2 , u2(i) + h(j)*K1_u2/2 , v1(i) + h(j)*K1_v1/2 , v2(i) + h(j)*K1_v2/2);

        K3_u1 = du1(u1(i) + h(j)*K2_u1/2 , u2(i) + h(j)*K2_u2/2 , v1(i) + h(j)*K2_v1/2 , v2(i) + h(j)*K2_v2/2);
        K3_v1 = dv1(u1(i) + h(j)*K2_u1/2 , u2(i) + h(j)*K2_u2/2 , v1(i) + h(j)*K2_v1/2 , v2(i) + h(j)*K2_v2/2);
        K3_u2 = du2(u1(i) + h(j)*K2_u1/2 , u2(i) + h(j)*K2_u2/2 , v1(i) + h(j)*K2_v1/2 , v2(i) + h(j)*K2_v2/2);
        K3_v2 = dv2(u1(i) + h(j)*K2_u1/2 , u2(i) + h(j)*K2_u2/2 , v1(i) + h(j)*K2_v1/2 , v2(i) + h(j)*K2_v2/2);

        K4_u1 = du1(u1(i) + h(j)*K3_u1 , u2(i) + h(j)*K3_u2 , v1(i) + h(j)*K3_v1 , v2(i) + h(j)*K3_v2);
        K4_v1 = dv1(u1(i) + h(j)*K3_u1 , u2(i) + h(j)*K3_u2 , v1(i) + h(j)*K3_v1 , v2(i) + h(j)*K3_v2);
        K4_u2 = du2(u1(i) + h(j)*K3_u1 , u2(i) + h(j)*K3_u2 , v1(i) + h(j)*K3_v1 , v2(i) + h(j)*K3_v2);
        K4_v2 = dv2(u1(i) + h(j)*K3_u1 , u2(i) + h(j)*K3_u2 , v1(i) + h(j)*K3_v1 , v2(i) + h(j)*K3_v2);

        u1(i+1) = u1(i) + h(j)*(K1_u1 + 2*K2_u1 + 2*K3_u1 + K4_u1)/6;
        v1(i+1) = v1(i) + h(j)*(K1_v1 + 2*K2_v1 + 2*K3_v1 + K4_v1)/6;
        u2(i+1) = u2(i) + h(j)*(K1_u2 + 2*K2_u2 + 2*K3_u2 + K4_u2)/6;
        v2(i+1) = v2(i) + h(j)*(K1_v2 + 2*K2_v2 + 2*K3_v2 + K4_v2)/6;
    end
    figure(j);
    plot(u1,u2);
    %title(sprintf('step size: %d', steps));
end

    