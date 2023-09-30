%% LVQ
%%
Plvq = [1 1.1 0.9 -1 -0.8 -1.2 0 -0.1 0.1; 1 0.8 1.2 -1 -0.9 -1.1 0 0.2 -0.2]
%%
Tlvq = [1 1 1 1 1 1 2 2 2]
%% one hot encoding
T = ind2vec(Tlvq)
%%
samplelvq = newlvq(minmax(Plvq), 3, [.67 .33])
%%
Ylvq = sim(samplelvq, Plvq)
%%
Yc = vec2ind(Ylvq)
%%
samplelvq = train(samplelvq, Plvq, T)
%%
Ylvq1 = sim(samplelvq, Plvq)
%% one hot encoding
Yc1 = vec2ind(Ylvq1)
%%
samplelvq.iw{1,1}
%%
samplelvq.lw{2,1}