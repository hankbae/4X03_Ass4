function plotpoints(trainpoints , labels , points , categories)
A = find (categories == 1);
B = find (categories == 0);
h1 = plot (points(1,A), points(2,A), 'y.');
hold on
h2 = plot ( points(1,B), points(2,B), 'm.');
%plot the training points
category = labels (1,:) >= labels (2,:);
A = find (category == 1);
B = find (category == 0);
h3 = plot (trainpoints(1,A), trainpoints(2,A), 'bo','LineWidth', 2);
h4 = plot (trainpoints(1,B), trainpoints(2,B), 'bx','LineWidth', 2);
legend([h1 ,h2 ,h3 ,h4],'A yellow ','B magenta ','train A','train B','Location', 'NorthWest')
end