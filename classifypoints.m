function category = classifypoints(file,points)

load(file);

% Forward pass
a2 = activate(points,W2,b2);
a3 = activate(a2,W3,b3);
a4 = activate(a3,W4,b4);
% Categorizing output of point
category = a4(1,:) >= a4(2,:);

end