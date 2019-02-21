
% data = load('ex2data1.txt');

X = [0 1 1; 1 2 1; 2 3 0; 3 4 1; 4 5 0; 5 6 0; 6 7 0; 
7 8 0; 8 9 0; 9 10 1; 10 11 1]

%% ==================== Part 1: Plotting ====================
%  We start the exercise by first plotting the data to understand the 
%  the problem we are working with.

% Plot a linear graph
plot(X(:,1), X(:,2), 'r')

% Put some labels 
hold on;
% Labels and Legend
xlabel('X axis')
ylabel('y axis')

% Specified in plot order
legend('X Values', 'Y Values')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

% Lets plot points on a graph
y = X(:, 3);
pos = find(y==1); 
neg = find(y == 0);
% Plot Examples
% Create New Figure
figure; hold on;
plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
hold off;