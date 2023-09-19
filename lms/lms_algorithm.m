x = [-3 -2 -1 0 1 2 3];
y = [6 3 2 3 6 11 18];
% x = [67.67 9.16 1.24 0.17 0.02]
% y = [1 2 3 4 5]
bias = 1;
bias_vector = ones(1, length(x)) * bias;

disp("x = ")
disp(x)
disp("y = ")
disp(y)
disp("Bias = ")
disp(bias)
disp("Bias Vector = ")
disp(bias_vector)
disp("-------------------------------------------------")

% sum_y = 0;
% for i=1:length(y)
%     sum_y = sum_y+y(i)^2;
% end
% 
% disp(sum_y)
disp("------------------LMS Algorithm------------------")
disp("c = ")
disp(find_c(y))
disp("h = ")
disp(find_h(x, y, bias_vector))
disp("R = ")
disp(find_R(x, bias_vector))
disp("X = ")
R = find_R(x, bias_vector);
h = find_h(x, y, bias_vector);
disp(find_X(R, h))
disp("-------------------------------------------------")

function c = find_c(y)
    sum_y = 0;
    for i = 1:length(y)
        sum_y = sum_y + y(i)^2;
    end
    c = (1 / length(y)) * sum_y;
end

function h = find_h(x, y, bias_vector)
    x_transpose = [x.^2; x; bias_vector];
    sum_x = 0;
    for i = 1:size(x_transpose, 2)  % Iterate through columns
        sum_x = sum_x + x_transpose(:, i) * y(i);
    end
    h = (1 / length(x)) * sum_x;
end

function R = find_R(x,bias_vector)
    sum_xTx = zeros(3, 3);  % Initialize a 3x3 matrix of zeros
    x_transpose = [x.^2; x; bias_vector];
    x_transpose_transpose = [x.^2' x' bias_vector'];
    sum_xTx = x_transpose*x_transpose_transpose;
    R = (1 / length(x)) * sum_xTx;
end

function X = find_X(R, h)
    X = inv(R)*h;
end