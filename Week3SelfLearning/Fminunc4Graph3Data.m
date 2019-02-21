% Using Fminunc to solve the logistic regression problem for the Graph3Data

printf('Using Fminunc to solve the logistic regression problem for the Graph3Data  ...\n');
graph3Data = load('Graph3Data.txt');
X = graph3Data(:, 1:2);
%pre-process X, i.e., add a column of 1's
global PPX = [ones(size(X, 1), 1) X]; % [m, n+1]
global y = graph3Data(:, 3); % [m, 1]
initialThetas = [1; 1; 1]; % [n+1; 1]
global m = length(y);

% cost function for fminunc
function [J, gradient] = ComputeCost(thetas)
  global PPX y m;
  xTheta = PPX * thetas; 
  hx = 1 ./ (1 + exp(-xTheta)); 
  costX = hx - y; 
  
  gradient = PPX' * costX;
  % J = sum(1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx)))));
  % J = 1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx))));
  J = (-y' * log(hx)) - ((1 - y') * (log(1 - hx)));
  
end

% logistic regression using fminunc
options = optimset('GradObj', 'on', 'MaxIter', 1000);
[optThetas, funcionVal, exitFlag, output] = fminunc(@ComputeCost, initialThetas, options);

disp(sprintf("Exit flag: %d, Thetas: ", exitFlag));
optThetas
output.iterations

xTheta = PPX * optThetas; 
 hx = 1 ./ (1 + exp(-xTheta)); 
PredictedResults = PredictedOutcome4TrainingSet(X, hx);
PredictedResults

