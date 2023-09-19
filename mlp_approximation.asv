
p1 = 0;
t1 = -30;

p2 = 100;
t2 = 0;


w1 = [0.1 0.3 0.5];
b1 = [0.9 0.6 0.2];


w2 = [1 2 3];
b2 = 4;


learningRate = 0.01;

a_layer0 = 0;

a_layer1 = cal_a1(p1, w1, b1);

a_layer2 = cal_a2(w2, a_layer1, b2);

disp("a Layer 1 : ")
disp(a_layer1)

disp("a Layer 2 : ")
disp(a_layer2)

disp("Error 1 : ")
disp(error(t1, a_layer2))

s_power2 =  cal_s_power_2(error(t1, a_layer2));
disp("s^2 : ")
disp(s_power2)

s_power1 =  cal_s_power_1(a_layer1, w2, s_power2);
disp("s^1 : ")
disp(s_power1)

w_power2 = cal_w_power_2(w2, learningRate, s_power2, a_layer1);
disp("w^2 : ")
disp(w_power2)

b_power2 = cal_b_power_2(b2, learningRate, s_power2);
disp("b^2 : ")
disp(b_power2)

w_power1 = cal_w_power_1(w1, learningRate, s_power1, a_layer0);
disp("w^1 : ")
disp(w_power1)

b_power1 = cal_b_power_1(b1, learningRate, s_power1);
disp("b^1 : ")
disp(b_power1)

function b_power1 = cal_b_power_1(b1, learningRate, s_power1)
    b_power1 = b1'-learningRate*s_power1;
end

function w_power1 = cal_w_power_1(w1, learningRate, s_power1, a_layer0)
    w_power1 = w1'-learningRate*s_power1*a_layer0;
end

function b_power2 = cal_b_power_2(b2, learningRate, s_power2)
    b_power2 = b2-learningRate*s_power2;
end

function w_power2 = cal_w_power_2(w2, learningRate, s_power2, a_layer1)
    w_power2 = w2-learningRate*s_power2*a_layer1;
end

function s_power1 = cal_s_power_1(a_layer1, w2, s_power2)
    diagonal_elements = (1 - a_layer1) .* a_layer1;
    disp(diag(diagonal_elements))
    s_power1 = diag(diagonal_elements) * w2'* s_power2;
end

function s_power2 = cal_s_power_2(e)
    s_power2 = -2*1*e;
end

function a_layer2 = cal_a2(w2, a_layer1, b2)
    a = 0;
    for i = 1:length(w2)
        a = a + w2(i)*a_layer1(i);
    end
    a = a + b2;
    a_layer2 = a;
end

function a_layer1 = cal_a1(p1 ,w1, b1)
    a1 = zeros(size(b1));
    for i = 1:length(w1)
        a1(i) = sigmod(p1 * w1(i) + b1(i));
    end
    a_layer1 = a1;
end

function sm = sigmod(n)
    sm = 1/(1+exp(1)^-n);
end

function e = error(t,a)
    e = t-a;
end
