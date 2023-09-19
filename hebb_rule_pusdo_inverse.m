%% Define p matrix
p11 = 4/sqrt(1196);
p12 = 10/sqrt(1196);
p13 = -24/sqrt(1196);
p14 = 6/sqrt(1196);
p15 = -12/sqrt(1196);
p16 = 18/sqrt(1196);

p21 = -9/sqrt(299);
p22 = 6/sqrt(299);
p23 = -3/sqrt(299);
p24 = -12/sqrt(299);
p25 = 5/sqrt(299);
p26 = 2/sqrt(299);

p31 = 792/sqrt(7998848);
p32 = 1440/sqrt(7998848);
p33 = 1112/sqrt(7998848);
p34 = 656/sqrt(7998848);
p35 = 1440/sqrt(7998848);
p36 = 1248/sqrt(7998848);

p = round([p11, p12, p13, p14, p15, p16; p21, p22, p23, p24, p25, p26; p31, p32, p33, p34, p35, p36], 4);

disp(p);

% Transpose of p matrix
disp(size(p'));

% Transpose of the first row of p matrix
disp(size(p(1,:)'));

%% Define t matrix
t11 = 2;
t12 = 3;
t13 = 4;

t21 = 7;
t22 = 8;
t23 = 9;

t31 = 13;
t32 = 14;
t33 = 15;

t = [t11, t12, t13; t21, t22, t23; t31, t32, t33];

disp(t);

% Size of t matrix
disp(size(t));

% Size of the first row of t matrix
disp(size(t(1,:)));

% Initialize w matrix with zeros
w = zeros(size(t, 2), size(p, 2));

w1 = t(1, :)' * p(1, :);
disp("w1 : ")
disp(w1)

%% Calculate w matrix
for i = 1:size(p, 1)
    w = w + (t(i, :)' * p(i, :));
end

disp("w : ")
disp(w);