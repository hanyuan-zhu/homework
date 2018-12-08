% DB input must be 2D dataset. 

function [DB]=DBSCAN(dataBase, eps, minPts)

C = 0; % Cluster Counter

%% Prepare the Dataset
labelDB = zeros(length(dataBase),1);% Create a label set for DB
DB = [dataBase labelDB]';% transpose the DB, to make each vertical component of dataset as a point. for the "for loop" . Union the label and dataset
% NOTICE : Each column of DB is a point now

%% Preprocess the neigbhorhood set
DBdistance = pdist2(dataBase,dataBase);
NC = {};
toSearch = [];

%% to generate neighborhood matrix [[size of neighborhood, corepoint=1],[list
%of neigbhorhood index]]
for idx = 1:length(DBdistance)
    aa = find(DBdistance(:,idx)<eps & DBdistance(:,idx)>0);
    if length(aa) >= minPts
        NC{end+1} = {[length(aa),1],aa};
        toSearch(end+1) = idx;
    else
        NC{end+1} = {[length(aa),0],aa};
        DB(3,idx) = -1;
    end
end

        
%% Here only search all core points
while ~isempty(toSearch)
    idx = toSearch(1);
    toSearch(1) = [];
    
    if DB(3,idx)    
        continue
    end
    
    C=C+1; % if P satisfies all conditions above, label lable it as a new cluster
    
    DB(3,idx)=C;    
    seedSet= NC{idx}{2};
    
    while ~isempty(seedSet)
        idx = seedSet(1); % the index of such element in DB
        seedSet(1) = [];
        if DB(3,idx) == -1 %check if it is noise first. to update the label of noise point to border point
            DB(3,idx) = C;
        end
        
        if DB(3,idx) %skip all labelled point in neigbhorhood
            continue
        end

        seedSet = union(seedSet,NC{idx}{2});% adding the neighorhood of the idx core point to the seedset
        DB(3,idx) = C; % update the cluster label of idx point
    end    

end
    scatter(DB(1,:),DB(2,:),25,DB(3,:),'filled')
end



%%% previous code the for loop part
% % for idx = 1:length(DB) %check every point of the dataset DB
% %     if DB(3,idx) % when the label of current point P is not 0, means it has been checked , then pass to next point
% %         continue
% %     end % the label of current point
% %     N = tofindneighborhood(DB,idx,eps);% neighborhood function returns a collection of points from neighborhood of P
% %     %% NOTES: The neighborhood of P here doesn't contain the center point P. ALSO, each column of the N is a point (including the label of the point)
% %     
% %     if length(N) < minPts % When the point P is not qualified MinPts, label as noise, -1, and checking the next point.
% %         DB(3,idx) = -1; 
% %         continue
% %     end
% %     
% %     C=C+1; % if P satisfies all conditions above, label lable it as a new cluster
% %     
% %     DB(3,idx)=C;
% %     
% %     checkandlabel(C,N,DB,minPts,eps);%label all connect points as C
% % end

