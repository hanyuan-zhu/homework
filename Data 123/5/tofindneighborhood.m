
function [Neighbors]=tofindneighborhood(DB, eps)

DBdistance = pdist2(DB,DB)


Neighbors = [];
for idx = 1:length(DB)
    if norm(DB(1:2,Center_index)-DB(1:2,idx))<= eps
        if idx == Center_index
            continue
        end
        Neighbors = [Neighbors idx];
    end
end

end

% previous function to find neighborhood
% function [Neighbors]=tofindneighborhood(DB,Center_index, eps)
% Neighbors = [];
% for idx = 1:length(DB)
%     if norm(DB(1:2,Center_index)-DB(1:2,idx))<= eps
%         if idx == Center_index
%             continue
%         end
%         Neighbors = [Neighbors idx];
%     end
% end
% 
% end
