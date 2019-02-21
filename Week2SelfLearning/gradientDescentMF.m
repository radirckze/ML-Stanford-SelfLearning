function [minThatas] = gradientDescentMF(X, y, hThetas, alpha)

% X = training set feature values matrix of m*n dimensions where m = # training
% examples and n = # of features
% y = training set results vector with m*1 dimensions
% hThetas = hypothesis thetas vector with 1*n+1 dimensions
%
% This is a vectorized implementation of multi-variable gradient descent
% The non-vectorization algorithm is:
% repeat until convergence
%    step 0: theta0 := theta0 - alpha * 1/m  (sum((h-theta(x-supi) - y-sup1) * x-0supi) for all i)
%             ...                       ...                          ...
%    step n: thetan := thetan - alpha * 1/m  (sum((h-theta(x-supi) - y-sup1) * x-nsup1) for all i)
% end-loop
%
% Note: supi = superscript i, and sbbi = subscript i
% 
% We can vectorize steps 0 throgh n as follows:
%
% thetas = thetas - ((alpha / m) * (((ExpX * thetas') - y)' * ExpX));
%


thetas = hThetas;
ExpX = [ones(size(X, 1), 1) X]; % a column of 1s (the x value corresponding to theta0)
numThetas = length(hThetas);
m = length(y); % number of training examples
hx = zeros(m, 1);
squaredCE = Inf; %picked a number I know is greater just to make things easier
loopcount = 0;

do
  loopcount = loopcount +1;
  prevCostError = squaredCE;
  
  % stepvise calculation for visualization 
  % hTheta = (ExpX * thetas'); % result: (m*n+1) * (n+1*1) => m*1 matrix  
  % val2 = ((ExpX * thetas') - y); % result:((m*1) - (m*1) => m*1 matrix 
  % val3 = ((ExpX * thetas') -y)' * ExpX; % result: (1*m) * (m*n+1) => 1*n+1 vector
  % val4 =  (alpha / m) * (((ExpX * thetas') -y)' * ExpX); % result: (1*1) * (1*n+1) => 1*n+1 vector
   
  thetas = thetas - ((alpha / m) * (((ExpX * thetas') - y)' * ExpX)); 
  % thetas: (1*n+1) - (1*n+1) => (1*n+1) -- the updated thetas 
   
  resultingY = calculateResultingY(thetas, X);
  squaredCE = squaredCostError(resultingY, y);
  
until ((squaredCE > prevCostError) || (prevCostError - squaredCE ) < 0.000000000001) 
% 0.000000000001 works but need ot determine how to choose this value 


printf("gradinet descent loop data: ");
loopcount

minThatas = thetas;