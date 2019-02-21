function [minThetas] = normalEquationMethod(X, y)

% X = training set feature values in the from of [(x11,,,x1n); ... ; (xm1,,,xmn)]
% y = training set results in the form of [y1; ,,, ; ym]

% We can use the normal equation method to validat our answer

ExpX = [ones(size(X, 1), 1) X]; % a column of 1s (the x value corresponding to theta0)
minThetas = length(y);

% minThetas = (ExpX-trans * ExpX)-inv * ExpX-trans * y
minThetas = inv(ExpX' * ExpX) * ExpX' * y;

