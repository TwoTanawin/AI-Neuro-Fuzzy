% % Define the transfer function
% num = [1]; % Numerator coefficients
% den = [1, 3, 3, 2]; % Denominator coefficients
% sys = tf(num, den);
% 
% % Plot the root locus
% rlocus(sys);

% Define the transfer function parameters
k = 1;  % You can change the value of k as needed

% Define the transfer function
num = [k];
den = [1, 3, 3, 2, k];
G = tf(num, den);

% Plot the root locus
figure;
rlocus(G);
title('Root Locus Plot');
grid on;

