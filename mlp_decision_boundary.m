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

% Create an MLP model with one hidden layer and three neurons
hiddenLayerSize = 3;
net = feedforwardnet(hiddenLayerSize);

% Prepare input and target data
inputs = [p1; p2; p3; p4; p5; p6; p7; p8]';
targets = [t1; t2; t3; t4; t5; t6; t7; t8]';

% Set up training parameters
net.trainParam.epochs = 1000; % Number of training epochs
net.trainParam.lr = 0.01;     % Learning rate

% Train the network
net = train(net, inputs, targets);

% Define a grid of points for visualization
[x, y, z] = meshgrid(0:0.1:1, 0:0.1:1, 0:0.1:1);
inputs = [x(:)'; y(:)'; z(:)'];

% Make predictions
predictions = net(inputs);

% Reshape predictions for plotting
predictions = reshape(predictions, size(x));

% Visualize the decision boundary
figure;
isosurface(x, y, z, predictions, 0.5); % Adjust the threshold as needed
xlabel('X');
ylabel('Y');
zlabel('Z');
title('MLP Decision Boundary');
