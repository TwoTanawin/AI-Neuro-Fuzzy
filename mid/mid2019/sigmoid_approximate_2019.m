%% sigmoid approximation
%% define parameter
syms p

w1 = [1 5 8 10 12]
b1 = [20 0 -80 -300 -600]

w2 = [25 -10 -20 40 -50]
b2 = [15]

% n1 = w1(1)*p+b1(1) == 0
% 
% solve(n1, p)

%% loop solve p parameter
center_value = [];

for i=1:length(w1)
    n = w1(i)*p+b1(i) == 0
    n_solve = solve(n, p)
    center_value = [center_value, n_solve];
end

center_value

%%
a1 = sigmoid((w1*center_value')*b1)

%%
al2 = [];
for k =1:length(w2)
    al2 = [al2, linear_function((w2(k)*center_value(k)')*b2)];
end

al2

%% plot
plot(center_value, a1)
hold()
plot(center_value, al2)

%%

% % Define the range of x values
% x = linspace(-6, 6, 100); % Adjust the range and number of points as needed
% 
% % Calculate the sigmoid values for the given x values
% sigmoidT = 1./(1 + exp(-x));
% 
% % Create a plot
% plot(x, sigmoidT, 'b', 'LineWidth', 2);
% xlabel('x');
% ylabel('Sigmoid(x)');
% title('Sigmoid Function');
% grid on;

%%
function sm = sigmoid(x)
   sm = 1 ./ (1 + exp(-x));
end

function y = linear_function(x)
    y = x;
end