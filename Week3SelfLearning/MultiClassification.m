%% Week 3 self learning - Multi-Classification
%  ------------
% 

clear ; close all; clc

%% Load Data
%  Note: each row is a tuple (x,y,c) where c represens the category. 
%  There are 3 categories such that Category 1 is appromately x = y+1,
%  Category 2 is appriimately x = y and Category 3 is appoximately x = y-1

data = csvread('MultiClassificationData.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% plot the data
fprintf(['Plotting data.\n']);

figure; hold on;

cat1 = find(y==1); cat2 = find(y == 2); cat3 = find(y == 3);

% Plot (x,y) for cat1 using + sign 
plot(X(cat1, 1), X(cat1, 2), 'k+', 'color', 'r', 'MarkerSize', 7);

% Plot (x,y) for cat2 using * sign in yellow.
plot(X(cat2, 1), X(cat2, 2), 'k*', 'color', 'g', 'MarkerSize', 7);

% Plot (x,y) for cat3 using o sign in yellow.
plot(X(cat3, 1), X(cat3, 2), 'ko', 'color', 'b', 'MarkerSize', 7);

hold off;
fprintf('\nProgram paused. Press any key to continue.\n');
pause;
close;

%% Part 2 - Train logistic regression classifiers for each categoy

m = size(X,1); % nuber or training examples
n = size(X,2); % number of features

categories = [1; 2; 3]; % these are the result categories from the sample data
numCategories = size(categories, 1); 
theThetas = zeros(numCategories, n+1);
PPX = [ones(size(X, 1), 1) X]; % add column of 1's. Gives us m * n+1

% we could use an optimized algorithm (e.g., fminunc) but I am using the basic 
% algorithm as a learning exprience. 

for i = 1:numCategories
  thetas = zeros(n+1, 1); % the +1 accounts for the bias unit
  yi = (y==i); % Y for the ith 
  
  alpha = 0.001; 
  loopCount = 0;
  currentCost = 500;
  prevCost = 0;
  
  do
    loopCount = loopCount+1;
    prevCost = currentCost;
    % calculate the sigmoid function
    xTheta = PPX * thetas;  % [M, 1] vector
    hx = 1 ./ (1 + exp(-xTheta)); % [M, 1] vector
  
    costX = hx - yi; % [M, 1] vector 
    thetas = thetas - (alpha/m * (PPX' * costX)); % [n+1,1] - ([n+1,m] * [m,1]) => [n+1,1]
  
    currentCost = sum(1/m * sum((-yi' * log(hx)) - ((1 - yi') * (log(1 - hx)))));
    
  until ( abs(prevCost-currentCost) < 0.000003  )
  
  % if we run only until difference is less than 0.001 the results are incorrect.
  % That's because the gradient has not converged on 0. But when we run until 
  % the difference is less than 0.000005, theThetas predict the correct result.
  
  theThetas(i, :) = thetas';
end


%% Part 3 - Test the trained classifiers

PPXTheta = PPX * theThetas';
phx = 1 ./ (1 + exp(-PPXTheta)); % The predicted hx for each set of theta. An [m, 3] matrix
PredictedY = zeros(m,1); 

% Pick the predicted category based on most confident prediced hx (i.e., phx)
for i = 1:m
  
  if ( phx(i,1) > phx(i,2) && phx(i,1) > phx(i,3) )
    PredictedY(i,1) = 1;
  elseif ( phx(i,2) > phx(i,1) && phx(i,2) > phx(i,3) )
    PredictedY(i,1) = 2;
  else
    PredictedY(i,1) = 3;
  endif   
  
end

%% plot the data
fprintf(['Plotting predicted results.\n']);

figure; hold on;

cat1 = find(PredictedY==1); cat2 = find(PredictedY == 2); cat3 = find(PredictedY == 3);

% Plot (x,y) for cat1 using + sign 
plot(X(cat1, 1), X(cat1, 2), 'k+', 'color', 'r', 'MarkerSize', 7);

% Plot (x,y) for cat2 using * sign in yellow.
plot(X(cat2, 1), X(cat2, 2), 'k*', 'color', 'g', 'MarkerSize', 7);

% Plot (x,y) for cat3 using o sign in yellow.
plot(X(cat3, 1), X(cat3, 2), 'ko', 'color', 'b', 'MarkerSize', 7);

hold off;
fprintf('\nProgram completed. Press any key to continue.\n');
pause;
close;

 