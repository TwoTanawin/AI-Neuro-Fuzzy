x = [0, 1, 2, 3, 4, 5, 6];
y = [1, 3, 5, 7, 9, 11, 13];

len_x = length(x);
len_y = length(y);

sum_of_y = 0;
sum_of_x = 0;
bias = 1;
bias_array = ones(1, len_x) * bias;

start_weight = [0; 0];

learning_rate = 0.1;

bias_start = 0;
a_start = 0;

for i = 1:len_y
    sum_of_y = sum_of_y + y(i)^2;
    sum_of_x = sum_of_x + x(i)^2;
end

target = [x' , y'];

array_h = [x', bias_array'];

c = (1/len_y) * sum_of_y;

h = (1/len_x) * (array_h' * y'); 

r = (1/len_x) * (array_h' * array_h); 

b_a = inv(r)*h;

disp(target(1, 1))

a_1 = cal_a(target(1, 1) , bias_start, a_start)
e_1 = cal_error(target(1, 2), a_1)

present_weight = start_weight+((2*learning_rate*e_1)*array_h(1:2)')

for i =1:len_y
    a_1 = cal_a(target(i, i) , bias_start, a_start)
    e_1 = cal_error(target(i, i+1), a_1)
    present_weight = start_weight+((2*learning_rate*e_1)*array_h(i:i+1)')
end

function y_output = cal_a(bias,x_input,a)
    y_output = (bias * x_input)+a;
end

function e = cal_error(t, a)
    e = t - a;
end


