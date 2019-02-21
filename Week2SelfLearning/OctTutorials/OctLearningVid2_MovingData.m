printf('Part 2: Moving data around ...');

A = [1 2 3 4; 5 6 7 8; 9 10 11 12];

size(A);
A(:,2); % print second column
A(2,:); % pring second row
A([1,3], :); % print row 1 and 3
A = [A, [10; 22; 34]]; % append column to end
% Q? How do you append row?
unrolledA = A(:); % unroll A into a single column vector

a = [ 1 2 3 4 5];
length(a);

load('Graph1Data.txt');
who;
% save Graph1Data.backup Graph1Data; % save Graph1Data to file Graph1Data.backup