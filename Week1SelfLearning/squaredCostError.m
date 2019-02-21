% Absolute Cost Error i.e., sum(y1 - y2)

function [totalCost] = squaredCostError(Y1, Y2)
  
  m = length(Y2);
  totalCost = 1/(2*m) * sum((Y1.-Y2).^2);

end;