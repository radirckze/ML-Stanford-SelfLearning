% The training set X with the predicted outcome based on logistic regression 
% results hx 
function PrecitedResults = PredictedOutcome4TrainingSet(X, hx)
  
  % X = an m*n matrix representing the training set witout the result
  % hx = an m*1 vector representing the results of a zigmod based hypothesis
  %   fuction, that is, 0 <= hx(...) <= 1
  % PredictedTR = the training set with the predicted outcome, (i.e. column n+1
  % containing a 1 or a 0 based on the values in hx)
  
  numRows = rows(hx);
  numCols = columns(hx);
  resultingHx = zeros(numRows,1);
  
  for i=1:numRows
    resultingHx(i) = round(hx(i));
  end
  
  PrecitedResults = [X, [resultingHx]]; 
  
end
   
   
  