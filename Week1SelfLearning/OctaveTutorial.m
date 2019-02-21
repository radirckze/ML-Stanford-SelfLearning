% Octave Tutorial

% Boolean: 0 = false, 1 = true, ~= is not-equals

% Print
piVal = pi;
disp(piVal);
disp(sprintf('PI to 2 decimals: %0.2f', piVal));
disp("");

% matrices and vecors

v = 0:0.1:0.5;
disp(v);
disp("");

M = ones(2,3);
disp(M);
disp("");

v = zeros(1,3);
disp(v);
disp("");

M = rand(3,3); % random matrix
disp(M);
disp("");

M = eye(3); % 3by3 identity marix
disp(M);
disp("");