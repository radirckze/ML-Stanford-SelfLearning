% A neural network that determines if a 7 binary digit vector is a palindrome

% Sample input matrix. Note, each column represents a test case. Odd numbered
%  columns are palindromes
inputMatrix = [
1 0 0 0 0 1 1 1 0 0 0 0;
1 1 1 1 1 0 0 1 0 0 0 1;
1 1 1 0 1 0 1 1 1 0 0 0;
0 1 0 1 0 1 0 1 0 1 0 1;
1 0 1 1 1 0 1 0 1 0 0 0;
1 1 1 1 1 1 0 0 0 1 0 1;
1 0 0 1 0 0 1 1 0 0 0 1
];


% Solution:  XNOR each corresponding pair (e.g., [1,7], [2,6]) and check if all 
%  pairs are 1's. Note middle row is ignored for odd number lenghth strings.
% XNOR implemented using OR and NAND gates (https://en.wikipedia.org/wiki/XNOR_gate)
% Solution has 2 hidden layers, H1 and H2, to implement the XNOR
% Input to H1: OR and NAND each pair
% H1 to H2: NAND the OR and NAND results for each pair giving XNOR. 
% H2 to h(x): Check if XNOR for each pair is 1 (i.e., a match)

% Theta1: input to H1. (OR and AND for each pair. Ignore middle row.
% Note [-10 20 20] is OR. [20 -15 -15] is NAND
Theta1 = [
-10 20 0 0 0 0 0 20;
20 -15 0 0 0 0 0 -15;
-10 0 20 0 0 0 20 0;
20 0 -15 0 0 0 -15 0;
-10 0 0 20 0 20 0 0;
20 0 0 -15 0 -15 0 0;
];


% Theta2:  H1 to H2. (NAND OR and NAND results). Produces 3 results.
Theta2 = [
20 -15 -15 0 0 0 0;
20 0 0 -15 -15 0 0;
20 0 0 0 0 -15 -15
];



% Theta3: H2 to output layer (i.e., h(x))
% Using summation and total to check. Not really precise approach but works
% if results from previous layer are closer to 0 when false and 1 when true.
Theta3 = [
-23 10 10 10;
];

% Check each test case and store result.
numTestCases = size(inputMatrix, 2);
resultMatrix = [1, numTestCases];
% add bias node to each input.
inputMatrix = [ones(1, size(inputMatrix, 2)); inputMatrix];

for i = 1:numTestCases
  testCase = inputMatrix(:, i);
  
  % input to H1
  h1Vector = 1 ./ (1 + exp(- (Theta1 * testCase))); 
  
  % H1 to H2
  h1Vector = [1; h1Vector];
  h2Vector =  1 ./ (1 + exp(- (Theta2 * h1Vector)));
  
  % H2 to output
  h2Vector = [1; h2Vector];
  hx = 1 ./ (1 + exp(- (Theta3 * h2Vector)));
  
  % copy result
  if (hx >= 0.5) 
    resultMatrix(i) = 1;
  else
   resultMatrix(i) = 0;
  endif
  
endfor;

% print the results
resultMatrix

