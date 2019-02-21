% Squared Cost Error i.e., 1/2m * squared(sum(y1 - y2))

function [totalCost] = squaredCostError(y1, y2)
  
  m = length(y1);
  totalCost = 1/(2*m) * sum((y1 - y2).^2);

end;