% calculate resulting y's such that y = theta) + theta1*x

function [Y] = calculateResultingY(theta0, theta1, X)
  Y = zeros(size(X));
  Y = theta0 + (X.*theta1);
end;