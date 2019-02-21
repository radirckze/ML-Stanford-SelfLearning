% Apply logistic regression to Graph3Data 

printf('\nLogistic regression on Graph3Data ...\n');
graph3Data = load('Graph3Data.txt');
X = graph3Data(:, 1:2);
%pre-process X, i.e., add a column of 1's
PPX = [ones(size(X, 1), 1) X]; % [m, n+1]
y = graph3Data(:, 3); % [m, 1]
thetas = [1; 1; 1]; % [n+1; 1]

m = length(y);
alpha = 0.01;
loopCount = 0;
currentCost = 500;
prevCost = 0;

do
  loopCount = loopCount+1;
  prevCost = currentCost;
  % calculate the sigmoid function
  xTheta = PPX * thetas;  % [M, 1] vector
  hx = 1 ./ (1 + exp(-xTheta)); % [M, 1] vector
  
  costX = hx - y; % [M, 1] vector 
  thetas = thetas - (alpha/m * (PPX' * costX)); % [n+1,1] - ([n+1,m] * [m,1]) => [n+1,1]
  
  currentCost = sum(1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx)))));
    
until ( abs(prevCost-currentCost) < 0.00001  )


PredictedResults = PredictedOutcome4TrainingSet(X, hx);

% results ...
loopCount
thetas
PredictedResults

  
  
