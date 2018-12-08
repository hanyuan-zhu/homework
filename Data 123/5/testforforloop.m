load("DBSCAN_Data.mat");

% DBSCAN(X,0.02,5);
% 
% DBSCAN(X,0.05,5);
% 
% DBSCAN(X,0.05,10);
% 
% DBSCAN(X,0.05,2);

DBSCAN(X,0.05,51);

% dataBase = X;
% 
% eps = 0.01;
% 
% minPts =4;
% 
% DBdistance = pdist2(dataBase,dataBase);
% 
% toSearch = [];
% 
% NC = {};
% 
% for idx = 1:length(DBdistance)
%     aa = find(DBdistance(:,idx)<eps & DBdistance(:,idx)>0);
%     if length(aa) >= minPts
%         NC{end+1} = {[length(aa),1],aa};
%         toSearch(end+1) = idx;
%     else
%         NC{end+1} = {[length(aa),0],aa};
%         DB(3,idx) = -1;
%     end
% end
