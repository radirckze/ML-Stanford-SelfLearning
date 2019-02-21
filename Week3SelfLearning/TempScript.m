

X = [
1,2,1.6;
1,2,1.4;
1,3,2.1;
1,3,1.9;
1,4,2.6;
1,4,2.4;
1,5,3.1;
1,5,2.9;
1,6,3.6;
1,6,3.4;
1,7,4.1;
1,7,3.9;
1,8,4.6;
1,8,4.4;
1,9,5.1;
1,9,4.9;
1,10,5.6;
1,10,5.4;
1,11,6.1;
1,11,5.9
];

y = [1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0]
m= rows(X);

% theta = [-0.5;-0.5;1];
theta = [-28;-29;58];

xTheta = X * theta;

temp1 = exp(-xTheta);

temp2 = (1 + exp(-xTheta));

hx = 1 ./ (1 + exp(-xTheta));

% temp1 = log(hx);
% temp2 = (-y' * log(hx));
% temp3 = ((1 - y') * (log(1 - hx)));
% temp4 = sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx))));
% temp5 = (1/m * temp3);
% temp6 = sum(temp4);

currentCost = sum(1/m * sum((-y' * log(hx)) - ((1 - y') * (log(1 - hx)))));

hx

