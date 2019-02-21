% Vector: A matrix with only one column. Also know as an n-dimensional vector.

%[Note] Convention is to use upper case for matrices and lower case for vectors

A = [1, 2, 3; 4, 5, 6; 7, 8, 9];

a = [1; 2; 3];

[m,n] = size(A); % [3,3]
dim_A = size(A);

A_23 = A(2,3);

%  Addition and scalar multiplication ...

B = [1, 1, 1; 1, 1, 1; 1, 1, 1];

AplusB = A + B;

ThreeTimesA = 3 * A;

Atimes3 = A * 3;


% Matrix vector multiplication ...

A = [1, 2; 3 4; 5, 6]

b = [1; 2];

Atimesb = A * b;

% ***Applying matrix vector multiplication to datasets and hyprothesis

% Example: HouseSizes = [2000; 1330; 1800; 2400]. Hypothesis y = 10 + 1.5x

DataMatrix = [1, 2000; 1, 1330; 1, 1800; 1, 2400];
parameters = [10; 1.5];
Prediction = DataMatrix * parameters;

% Matrix matrix multiplication ...

A = [1, 2; 3, 4; 5, 6]; % 3x2 matrix
B = [1, 1, 1; 2, 2, 2]; % 2x3 matrix
AtimesB = A * B;        % 3x3 matrix

% ***Note similar to matrix-vector multiplication we can apply *multiple* hypothesis
% - to a test dataset. Left as an exercise. (hint: each row represents one htpothesis).

% Matrix multiplication properties ...

% Matrix multiplication is *not* commutative. So  A * B is n!= B * A.

% Matrix multiplication *is* associative. So (A * B) * C = A * (B * C)

Identity3x3 = [1, 0, 0; 0, 1, 0; 0, 0 1];

% For any A = 3x3 matrix,  A * Identity3x3 = A

% Matrix inverse and transpose operations ...

% Inverse of 3 is 1/3 as 3*1/3 = 1 (Identity)
% Similarly for nxn matrices A, A * Asuperscript-1 = Asuperscript-1 * A = IdentityNxN.

% Only square matrices (NxN) have an invese. Not all square matrices have an inverse!

A = [3, 4; 2, 16];
InvOfA = pinv(A);

A = [1, 2, 3; 4, 5, 6];
transposeOfA = transpose(A);