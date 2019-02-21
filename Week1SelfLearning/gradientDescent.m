function [theta0Min, theta1Min] = gradientDescent(x, y, theta0, theta1, alpha)

t0 = theta0;
t1 = theta1;
m = size(y,1);
hx = zeros(size(x));
squaredCE = 100; %picked a number I know is greater just to make things easier
loopcount = 0;

do
  loopcount = loopcount +1;
  prevCostError = squaredCE;
  
  hx = t0 + (x.*t1);
  
  t0 = t0 - alpha / m * (sum(hx.-y));
  t1 = t1 - alpha / m * (sum((hx.-y).*x));
  
  resultingY = calculateResultingY(t0, t1, x);
  squaredCE = squaredCostError(resultingY, y);
  
until (squaredCE >= prevCostError)

printf("gradinet descent loop data: ");
loopcount
t0
t1

theta0Min = t0;
theta1Min = t1;