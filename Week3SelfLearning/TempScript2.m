X = [1 1 1; 1 2 2; 1 3 3; 1 4 4; 1 5 5; 1 6 6; 1 7 7; 1 8 8; 1 9 9;
     1 2 5; 1 3 9; 1 5 3; 1 9 3];
     
theta = [1 2 4];

% Only need 2 points to define a line, so choose two endpoints
% temp1 = X(:,2);
% temp2 = min(X(:,2));
% temp3 = min(X(:,2))-2;
plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

% Calculate the decision boundary line
temp4 = (-1./theta(3));
temp4b = (-1./theta(3));
temp5 = theta(2).*plot_x;
temp6 = (theta(2).*plot_x + theta(1));
temp7 = (-1./theta(3)).*(theta(2).*plot_x + theta(1));
plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));


% Plot, and adjust axes for better viewing
plot(plot_x, plot_y)