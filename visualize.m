close all ; clear all ;
[trainpoints ,labels] = gettrainingdata;
%create points to classify
h = 0.01;
[x, y] = meshgrid(0:h:1,0:h:1);
points = [x(:), y(:)]';
files = { 'w1.mat'};
for i = 1:numel(files)
    figure (i)
    categories = classifypoints(files{i},points);
    plotpoints(trainpoints ,labels ,points ,categories);
    load(files{i});
    title ( sprintf ('learning rate %g', learning_rate));
    set (gca , 'FontSize', 18);
    print ('-depsc2', sprintf ('w%d.eps', i));
end
figure (6)
%plot cost
for i = 1:numel(files)
    load(files{i});
    n = 1:1000:numel(savecost);
    h(i) = semilogy(n, savecost(n));
    hold on;
    s{i} = sprintf ('learning rate %g\n', learning_rate);
end
legend(h, s);
xlabel ('iteration')
ylabel ('cost')
set (gca ,'FontSize', 18);
print ('-depsc2', 'cost.eps');