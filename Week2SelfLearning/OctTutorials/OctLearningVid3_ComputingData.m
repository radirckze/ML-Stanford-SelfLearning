printf('Part 3: Computing Data ...');

A = [1 2 3 4; 5 6 7 8; 9 10 11 12];

B = [1 2; 3 4; 5 6; 7 8];

A*B; % 3by4 * 4by2 = 3by2 matrix

C = [2 2 2 2; 2 2 2 2; 2 2 2 2];

A .*C; % element-wise multiplication

A .^2; % squareroot of each element

sqrt(A); % square root of each element. Note sqrt is an element operation ...

A + 1; 

A' ; % trasnspose of A

val = max(A); %maximum val (i.e., max row) of A

[val, ind] = max(A(3,:)); %max value of 3rd row of A

A < 3; % element wise comparison. Returns a boolean.

MagA = magic(3); %magic returns a matrix where rows, cols, diagnols all add up to ...

prod(A) % ???

floor(A);

RAND4 = rand(4,4); % random matrix

flip(eye(3)); % flip a matrix

flipud(eye(3)); % flip up-down

pinv(A); %sudo inverse of A


