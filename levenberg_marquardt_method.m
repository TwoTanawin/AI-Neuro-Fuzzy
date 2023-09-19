% Training Set
p = [5, 10, 15, 20]; % Input
t = [2, 8, 8, 20];  % Target

w_layer1 = [-0.1, 0.2]; % Initialize w_layer1
b_layer1 = [0.4, -1.3];
w_layer2 = [0.5; 0.7];
b_layer2 = 0.8;
bias_layer2 = -1;

u = 0.5;

a_layer0 = 0;
f1_purelin = -1;

% Static Cal

a_layer1 = w_layer1' * p(1) + b_layer1';
n_layer1 = round(log_sigmod(a_layer1), 4);

a_layer2 = round(w_layer2 * n_layer1 + b_layer2, 4);

error = cal_error(t(1), a_layer2);

value1 = (1 - n_layer1(1)) * n_layer1(1);
value2 = (1 - n_layer1(2)) * n_layer1(2);

desired_matrix = convert_to_desired_matrix(n_layer1);

s_layer2 = round(desired_matrix * w_layer2 * f1_purelin, 4);

fprintf('a_layer1 = %s x %d + %s = %s\n', mat2str(w_layer1'), p(1), mat2str(b_layer1'), mat2str(a_layer1));
fprintf('n_layer1  : %s\n', mat2str(n_layer1));
fprintf('a_layer2 = %s x %s + %d = %s\n', mat2str(w_layer2), mat2str(n_layer1), b_layer2, mat2str(a_layer2));
fprintf('error = %d\n', error);
fprintf('s_layer2 = %s x %s x %d\n', mat2str(desired_matrix), mat2str(w_layer2), b_layer2);
fprintf('s_layer2 = %s\n', mat2str(s_layer2));

% Parameter Recoard

history_error = [];
history_s_layer2 = [];
history_n_layer1 = [];

% Iteration Process

for i = 1:length(p)
    a_layer1 = w_layer1' * p(i) + b_layer1';
    n_layer1 = round(log_sigmod(a_layer1), 4);
    
    history_n_layer1 = [history_n_layer1, n_layer1];

    a_layer2 = round(w_layer2 * n_layer1 + b_layer2, 4);

    error = cal_error(t(i), a_layer2);
    
    history_error = [history_error, error];

    desired_matrix = convert_to_desired_matrix(n_layer1);

    s_layer2 = round(desired_matrix * w_layer2 * f1_purelin, 4);
    
    history_s_layer2 = [history_s_layer2, s_layer2];
    
    fprintf('--------------------- Input P : %d --------------------------\n', i);
    fprintf('a_layer1 = %s x %d + %s = %s\n', mat2str(w_layer1'), p(i), mat2str(b_layer1'), mat2str(a_layer1));
    fprintf('n_layer1  : %s\n', mat2str(n_layer1));
    fprintf('a_layer2 = %s x %s + %d = %s\n', mat2str(w_layer2), mat2str(n_layer1), b_layer2, mat2str(a_layer2));
    fprintf('error = %d\n', error);
    fprintf('s_layer2 = %s x %s x %d\n', mat2str(desired_matrix), mat2str(w_layer2), b_layer2);
    fprintf('s_layer2 = %s\n', mat2str(s_layer2));
end

% Sum of Error Square

sum_error_power2 = round(sum(history_error .^ 2), 4);
fprintf('sum of error square = %d\n', sum_error_power2);

fprintf('history_s_layer2 = %s\n', mat2str(history_s_layer2));
fprintf('history_n_layer1 = %s\n', mat2str(history_n_layer1));

% Jacobian

jacobian_matrix = create_jacobian_matrix(t, history_s_layer2, history_n_layer1, bias_layer2, p);
fprintf('jacobian_matrix = %s\n', mat2str(jacobian_matrix));

J_T_J = round(jacobian_matrix' * jacobian_matrix, 4);
fprintf('J_T_J = %s\n', mat2str(J_T_J));

% Ensure that dimensions are compatible for multiplication
if size(history_error, 2) ~= size(jacobian_matrix, 1)
    error('Dimensions of history_error and jacobian_matrix are not compatible for matrix multiplication.');
end

J_T_v = round(jacobian_matrix' * history_error', 4);
fprintf('J_T_v = %s\n', mat2str(J_T_v));

matrix_uI = create_I_matrix(length(J_T_J), u);
fprintf('matrix_uI = %s\n', mat2str(matrix_uI));

J_T_J_plus_matrix_uI = J_T_J + matrix_uI;
fprintf('J_T_J_plus_matrix_uI = %s\n', mat2str(J_T_J_plus_matrix_uI));

delta_x = round(-(inv(J_T_J_plus_matrix_uI) * J_T_v), 4);
fprintf('delta_x = %s\n', mat2str(delta_x));

delta_weight_bias = [w_layer1, b_layer1, w_layer2, b_layer2];
fprintf('delta_weight_bias = %s\n', mat2str(delta_weight_bias));

result = delta_x + delta_weight_bias;
fprintf('result = %s\n', mat2str(result));

% Function to Compute

% logsig
function result = log_sigmod(a)
    result = 1 / (1 + exp(-a));
end

% Cal Error
function error = cal_error(t, a)
    error = t - a;
end

% desired matrix
function desired_matrix = convert_to_desired_matrix(original_array)
    n = length(original_array);
    diagonal_values = (1 - original_array) .* original_array;
    desired_matrix = diag(diagonal_values);
end

% Jacobian
function matrix = create_jacobian_matrix(t, s_layer2, n_layer1, bias, p)
    matrix = zeros(4, 7);
    for i = 1:length(t)
        matrix(i, 1) = s_layer2((i - 1) * 2 + 1) * p(i);
        matrix(i, 2) = s_layer2((i - 1) * 2 + 1);
        matrix(i, 3) = s_layer2((i - 1) * 2 + 2) * p(i);
        matrix(i, 4) = s_layer2((i - 1) * 2 + 2);
        matrix(i, 5) = bias * n_layer1((i - 1) * 2 + 1);
        matrix(i, 6) = bias * n_layer1((i - 1) * 2 + 2);
        matrix(i, 7) = bias;
    end
end

% I Matrix
function matrix = create_I_matrix(size, diagonal_value)
    matrix = eye(size);
    matrix = matrix * diagonal_value;
end