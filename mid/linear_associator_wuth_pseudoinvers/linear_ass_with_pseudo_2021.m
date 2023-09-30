%% LinearAssociator with Pseudoinverse
disp("-------------- define training set --------------")
p = [1 1 1; -1 1 1; -1 -1 1]

t = [100 100; 100 50; 100 0;]

disp("-------------- step 1 --------------")
T = [t(1,:)' t(2,:)' t(3,:)']
P = [p(1,:)' p(2,:)' p(3,:)']

disp("-------------- step 2 --------------")
P_Transpose_P = P'*P

disp("-------------- step 3 --------------")
inverse_P_Transpose_P = round(inv(P_Transpose_P), 2)

disp("-------------- step 4 --------------")
inverse_P_Transpose_P_mul_PTranspose = round(inverse_P_Transpose_P * P', 2)

disp("-------------- step 5 --------------")
w = T * inverse_P_Transpose_P_mul_PTranspose
%% When Input case 1
disp("-------------- step 6 --------------")
test_input1 = [-1 -1 -1]

test_a1 = w*test_input1'

%% When Input case 2
disp("-------------- step 7 --------------")
test_input2 = [1 1 -1]

test_a2 = w*test_input2'

%% When Input case 3
disp("-------------- step 8 --------------")
test_input3 = [1 -1 -1]

test_a3 = w*test_input3'

disp("-------------- Finish first require --------------")
%% change training set
p2 = [1 1 1; -1 1 1; 1 1 -1]

t2 = [100 100; 100 50; 50 100;]

T2 = [t2(1,:)' t2(2,:)' t2(3,:)']
P2 = [p2(1,:)' p2(2,:)' p2(3,:)']

P_Transpose_P2 = p_transpose_p(P2)

inverse_P_Transpose_P2 = inverse_p_transpose_p(P_Transpose_P2)

inverse_P_Transpose_P_mul_PTranspose2 = inverse_p_transpose_p_mul_pTranspose(inverse_P_Transpose_P2, P2)

w2 = get_weight(T2, inverse_P_Transpose_P_mul_PTranspose2)

%% When Input case 12 
test_input12 = [-1 -1 -1]

test_a12 = w2*test_input12'

%% When Input case 22
test_input22 = [-1 -1 1]

test_a22 = w2*test_input22'

%% When Input case 32
test_input32 = [1 -1 -1]

test_a32 = w2*test_input32'
%% Function

function p_t_p = p_transpose_p(P)
    p_t_p = P'*P;
end

function i_p_t_p = inverse_p_transpose_p(p_t_p)
    i_p_t_p = round(inv(p_t_p), 2);
end

function i_p_t_p_mul_pt = inverse_p_transpose_p_mul_pTranspose(i_p_t_p, P)
    i_p_t_p_mul_pt = round(i_p_t_p * P', 2);
end

function weight = get_weight(T,i_p_t_p_mul_pt)
    weight = T*i_p_t_p_mul_pt;
end