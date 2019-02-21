% Get all the entries of a matrix such that the value in the last column
%  matches the 'selectedVal
% (i.e, a function to get the data matching the positive and negative cases)
function [SelectedX] = GetSelectedData(X, selectVal)
  
  numCols = columns(X);
  
  selectedIndexes = (X(:,numCols) == selectVal);
  SelectedX = X(selectedIndexes,:);
  
  % SelectedX = zeros(numrows, numCols-1);
  
end;