printf('Part 4: Plotting Data ...');

v = [0:0.01:1];
sinv = sin(2*pi*4*v);
cosv = cos(2*pi*4*v);

plot(v, sinv);
hold on;
plot(v, cosv, 'r'); %plot cosv on top of sinv but in red.
xlabel('X axis');
ylabel('Y axis');
legend('sin', 'co-sine');
title('Plotting Tutorial');
% print -dpng 'Plot-1.png'; //saving the plot
close;
% clear;

% help axis; % get help on axis

M = rand(5,5);
imagesc(M);
imagesc(M), colorbar, colormap gray;