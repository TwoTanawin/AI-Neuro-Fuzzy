% Define the points as vectors
p1 = [0 7 7];
p2 = [0 9 9];
p3 = [8 0 0];
p4 = [9 0 0];
p5 = [7 7 8];
p6 = [9 9 10];
p7 = [0 0 1];
p8 = [0 0 2];
p9 = [4 4 6];
p10 = [6 6 4];

% Combine the points into a matrix
points = [p1; p2; p3; p4; p5; p6; p7; p8; p9; p10];

% Create a figure
figure;

% Create the 3D scatter plot with different colors
scatter3(points(:, 1), points(:, 2), points(:, 3), 100, (1:10), 'filled');
colorbar; % Add a colorbar to show the mapping of colors to data points

% Label the axes
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');

% Set axis limits if necessary
% axis([xmin, xmax, ymin, ymax, zmin, zmax]);

% Set the title
title('3D Scatter Plot with Different Colors');

% Customize the colormap if desired
colormap(parula); % You can change 'parula' to any other colormap

k = 8;