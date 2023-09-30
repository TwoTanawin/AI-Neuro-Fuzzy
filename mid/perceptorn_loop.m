p = [2 2; 1 -2; -2 2; -1 1];
t = [0 1 0 1];

weight = [0 0];
bias = 0;
error = 0;

re_check = [];

iteration = 0;

while true
    re_check = [];  % Reset re_check for each iteration
    for i = 1:length(p)
        a = cal_a(weight(end, :), p(i, :), bias);
        h = hardlim(a);
        re_check = [re_check h];  % Append the current prediction to re_check
        if h ~= t(i)
            disp('error');
            iteration = iteration + 1;
            fprintf('Iteration %d\n', iteration);
            [err, nw, nb] = backpropagation(h, weight(end, :), p(i, :), bias, t, i);
            error = [error err];
            weight = [weight; nw];
            bias = nb;
        end
        
        fprintf('Last Weight [%f %f], Last bias : %f\n', weight(end, 1), weight(end, 2), bias);
        fprintf('a : %f, h : %d\n', a, h);
        disp('--------------------------------------------------');
    end
    
    if all(re_check == t)
        disp('Done!');
        break;
    else
        disp('Train again!');
    end
end

fprintf('Iteration %d\n', iteration);
fprintf('Best Weight [%f %f], Best bias : %f\n', weight(end, 1), weight(end, 2), bias);

function a = cal_a(w0, p, bias)
    a = w0 * p' + bias;
end

function h = hardlim(a)
    if a >= 0
        h = 1;
    else
        h = 0;
    end
end

function e = cal_error(t, a)
    e = t - a;
end

function nw = new_weight(w0, e, p0)
    nw = w0 + e * p0;
end

function nb = new_bias(b0, e)
    nb = b0 + e;
end

function [err, nw, nb] = backpropagation(h, w0, p0, b0, t, i)
    err = cal_error(t(i), h);
    nw = new_weight(w0, err, p0);
    nb = new_bias(b0, err);
end
