%% Competitive Network
%%
Pc = [1 1.1 0.9 -1 -0.8 -1.2; 1 0.8 1.2 -1 -0.9 -1.1]
%%
samplec = newc([-2 2; -2 2], 2)
%%
Yc = sim(samplec, Pc)
%%
yclass = vec2ind(Yc)
%% weight
samplec.iw{1,1}
%% bias
samplec.b{1,1}
%%
samplec = train(samplec, Pc)
%%
Yc1 = sim(samplec, Pc)
%%
yclass1 = vec2ind(Yc1)
%% weight after train
samplec.iw{1,1}
%% bias after train
samplec.b{1,1}