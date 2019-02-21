% Absolute Cost Error i.e., sum(y1 - y2)

function [totalCost] = absoluteCostError(Y1, Y2)
  
  totalCost = sum((Y1.-Y2));

end;