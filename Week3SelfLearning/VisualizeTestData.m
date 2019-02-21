% Week 3 : script to help visualize/analize graph3 and graph4 test data.

printf('Week 3: Visualize Graph3Data \n');

% load graph data
graph3Data = csvread('Graph3Data.txt');
% plot the data
% X = graph3Data(:, 1); Y = graph3Data(:, 2); 
XPos = GetSelectedData(graph3Data, 1);
XNeg = GetSelectedData(graph3Data, 0);
plot(XPos(:,1), XPos(:,2), 'linestyle', 'none', 'marker', '*', 'color', 'r'); % Plot the data
hold on;
plot(XNeg(:,1), XNeg(:,2), 'linestyle', 'none', 'marker', 'o', 'color', 'b'); % Plot the data
xlabel('X');
ylabel('Y');
% zlabel('Y');
% title('Fn(Approx) Y = 1 + 0.2X1 + 0.4X2');

# Part : Graph the data .........
printf('\nNext, Visualize Graph4.Data. Enter any key to concinue ...\n');
pause;

close;
graph4Data = csvread('Graph4Data.txt');
% plot the data
XPos = GetSelectedData(graph4Data, 1);
XNeg = GetSelectedData(graph4Data, 0);
plot(XPos(:,1), XPos(:,2), 'linestyle', 'none', 'marker', '*', 'color', 'r'); % Plot the data
hold on;
plot(XNeg(:,1), XNeg(:,2), 'linestyle', 'none', 'marker', 'o', 'color', 'b'); % Plot the data
xlabel('X');
ylabel('Y');

printf('\nDone! Enter any key to close and exit.\n');
pause;
close;
