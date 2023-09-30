%% 2021 perceptorn
%% Input
p = [1 1 1 1 1; 2 3 1 5 6; 9 7 4 2 1; -4 -7 -3 -8 -2; -5 -9 -3 -2 -1];

for i = 1:length(p)
    fprintf('p%d = ', i);
    
    fprintf('%d ', p(i, :));
    
    fprintf('\n');
end
%% orthogonal
n11_orthogonal = [];
for i = 2:length(p)
    diff_row = abs(p(i, :) - p(1, :));
    n11_orthogonal = [n11_orthogonal; diff_row];
end

% disp(n11_orthogonal)
for j = 1:length(n11_orthogonal)-1
    fprintf('N %d = ', j);
    
    fprintf('%d ', n11_orthogonal(j, :));
    
    fprintf('\n');
end
%%

n11_orthogonal(:, 1) = [];
disp(n11_orthogonal)

weight1 = n11_orthogonal * n11_orthogonal';


disp(weight1);

