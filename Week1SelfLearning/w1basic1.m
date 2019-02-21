% Week 1 : Learning linear regression basics.
printf('Learning linear regression basics ... \n');

% Part 1 graph the training example
printf('Graph training dataset ... \n');
% load graph data
graph1Data = load('Graph1Data.txt');
% plot the data
printf('Plotting the training set \n');
X = graph1Data(:, 1); Y = graph1Data(:, 2);
plot(X,Y, 'color', 'r'); % Plot the data
# ylabel('Y');
# xlabel('X');

# Part 2:  guess at constants for linear equation and plot guess (i.e., hypothesis)
# agains the training set
printf('Next, plot hypothesis agains training set. Press any key to continue: \n');
pause;

theta0guess = 1;
theta1guess = 1;

theta0 = theta0guess;
theta1 = theta1guess;

% Generate predicted Y using hypothesis and plot
hypothesisYs = calculateResultingY(theta0, theta1, X);
plot(X,Y, 'color', 'r'); hold on;
plot(X,hypothesisYs, 'color', 'b'); % Plot the predictedY

# Part 3: Plot the squared cost function
fprintf('Next, plot squared cost error function. Press any key to continue:\n');
pause;

clf;
% first lets verify that we are descending
squaredCE = squaredCostError(hypothesisYs, Y)
alpha = 0.05;
theta0 = theta0guess-alpha;
theta1 = theta1guess-alpha;
resultingYs = calculateResultingY(theta0, theta1, X);
updatedSquaredCE = squaredCostError(resultingYs, Y)
printf('Note: If updatedSquaredCE < squaredCE the loop is heading in the right direction \n');


% calculate squared cost error for diminishing theta0 and theta1.
numruns = 30;
results = zeros(1, numruns);
theta0s = zeros(1, numruns);
theta1s = zeros(1, numruns);
results(1) = updatedSquaredCE;
theta0s(1) = theta0;
theta1s(1) = theta1;

for i=2:numruns;
  theta0 = theta0-alpha;
  theta1 = theta1-alpha;
  resultingY = calculateResultingY(theta0, theta1, X);
  results(i) = squaredCostError(resultingY, Y);
  theta0s(i) = theta0;
  theta1s(i) = theta1;
end;

%plot(theta0s,results, 'color', 'r');
% plot(theta1s,results, 'color', 'b');
clf;
plot3(theta0s, theta1s, results);
printf('If squared cost error function is a bell shape all is good \n\n');

# Part 3B (Optional): Graph the Absolute Cost Error
userRes = input('Next, if you wish to see the graph for the absolute cost function enter 1:');

if (userRes == 1) 
  clf;
  % lets check what the graph looks like for the simple cost error
  absoluteCE = absoluteCostError(hypothesisYs, Y);
  theta0 = theta0guess;
  theta1 = theta1guess;
  sResults = zeros(1, numruns);
  sTheta0s = zeros(1, numruns);
  sTheta1s = zeros(1, numruns);
  sResults(1) = absoluteCE;
  sTheta0s(1) = theta0;
  sTheta1s(1) = theta1;


  for i=2:numruns;
    theta0 = theta0-alpha;
    theta1 = theta1-alpha;
    resultingY = calculateResultingY(theta0, theta1, X);
    sResults(i) = absoluteCostError(resultingY, Y);
    sTheta0s(i) = theta0;
    sTheta1s(i) = theta1;
  end;
  
  plot3(theta0s, theta1s, results);

endif;


# Part 4: Plot hypothesis for the theta0 an theta1 at the bottom of the bell curve
# (i.e, the best fitting hypothesis for the graphed (theta0, theta1) pairs.
printf('\nPlot hypothesis (line) for the (theta0, theta1) that provided the least difference.\n');
printf('Note that this is not the optimal hypothesis.\n');
printf('Press any key to continue:\n');
pause;

% loop until the squared cost error starts to increase. Then take the average
% this is not the absolute minimum, but a close approximation. 

theta0 = theta0guess;
theta1 = theta1guess;
alpha = 0.0001;
squaredCE = 100; %picked a number I know is greater just to make things easier
loopcount = 0;

do
  loopcount = loopcount +1;
  prevTheta0 = theta0;
  prevTheta1 = theta1;
  prevCostError = squaredCE;
  theta0 = theta0-alpha;
  theta1 = theta1-alpha;
  resultingY = calculateResultingY(theta0, theta1, X);
  squaredCE = squaredCostError(resultingY, Y);
until (squaredCE >= prevCostError)

% this needs to account for sigh switch, etc.
printf("Linear regression loop ran %d times\n", loopcount);
minTheta0 = (prevTheta0 + theta0)/2;
minTheta1 = (prevTheta1 + theta1)/2;

%Plot the actual values, the hypothesis and the minimized function

printf('Plotting the actual (red), initial hypothesis (blue) and the min (green) \n\n');
minimizedYs = calculateResultingY(minTheta0, minTheta1, X);
plot(X,Y, 'color', 'r'); hold on;
plot(X,hypothesisYs, 'color', 'b'); hold on % Plot the predictedY
plot(X,minimizedYs, 'color', 'g');

# Part 5: Use Gradient Descent to find best fit. Find the (theta0, theta1) pair 
# that results in the least squared cost error. 
printf('Use Gradient Descent to find best fit. ... Press any key to continue:\n');
pause;
clf;
[minTheta0, minTheta1] = gradientDescent(X, Y, theta0guess, theta1guess, 0.005);
minimizedYs = calculateResultingY(minTheta0, minTheta1, X);
plot(X,Y, 'color', 'r'); hold on;
plot(X,hypothesisYs, 'color', 'b'); hold on % Plot the predictedY
plot(X,minimizedYs, 'color', 'g');

fprintf('Program paused. Press enter to terminate.\n');
pause;
clf;
 



