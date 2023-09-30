%% LVQ 2018

% class 1 [1 0 0]
p1 = [10 10 10];

p2 = [10.5 9.8 9.6];

p3 = [9.7 10.3 10.2];

% class 2 [0 1 0]
p4 = [5 -15 0];

p5 = [4.7 -14.8 0.3];

% class 1 [1 0 0]
p6 = [-20 -20 -20];

p7 = [-19.6 -20.2 -20.3];

p8 = [-20.3 -19.5 -19.1];

% class 3 [0 0 1]
p9 = [-5 20 -15];

p10 = [-4.8 19.7 -15.4];

p11 = [15 15 15];

p12 = [15.4 14.7 14.9];

%% plot
% % Create arrays for each class of points
% class1 = [p1; p2; p3; p6; p7; p8];
% class2 = [p4; p5];
% class3 = [p9; p10; p11; p12];
% 
% % Create a figure
% figure;
% 
% % Plot each class of points with different colors
% scatter3(class1(:, 1), class1(:, 2), class1(:, 3), 100, 'r', 'filled'); % Class 1 in red
% hold on;
% scatter3(class2(:, 1), class2(:, 2), class2(:, 3), 100, 'g', 'filled'); % Class 2 in green
% scatter3(class3(:, 1), class3(:, 2), class3(:, 3), 100, 'b', 'filled'); % Class 3 in blue
% 
% % Customize the plot
% xlabel('X-axis');
% ylabel('Y-axis');
% zlabel('Z-axis');
% title('Scatter Plot of Points');
% 
% % Add a legend
% legend('Class 1', 'Class 2', 'Class 3');
% 
% % Hold off to finish the plot
% hold off;

%%

disp("----------- weight 1 -----------")

new_stack_w1 = [p1; p2; p3]

% fprintf('Length of new_stack_w1: %d\n', length(new_stack_w1));

new_stack_w1'

w1 = get_weight(new_stack_w1)


disp("----------- weight 2 -----------")

new_stack_w2 = [p4; p5]

new_stack_w2'

w2 = get_weight(new_stack_w2)

disp("----------- weight 3 -----------")

new_stack_w3 = [p6; p7; p8]

new_stack_w3'

w3 = get_weight(new_stack_w3)

disp("----------- weight 4 -----------")

new_stack_w4 = [p9; p10]

new_stack_w4'

w4 = get_weight(new_stack_w4)

disp("----------- weight 5 -----------")

new_stack_w5 = [p11; p12]

new_stack_w5'

w5 = get_weight(new_stack_w5)

%% weight layer 1

weight_layer1 = [w1 w2 w3 w4 w5]

%%
% Initialize w as an array of zeros with the same length as new_stack_w1
% w = zeros(1, size(new_stack_w1, 1));
% 
% disp(size(new_stack_w1, 1))
% 
% for i = 1:size(new_stack_w1, 1)
%     current_array = new_stack_w1(i, :);
%     disp(current_array);
%     fprintf('------- Iteration %d -------\n', i);
%     w = w + new_stack_w1(i, :);
%     disp(w);
% end
% 
% w'

%%

%% function for cal LVQ

function weight = get_weight(new_stack_w)
    w = zeros(1, size(new_stack_w, 2)); % Initialize w with zeros
    for i = 1:size(new_stack_w, 1) % Loop through rows
        w = w + new_stack_w(i, :); % Sum up the rows
    end
    weight = (1/size(new_stack_w, 1)) * w'; % Calculate the weight vector
end



