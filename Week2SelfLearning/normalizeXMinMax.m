%Normalize a feature matrix (i.e., X) using the min/max method.
function [colMin, colRange, XNorm] = normalizeXMinMax(X)
  
  % We can use different normalization schemes. See
  % https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/normalize-data
  
  % X = m*n training set where m is the # of examples and n is # of features
  % rowMin is a 1 by n vector of the mins for each column
  % rowRange is a 1 by n vector of the range (max-min) for each column.
  % XNorm is the m*n matrix of normalized values of X
  
  numCols = columns(X);
  colMin = zeros(1, numCols);
  colRange = zeros(1, numCols);
  XNorm = zeros(size(X));
  
  for i=1 : numCols
    minVal = min(X(:,i));
    maxVal = max(X(:,i));
    range = maxVal - minVal;
    colMin(i) = minVal;
    colRange(i) = range;
    XNorm(:,i) = (X(:,i) .- minVal) ./range;
  endfor
  
end;