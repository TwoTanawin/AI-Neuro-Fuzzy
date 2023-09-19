% Given column vectors
p1 = [ 255; 0; 0];
p2 = [0; 255; 0];
p3 = [0;  0; 255];

% target
t1 = [3600];
t2 = [1200];
t3 = [2400];

% Input Condition
new_p = [0; 100; 100];

% Create the matrix using the given vectors
disp('Matrix P_transpose:');
P_transpose = [p1 p2 p3];
disp(P_transpose)
disp('-------------------------------------');

disp('Matrix T_transpose:');
T_transpose = [t1 t2 t3];
disp(T_transpose)
disp('-------------------------------------');

disp('Matrix PT_P:');
PT_P = P_transpose * P_transpose;
disp(PT_P)
disp('-------------------------------------');

disp('Matrix PT_P_invert:');
PT_P_invert = inv(PT_P);
disp(PT_P_invert)
disp('-------------------------------------');

disp('Matrix PT_P_invert_PT:');
PT_P_invert_PT = PT_P_invert * P_transpose;
disp(PT_P_invert_PT);
disp('-------------------------------------');

disp('Matrix w:');
w = T_transpose * PT_P_invert_PT;
disp(w);
disp('-------------------------------------');

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
disp('-------------------------------------');

% Check extra condition

disp('Output of extracondition');
ex_output = w*new_p;
disp(ex_output);
disp('-------------------------------------');