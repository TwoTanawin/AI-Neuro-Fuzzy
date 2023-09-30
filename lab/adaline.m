%% Adaline
%% Input
Padl = [-3 -2 -1 0 1 2 3]
%% Target
Tadl = [6 3 2 3 6 11 18]
%% 
plot(Padl, Tadl)
%% Input Adaline nn
Padlvec = [Padl.^2; Padl.^1; Padl.^0]
%%
adlnet = newff(Padlvec, Tadl, [1], {'purelin'})
%%
yadl = sim(adlnet, Padlvec)
%%
plot(Padl, yadl)
%%
adlnet = train(adlnet, Padlvec, Tadl)
%%
yadl_train = sim(adlnet, Padlvec)
%%
plot(Padl, yadl_train, 'red')