function [points, labels] = gettrainingdata
points(1,:) = [0.1, 0.3, 0.1, 0.6, 0.4, 0.6, 0.5, 0.9, 0.4, 0.7, 0.2, 0.5, 0.8, 0.1] ; 
points(2,:) = [0.1, 0.4, 0.5, 0.9, 0.2, 0.3, 0.6, 0.2, 0.4, 0.6, 0.3, 0.5, 0.4, 0.3] ; 
labels = [ones(1,6) zeros(1,6) 1 0; zeros(1,6) ones(1,6) 0 1];
end