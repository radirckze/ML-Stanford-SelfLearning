% Apply logistic regression to Graph4Data 

printf('\nLogistic regression on Graph4Data ...\n');
graph4Data = load('Graph4Data.txt');
X = graph4Data(:, 1:2);

% expanding X by adding 2 column such that col3=sqr(col1) and col4=sqr(col2)
% In this case we expand X because we know the function is of the form X^2 + Y^2 = ...
% In a real world scenario we can keep adding squared and cubed values until you 
%   you are able to get a function that predicts the training set well.
XExp = zeros(rows(X), columns(X)+2);
for i = 1:rows(X)
  XExp(i,1) = X(i,1);
  XExp(i,2) = X(i,2);
  XExp(i,3) = X(i,1)^2;
  XExp(i,4) = X(i,2)^2;
end

%pre-process X, i.e., add a column of 1's
PPXExp = [ones(size(XExp, 1), 1) XExp]; % [m, n+1]

y = graph4Data(:, 3); % [m, 1]
thetas = [1; 1; 1; 1; 1]; % [n+1; 1]

m = length(y);
alpha = 0.01;
loopCount = 0;
currentCost = 500;
prevCost = 0;

do
  loopCount = loopCount+1;
  prevCost = currentCost;
  % calculate the sigmoid function
  xTheta = PPXExp * thetas;  % [M, 1] vector
  hx = 1 ./ (1 + exp(-xTheta)); % [M, 1] vector
  
  costX = hx - y; % [M, 1] vector 
  thetas = thetas - (alpha/m * (PPXExp' * costX)); % [n+1,1] - ([n+1,m] * [m,1]) => [n+1,1]
  
  currentCost = sum(1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx)))));
  
until ( abs(prevCost-currentCost) < 0.000001  )


PredictedResults = PredictedOutcome4TrainingSet(XExp, hx);

% results ...
loopCount
thetas
PredictedResults