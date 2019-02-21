% Week 2 : multi feature linear regression.
printf('Week 2: multi-feature linear regression ... \n');

% Part 1: load the training example (and graph) ..................
printf('loading training dataset ... \n');
% load graph data
graph2Data = load('Graph2Data.txt');
% plot the data
printf('Plotting the training set \n');
X1 = graph2Data(:, 1); X2 = graph2Data(:, 2); Y = graph2Data(:, 3);
% plot3(X1,X2,Y, 'color', 'r'); % Plot the data
% xlabel('X1');
% ylabel('X2');
% zlabel('Y');
% title('Fn(Approx) Y = 1 + 0.2X1 + 0.4X2');


# Part 2: Guess thetas and plot against training set .................
printf('Guess thetas and plot hypothesis(blue) against training set(green)... \n');

theta0guess = 1;
theta1guess = 1;
theta2guess = 1;
TRFeatures = graph2Data(:, 1:2); %just the features of the training set

theta0 = theta0guess;
theta1 = theta1guess;
theta2 = theta2guess;

% Generate predicted Y using hypothesis and plot
hypothesisYs = calculateResultingY([theta0, theta1, theta2], TRFeatures);
plot3(X1,X2,Y, 'color', 'g'); hold on;
plot3(X1,X2,hypothesisYs, 'color', 'b'); % Plot the predictedY
xlabel('X1');
ylabel('X2');
zlabel('Y');

# Part 3: Apply multi-variable linear regression to the training set .........
printf('\nNext, performing linear regression. Press any key to continue ... \n');
pause;
close;

% first pick alpha 
alpha = 0.01;

% Confirm that the value will cause gradient descent to desend
% thetas = [theta0guess, theta1guess, theta2guess];
% resultingY = calculateResultingY(thetas, TRFeatures);
% sce1 = squaredCostError(resultingY, Y);
% thetas = [theta0guess-alpha, theta1guess-alpha, theta2guess-alpha];
% resultingY = calculateResultingY(thetas, TRFeatures);
% sce2 = squaredCostError(resultingY, Y);
% if (sce2 < sce1)
%   printf('The chose alpha is OK (descending) \n');
% else
%   printf('The chose alpha is problamatic (ascending) \n');
% endif

% perform gradientDescent
thetas = [theta0guess, theta1guess, theta2guess];
minThetas = gradientDescentMF(TRFeatures, Y, thetas, alpha);

% graph the result against the actual and the hypothesis. 
minYs = calculateResultingY(minThetas, TRFeatures);
plot3(X1,X2,Y, 'color', 'g'); hold on;
plot3(X1,X2,hypothesisYs, 'color', 'b'); % Plot the predictedY
plot3(X1,X2,minYs, 'color', 'r'); % Plot the minimized function
xlabel('X1');
ylabel('X2');
zlabel('Y');
printf("Theta0 = %d, Theta1 = %d, Theta2 = %d \n", minThetas(1), minThetas(2), minThetas(3));

predictedY = minThetas(1) + minThetas(2) * 4 + minThetas(3) * 2.5;
printf("The predicted value for x1=4, x2=2.5 is: %d (Expected 2.8) \n", predictedY);

# Part 4: Use normal equation to validate thetas.
printf('\nNext, use normal equation to validate answer. Press any key to continue ... \n');
pause;
minThetas = normalEquationMethod(TRFeatures, Y);
printf("Theta0 = %d, Theta1 = %d, Theta2 = %d \n", minThetas(1), minThetas(2), minThetas(3));

predictedY = minThetas(1) + minThetas(2) * 4 + minThetas(3) * 2.5;
printf("The predicted value for x1=4, x2=2.5 is: %d (Expected 2.8) \n", predictedY);

# Part 5: Normalize training set and apply gradient descent
printf("\nNext, normalize training set. Apply gradient descent to normalize data.\n");
printf("Press any key to continue  ... (this will take a few seconds)\n");
pause;
close;

%since the data is normalized, we can pick a larger alpha
alpha = 0.5; % even 1 works here, and runs faster, but does not work for the non-normalized X

[colMin, colRange, TRFeaturesNorm] = normalizeXMinMax(TRFeatures);
minThetas = gradientDescentMF(TRFeaturesNorm, Y, thetas, alpha);

printf("Theta0 = %d, Theta1 = %d, Theta2 = %d \n", minThetas(1), minThetas(2), minThetas(3));
predictedY = minThetas(1) + minThetas(2) * (4 - colMin(1)) / colRange(1) + minThetas(3) * (2.5 - colMin(2)) / colRange(2);
printf("The predicted value for x1=4, x2=2.5 is: %d (Expected 2.8) \n", predictedY);

