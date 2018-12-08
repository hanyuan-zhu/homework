load SalinasA_gt
load SalinasA


%% Random sample data

lineSal = reshape(salinasA,[],224);
lineGT = reshape(salinasA_gt,[],1);

XLabels = [lineSal lineGT];

%test set
testidx = randperm(length(XLabels),100);

test100 = XLabels(testidx,:) ;

%training set
trainidx = setdiff([1:length(XLabels)],testidx);

trainSet = XLabels(trainidx,:) ;

samX= trainSet(:,1:224);
samL= trainSet(:,225);

%initiate data
kNNset = [1 10 50 100 500];
Loss100 =[];

%% Model builder

for kNN = kNNset
    Mdl = fitcknn(samX,samL,'NumNeighbors',kNN);
    Loss100 = [Loss100 loss(Mdl,test100(:,1:224),test100(:,225))];
end