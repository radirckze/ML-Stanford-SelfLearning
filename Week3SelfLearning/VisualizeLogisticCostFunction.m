% Test the cost function that is based on the sigmoid function 
% Essentially, test that the cost function produces a convex graph.

% Note: neither of these provides definitive proof. The basis for the second
%  approach is correct, but to visualize, need to be able to view results in 4D

printf('\nFirst, plot cost function using same thetas ...\n');
graph3Data = load('Graph3Data.txt');
X = graph3Data(:, 1:2); y = graph3Data(:, 3); 

%pre-process X, i.e., add a column of 1's
PPX = [ones(size(X, 1), 1) X]; % [m, n+1]

numRuns = 100;
m = length(y); % also  m = rows(X);
thetaX = linspace(-25, 25, numRuns);
JThetas = (1:length(thetaX));
for i = 1:numRuns
  thetas = [thetaX(i);thetaX(i);thetaX(i)];
  % xTheta = PPX * thetas;  % [M, 1] vector
  % hx = 1 ./ (1 + exp(-xTheta));
  % JThetas(i) = 1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx))));
  JThetas(i) = LogisticCostFunction(PPX, thetas, y);
end

plot(thetaX, JThetas);

printf('\nNext, graph the cost function using different thetas ...\n');
printf('Note: this really requires a 4D graph so using 20 3D slices instead ...\n');
pause;
clf;

theta0s = linspace(-25, 25, 20);
theta1s = linspace(-25, 25, 20);
theta2s = linspace(-25, 25, 20);

% initialize J_vals to a matrix of 0's
JThetas = zeros(length(theta0s), length(theta1s), length(theta2s));

% Fill out JThetas
for i = 1:length(theta0s)
    for j = 1:length(theta1s)
      for k = 1:length(theta2s)
	      thetas = [theta0s(i); theta1s(j); theta2s(k)];
	      JThetas(i,j, k) = LogisticCostFunction(PPX, thetas, y);
       end
    end
end


printf("Enter any key for next slice\n");
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 5));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 7));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 5));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 7));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 9));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 11));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 13));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 15));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 17));
hold off;
printf("Enter any key for next slice\n");
pause;
plot3(theta0s, theta1s, JThetas(:, :, 19));

printf("Done! Press any key to continue ...\n");
pause;
clf;

