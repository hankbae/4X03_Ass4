clear all; close all;
%obtain data from training
[points,labels] = gettrainingdata;
%we try 3 learning rates
learning_rates = [1];
files = {'w1'};
niter = 1e6;
neurons = [7 50 2];
hold on
for i = 1:numel(files)
    netbp(points,labels,neurons,learning_rates(i),niter,files{i});
    i
end
hold off

visualize