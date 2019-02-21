MatA = [1 2 3; 
        4 5 6; 
        7 8 9];
        
MatB = [.5 .5 .5; 1 1 1; 1.5 1.5 1.5];

MatC= [1 1 1; 2 2 2; 3 3 3];

vecA = [1 2 3];

ScaA = 1;
ScaB = 2;

MatA * MatB; 

MatA + MatC;

MatA * vecA';

% test element wise operations

MatA .* MatC; % X(1,1) * Y(1,1),  X(1,2) * Y(1,2), ...

MatA .* vecA'; % X(1,1)*Y(1,1), X(1,2)*Y(1,1) ...; X(2,1)*Y(2,1) ...

% Note, this only works element wise. 
MatA .* vecA; % X(1,1)*Y(1,1), X(1,2)*Y(1,2) ...; X(2,1)*Y(1,1) ...

MatA ./ MatC; % works as expected

MatA ./ vecA; % works as expected

MatA ./ vecA'; % works as expected

abs(MatA); % abs of each element

sum(MatA); % sum of each column. 

MatA ^2; %returns MatA * MatA

MatA .^2; %returns the square of each element


