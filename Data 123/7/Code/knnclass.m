load kNN_ClassifierSyntheticData
% Labels: 1x1000 lebels
% X : 1000X2 Data point


%% Random sample data

XLabels = [X Labels.'];

testidx = randperm(1000,100);

test100 = XLabels(testidx,:) ;

trainidx = setdiff([1:1000],testidx);

%training set
train900 = XLabels(trainidx,:) ;

samX= train900(:,1:2);
samL= train900(:,3);

%initiate data
kNNset = [1 10 50 100 500 900];
Loss100 =[];

%% Model builder

for kNN = kNNset
    Mdl = fitcknn(samX,samL,'NumNeighbors',kNN);
    Loss100 = [Loss100 loss(Mdl,test100(:,1:2),test100(:,3))];
end