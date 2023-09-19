% Given column vectors
p1 = [ 1; -1; -1];
p2 = [-1; -1; 1];
p3 = [-1;  1; -1];

% target
t1 = [1; 0];
t2 = [0; 1];
t3 = [0; 0];

% Input Condition
a = [1; 1; -1];
b = [-1; 1; 1];
c = [1; -1; 1];
d = [-1; -1; -1];
e = [1; 1; 1];

% Create the matrix using the given vectors
disp('Matrix P_transpose:');
P_transpose = [p1 p2 p3];
disp(P_transpose)

disp('Matrix T_transpose:');
T_transpose = [t1 t2 t3];
disp(T_transpose)

disp('Matrix PT_P:');
PT_P = P_transpose * P_transpose;
disp(PT_P)

disp('Matrix PT_P_invert:');
PT_P_invert = inv(PT_P);
disp(PT_P_invert)

disp('Matrix PT_P_invert_PT:');
PT_P_invert_PT = PT_P_invert * P_transpose;
disp(PT_P_invert_PT);

disp('Matrix w:');
w = T_transpose * PT_P_invert_PT;
disp(w);

% Check Error
disp('Output T1:');
t1_output = w*p1;
disp(t1_output)

disp('Output T2:');
t2_output = w*p2;
disp(t2_output)

disp('Output T3:');
t3_output = w*p3;
disp(t3_output)

% Calculate outputs for each input
a_output = w * a;
b_output = w * b;
c_output = w * c;
d_output = w * d;
e_output = w * e;

% Print the outputs
disp('Output for input a:');
disp(a_output);

disp('Output for input b:');
disp(b_output);

disp('Output for input c:');
disp(c_output);

disp('Output for input d:');
disp(d_output);

disp('Output for input e:');
disp(e_output);
