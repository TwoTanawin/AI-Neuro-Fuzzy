%% Input x axis
p = [-2:0.1:2]
%% target y axis
t = 1+sin(pi*p/4)
%% plot
plot(p, t)
%% Neural function
sample = newff(p, t, [2], {'logsig', 'purelin'})
%% weight layer 1
sample.iw{1,1}
%% weight layer 2
sample.lw{2,1}
%% bias layer 1
sample.b{1,1}
%% bias layer 2
sample.b{2,1}
%%
y = sim(sample,p)
%%
plot(p,t,p,y,'o')
%% check iteration defualt
sample.trainParam.epochs
%% set new epoch
sample.trainParam.epochs = 50;
%% train system
sample = train(sample,p,t)
%% weight after train layer 1
sample.iw{1,1}
%% weight after train layer 2
sample.lw{2,1}
%% bias after train layer 1
sample.b{1,1}
%% bias after train layer 2
sample.b{2,1}
%% output after train
y1 = sim(sample,p)
%% plot after train
plot(p,t,p,y1,'o')
%% change sturcture
sample1 = newff(p, t, [10], {'logsig', 'purelin'})
%%
y2 = sim(sample1,p)
%%
plot(p,t,p,y2,'o')
%%
sample1.trainParam.epochs = 50;
%%
sample1 = train(sample1,p,t)
%%
y3 = sim(sample1,p)
%%
plot(p,t,p,y3,'o')
%%
t1 = 1+sin(2*pi*p)
%%
plot(p,t1)
%%
sample2 = newff(p, t1, [10], {'logsig', 'purelin'})
%%
y4 = sim(sample2, p)
%%
plot(p,t1,p,y4,'o')
%%
sample2.trainParam.epochs = 5;
%%
sample2 = train(sample2,p,t1)
%%
y5 = sim(sample2, p)
%%
plot(p,t1,p,y5,'o')
%%
sample2.trainParam.epochs = 200;
%%
sample2 = train(sample2,p,t1)
%%
y6 = sim(sample2, p)
%%
plot(p,t1,p,y6,'o')
%%
sample3 = newff(p, t1, [3], {'logsig', 'purelin'})
%%
y7 = sim(sample3, p)
%%
plot(p,t1,p,y7,'o')
%%
sample3 = train(sample3,p,t1)
%%
y8 = sim(sample3, p)
%%
plot(p,t1,p,y8,'o')
%%
x = [-2: 0.1: 2]
%%
y = [-2: 0.1: 2]
%%
z = x.*y
%%
plot3(x,y,z)
%%
in1 = [x; y]
%%
sample3 = newff(in1, z, [10], {'logsig', 'purelin'})
%%
y9 = sim(sample3, in1)
%%
plot3(x,y,y9)
%%
sample3 = train(sample3,in1,z)
%%
y10 = sim(sample3, in1)
%%
plot3(x,y,y10)
