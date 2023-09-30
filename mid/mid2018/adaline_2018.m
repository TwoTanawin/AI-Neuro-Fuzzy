%% Convert zeta, r to x, y
zeta_degrees = [0 30 60 90];
r = [50 56.12 92.03 1000];

% Convert Zeta angles to radians and negate them
zeta_radians = deg2rad(zeta_degrees);

% Initialize arrays for x and y
x = zeros(size(zeta_radians));
y = zeros(size(zeta_radians));

% Convert polar coordinates to Cartesian coordinates
for i = 1:length(zeta_radians)
    x(i) = r(i) * cos(zeta_radians(i));
    y(i) = r(i) * sin(zeta_radians(i));
end

x
y

%% Set Parameter
% x1 = [-2, -1, 0, 1, 2, 4, -4, -3, 5];
% x2 = [-4, -2, -1, -3, 2, -4, 5, 8, 0];
% x1_pow2 = x1.^2;
% x2_pow2 = x2.^2;
% x1x2 = x1 .* x2;
% y = [16, 2, 3.5, 10.5, 38, 34, 39.5, 104, 56];
value = 1;
bias = ones(size(x)) * value;

%% Set New column Stack
new_column_stack = [x', bias'];

c = round(cal_c_value(y), 2);
fprintf('c : %.2f\n', c);

h = round(cal_h_value(y, new_column_stack), 2);
fprintf('h : \n');
disp(h)

R = round(cal_R_value(new_column_stack), 2);
fprintf('R :\n');
disp(R);

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
