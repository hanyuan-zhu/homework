function checkandlabel(Cluster, Neighboorhood, DB, minPts,eps)
%there the DB is original database nX2 matrix


SeedSet = Neighboorhood;
while ~isempty(SeedSet)
    idx = SeedSet(1);
    if DB(3,idx)==-1% label the noise point as C
        DB(3,idx) = Cluster;
    end
    
    if DB(3,idx) == 0 
        DB(3,idx) = Cluster;
%        Neighboorhood = tofindneighborhood(DB,idx,eps);
        if length(Neighboorhood(idx))>= minPts % then the Q is a core point
            
        end
    end
end    
end





%%%%%% previous code below
% it will check the Neighbor of P and lebel all possible Q.
%% stop until all possible neighbors are labeled
% function checkandlabel(Cluster, Neighboorhood, DB, minPts,eps)
% SeedSet = Neighboorhood;
% for idx = SeedSet
%     if DB(3,idx)==-1% label the noise point as C
%         DB(3,idx) = Cluster;
%     end
%     
%     if DB(3,idx) == 0 
%         DB(3,idx) = Cluster;
%         Neighboorhood = tofindneighborhood(DB,idx,eps);
%         if length(Neighboorhood)>= minPts % then the Q is a core point 
%             checkandlabel(Cluster,Neighboorhood,DB,minPts,eps);
%         end
%     end
% end    
% end