% Temporary script to debug / verify algorithms

% Debug / verify the gradientDescentMF algorithm

% formula Y = 2 + 3X; theta0 = 1, theta1 = 1
% X = [1 5; 2 8; 3 11];

% TRFeatures = X(:, 1);
% Y = X(:, 2);
% thetas = [1, 1];
% alpha = 0.1;

% minThetas = gradientDescentMF(TRFeatures, Y, thetas, alpha);

% printf("Theta0 = %d, Theta1 = %d \n", minThetas(1), minThetas(2));

% printf('Next, use normal equation to validate answer. Press any key to continue ... \n');
% pause;
% minThetas = normalEquationMethod(TRFeatures, Y);
% printf("Theta0 = %d, Theta1 = %d \n", minThetas(1), minThetas(2));

% Debug normalizeXMinMax script

X = [1 3 9; 5 2 3; 7 8 3]
[colMin, colRange, XNorm] = normalizeXMinMax(X)

fprintf('Computed mins : \n');
fprintf(' %d \n', colMin);
fprintf('Computed ranges : \n');
fprintf(' %d \n', colRange);
XNorm

printf("Done ....\n");