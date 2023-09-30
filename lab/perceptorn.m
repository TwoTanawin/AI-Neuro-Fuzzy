%% Percepton
Pper = [0 0 1 1; 0 1 0 1]
%%
Tper = [0 0 0 1]
%%
plotpv(Pper, Tper)
%% np create perceptron
sampleper = newp([0 1; 0 1], 1)
%%
Yper = sim(sampleper, Pper)
%%
plotpv(Pper, Yper)
%%
sampleper.iw{1,1}
%%
sampleper.b{1}
%%
plotpc(sampleper.iw{1,1}, sampleper.b{1})
%%
sampleper.trainParam.epochs
%%
sampleper.trainParam.epochs = 20;
%%
sampleper = train(sampleper, Pper, Tper)
%%
Yper1 = sim(sampleper, Pper)
%%
plotpv(Pper, Yper1)
%% weight after train layer1
sampleper.iw{1,1}
%% bias after train layer1                                                                                                         
sampleper.b{1}
%%
plotpc(sampleper.iw{1,1}, sampleper.b{1})
%%
axis([0;3;0;3])
%% change training data OR
Pper = [0 0 1 1; 0 1 0 1]
%% NOR
Tor_nor = [0 1 1 1; 1 0 0 0]
%%
plotpv(Pper, Tor_nor(1,:))
%%
figure(2)
%%
plotpv(Pper, Tor_nor(2,:))
%%
sampleper1 = newp([0 1; 0 1], 2)
%%
Yper2 = sim(sampleper1, Pper)
%%
figure(1)
%%
plotpv(Pper, Yper2(1,:))
%%
figure(2)
%%
plotpv(Pper, Yper2(2,:))
%%
sampleper1 = train(sampleper1, Pper, Tor_nor)
%%
Yper3 = sim(sampleper1, Pper)
%%
figure(1)
%%
plotpv(Pper, Yper3(1,:))
%%
figure(2)
%%
plotpv(Pper, Yper3(2,:))
%%
sampleper1.iw{1,1}
%%
sampleper1.b{1,1}