%% Set Parameter
Pa = [0 4000 6000 10000];
K = [0 10 20 30];
m_cube = [0 0.1 0.4 0.5];
% x2 = [-4, -2, -1, -3, 2, -4, 5, 8, 0];
Pa_pow2 = Pa.^2;
% x2_pow2 = x2.^2;
% x1x2 = x1 .* x2;
% y = [16, 2, 3.5, 10.5, 38, 34, 39.5, 104, 56];

value = 1;
bias = ones(size(Pa)) * value;

%% Set New column Stack
disp("------ Set New column Stack ------")
% new_column_stack = [x1_pow2', x2_pow2', x1x2', x1', x2'];

new_column_stack = [K' m_cube']

new_column_stack(2,:)
%% get c value
disp("------ Cal C value ------")
c = round(cal_c_value(Pa), 3);
fprintf('c :\n');

disp(c)

%% get h value
disp("------ Cal h value ------")
h = round(cal_h_value(Pa, new_column_stack), 3);
fprintf('h :\n');

disp(h)
%% get R value
disp("------ Cal R value ------")
R = round(cal_R_value(new_column_stack), 3);
fprintf('R :\n');
disp(R);

%% Cal requirement
disp("------ Cal Requirement ------")
ab = inv(R)*h'

%%
a = round(cal_a_value(R, h), 2);
fprintf('a :\n');
disp(a);

%% Func to cal parameter c
function c = cal_c_value(y)
    c = (1/length(y)) * sum(y.^2);
end

%% Func to cal parameter h
function h = cal_h_value(y, new_column_stack)
    a = zeros(1, length(new_column_stack(1,:)));
    h = zeros(1, length(new_column_stack(1,:)));
    
    for i = 1:length(y)
        a = a + y(i) * new_column_stack(i, :);
    end
    
    h = (1/length(y)) * a;
end

%% Func to cal parameter R
function R = cal_R_value(new_column_stack)
    a = zeros(length(new_column_stack(1,:)), length(new_column_stack(1,:)));
    R = zeros(length(new_column_stack(1,:)), length(new_column_stack(1,:)));
    
    for i = 1:length(new_column_stack(:,1))
        a = a + (new_column_stack(i,:)' * new_column_stack(i,:));
    end
    
    R = (1/length(new_column_stack(:,1))) * a;
end

%% Func to cal parameter a
function a = cal_a_value(R, h)
    a = inv(R) * h';
end
