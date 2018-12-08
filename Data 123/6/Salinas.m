clear all;
load('SalinasA_corrected.mat');
close all;

data1D = reshape(salinasA_corrected,[],204);


%% Sparse construction
sigma=5000;

W_sparse=sparse(size(data1D,1),size(data1D,1));
Knn=15;
NN=zeros(Knn,size(data1D,1));

for i=1:size(data1D,1)
    NN(:,i)=knnsearch(data1D,data1D(i,:),'k',Knn);
    for j=1:Knn
       W_sparse(i,NN(j,i))=exp(-norm(data1D(i,:)-data1D(NN(j,i),:)).^2/sigma^2);
%       W_sparse(i,NN(j,i))=(norm(data1D(i,:)-data1D(NN(j,i),:)));
    end
end

D_sparse=diag(sum(W_sparse,2));

L_sparse=eye(size(W_sparse))-D_sparse^(-1)*W_sparse;

[EigVecsSparse,EigValsSparse]=eigs(L_sparse,10,'sr');
EigValsSparse=diag(EigValsSparse);

close all;

%% Display Ng, Jordan, Weiss clustering

Labels=kmeans(EigVecsSparse(:,1:6),6,'Replicates',100);
 
im = image(reshape(Labels,83,86),'CDataMapping','scaled');
colorbar

%% sigma vs egienvalues
plot(fliplr(EigValsSparse'))
