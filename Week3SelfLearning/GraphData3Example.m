% This learning example uses Grap3Data.

% Boundary for Graph3Data is y = 0.5 + 0.5x => 0.5 + 0.5x -y = 0

% Part 1: load / graph the data
printf('Visualize Graph3Data (y = 0.5 + 0.5x ) \n');

% load graph data
graph3Data = csvread('Graph3Data.txt');
% graph3Data = load('Graph3Data.txt');
% plot the data
% X = graph3Data(:, 1); Y = graph3Data(:, 2); 
XPos = GetSelectedData(graph3Data, 1);
XNeg = GetSelectedData(graph3Data, 0);
plot(XPos(:,1), XPos(:,2), 'linestyle', 'none', 'marker', '*', 'color', 'r'); % Plot the data
hold on;
plot(XNeg(:,1), XNeg(:,2), 'linestyle', 'none', 'marker', 'o', 'color', 'b'); % Plot the data
xlabel('X');
ylabel('Y');
title('Boundary: y = 0.5 + 0.5x');

# Part 2 : Perform logistic regression on data
printf('\nNext perform logistic regression on data. Press any key to continue ..');
pause;

X = graph3Data(:, 1:2);
%pre-process X, i.e., add a column of 1's
global PPX = [ones(size(X, 1), 1) X]; % [m, n+1]
global y = graph3Data(:, 3); % [m, 1]
initialThetas = [1; 1; 1]; % [n+1; 1]
thetas = initialThetas;

global m = length(y);
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

% process results 
PredictedResults = PredictedOutcome4TrainingSet(X, hx); % Process training set using results.

% results ...
printf('\nNumber of loops run:');
loopCount
printf('\nCalculated thetas (expected 0.5, 0.5, -1 or any multiple that is approximately equal)\n');
thetas
% PredictedResults % - uncomment to view predicted results 

# Part 3 : Graph the boundary against training set
printf('\nNext, graph the boundary against training set. Press any key to continue ...\n');
pause;

XPred = [0 ((thetas(1) + thetas(2)*0) / -thetas(3)); 12 ((thetas(1) + thetas(2)*12)/-thetas(3))];
plot(XPos(:,1), XPos(:,2), 'linestyle', 'none', 'marker', '*', 'color', 'r'); % Plot the data
hold on;
plot(XNeg(:,1), XNeg(:,2), 'linestyle', 'none', 'marker', 'o', 'color', 'b'); % Plot the data
hold on;
plot(XPred(:,1), XPred(:,2), 'color', 'g'); % Plot the data
xlabel('X');
ylabel('Y');
title('Boundary: y = 0.5 + 0.5x');

# Part 4 : Perform logistic regression using fminunc
printf('\nNext, Perform logistic regression using fminunc. Press any key to continue ...\n');
pause;

% cost function for fminunc
function [J, gradient] = ComputeCost(thetas)
  global PPX y m;
  xTheta = PPX * thetas; 
  hx = 1 ./ (1 + exp(-xTheta)); 
  costX = hx - y; 
  
  gradient = 1/m * (PPX' * costX);
  J = 1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx))));
  
end

options = optimset('GradObj', 'on', 'MaxIter', 1000);
[optThetas, funcionVal, exitFlag, output] = fminunc(@ComputeCost, initialThetas, options);

% disp(sprintf("Exit flag: %d, Thetas: ", exitFlag));
exitFlag
output.iterations
printf('\nCalculated thetas (expected 0.5, 0.5, -1 or any multiple that is approximately equal)\n');
optThetas

xTheta = PPX * optThetas; 
hx = 1 ./ (1 + exp(-xTheta)); 
PredictedResults = PredictedOutcome4TrainingSet(X, hx);
% PredictedResults% PredictedResults % - uncomment to view predicted results 

# Part 5 : Graph the boundary (fminunc) against training set
printf('\nNext, graph the boundary (fminunc) against training set. Press any key to continue ...\n');
pause;

XPred = [0 ((optThetas(1) + optThetas(2)*0) / -optThetas(3)); 12 ((optThetas(1) + optThetas(2)*12)/-optThetas(3))];
plot(XPos(:,1), XPos(:,2), 'linestyle', 'none', 'marker', '*', 'color', 'r'); % Plot the data
hold on;
plot(XNeg(:,1), XNeg(:,2), 'linestyle', 'none', 'marker', 'o', 'color', 'b'); % Plot the data
hold on;
plot(XPred(:,1), XPred(:,2), 'color', 'g'); % Plot the data
xlabel('X');
ylabel('Y');
title('Boundary: y = 0.5 + 0.5x');

printf('\nDone! Press any key to exit.\n');