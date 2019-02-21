%  cost function based on the sigmoid (logistic) function
function JTheta = LogisticCostFunction(PPX, theta, y)
  
  % PPX = pre-processed training set of [m,n+1] dimensions 
  % theta = vector of [n+1. 1] dimensions
  % y = results  of [m,1] dimensions 
  
  m = length(y); % also  m = rows(X);

  xTheta = PPX * theta;
  hx = 1 ./ (1 + exp(-xTheta));
  JTheta = 1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx))));
  
end