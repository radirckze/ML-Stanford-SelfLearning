% calculate resulting y's such that y = theta) + theta1*x
function [Y] = calculateResultingY(thetas, X)
  
  % X = training set feature values in the from of [(x11,,,x1n); ... ; (xm1,,,xmn)]
  % hThetas = hypothesis thetas in the form of [t0, ,,, , tn]
  % Y = [m,1] where m is the # of rows in X
  
  % Vectorized implementation of
  % Y = theta0 + theta1*X11 + ... + thetan*X1n (for all rows in X)

  Y = zeros(size(thetas));
  ExpX = [ones(size(X, 1), 1) X]; % a column of 1s (the x value corresponding to theta0)
  
  Y = ExpX * thetas';
  
end;