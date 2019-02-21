printf('Part 6: Vectorization ...\n');

%let
theta = [1; 0.5; .25; .125]; 
x = [1; 2; 4; 8];
% h-subtheta(x) = sum(j=0 ...n) Theta-subtheta * x-subtheta (i.e., h-subtheta(x) = )

%vectoirized implementation of a sum over for-loop
res = theta' * x; 
