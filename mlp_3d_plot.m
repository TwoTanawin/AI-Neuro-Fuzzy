% Define the points
p1 = [0, 0, 0];
p2 = [0, 0, 1];
p3 = [0, 1, 0];
p4 = [0, 1, 1];
p5 = [1, 0, 0];
p6 = [1, 0, 1];
p7 = [1, 1, 0];
p8 = [1, 1, 1];

% Define the associated values
t1 = 1;
t2 = 0;
t3 = 0;
t4 = 1;
t5 = 0;
t6 = 1;
t7 = 1;
t8 = 0;

% Extract x, y, and z coordinates of all points
points = [p1; p2; p3; p4; p5; p6; p7; p8];
x = points(:, 1);
y = points(:, 2);
z = points(:, 3);

% Create a figure
fig = figure;

% Initialize arrays to store indices for t=0 and t=1
idx_t0 = [];
idx_t1 = [];

% Determine the indices for t=0 and t=1
for i = 1:length(points)
    if eval(['t' num2str(i)]) == 0
        idx_t0 = [idx_t0 i];
    else
        idx_t1 = [idx_t1 i];
    end
end

% Plot the points for t=0 with red color
scatter3(x(idx_t0), y(idx_t0), z(idx_t0), 100, 'r', 'filled');
hold on;

% Plot the points for t=1 with green color
scatter3(x(idx_t1), y(idx_t1), z(idx_t1), 100, 'g', 'filled');

% Create a grid of points for the decision boundary
[X, Y] = meshgrid(0:0.1:1, 0:0.1:1);
Z = zeros(size(X));  % Initialize Z values for the boundary

% Set Z values to 1 in the region where t is 1
Z(X == 0 & Y == 0) = 1;
Z(X == 0 & Y == 1) = 1;
Z(X == 1 & Y == 0) = 1;
Z(X == 1 & Y == 1) = 1;

% Plot the decision boundary as a surface
surf(X, Y, Z, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'interp');

% Annotate the points with their coordinates and associated t values
for i = 1:length(points)
    text(points(i, 1), points(i, 2), points(i, 3), sprintf('p%d\nt%d=%d', i, i, eval(['t' num2str(i)])), 'FontSize', 10, 'Color', 'k');
end

% Add labels
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');

% Display the plot
legend('Points (t=0 in red, t=1 in green)', 'Decision Boundary (t=0 to t=1)');
grid on;
hold off;
