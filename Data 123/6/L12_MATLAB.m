clear all;
load('SmileyFace.mat');
close all;
figure;
% scatter(X(:,1),X(:,2));

%%  Compute all pairwise distances, then build a weight matrix
% 
sigma=0.05;
PWdist=squareform(pdist(X));  %Fast
W=exp(-PWdist.^2./sigma^2);

%% Build random walk Laplacian

D=diag(sum(W,2));
L=eye(size(D))-D^(-1)*W;

%% Compute principal eigenfunctions of L, i.e. those with smallest eigenvalue

[EigVecs,EigVals]=eigs(L,6,'sr');
EigVals=diag(EigVals);

%% Display Shi-Malik clustering

close all;
figure;
title('Second EigenVector');
scatter(X(:,1),X(:,2),[],EigVecs(:,2)>0); 
colorbar

%%
% figure;
% scatter(X(:,1),X(:,2),[],EigVecs(:,2)>0); 
% title('Thresholding on Second EigenVector');
% colorbar

% %% Display Ng, Jordan, Weiss clustering
% 
% Labels=kmeans(EigVecs(:,1:3),3,'Replicates',100);
% 
% figure;
% scatter(X(:,1),X(:,2),[],Labels); 
% title('Spectral Clustering Labels');
% colorbar
% 
% %% Remaining Eigenvectors...where do they localize?
% 
% figure;
% scatter(X(:,1),X(:,2),[],EigVecs(:,3)); 
% title('Eigenvector 3');
% colorbar
% 
% figure;
% scatter(X(:,1),X(:,2),[],EigVecs(:,4)); 
% title('Eigenvector 4');
% colorbar
% 
% figure;
% scatter(X(:,1),X(:,2),[],EigVecs(:,5)); 
% title('Eigenvector 5');
% colorbar
% 
%% Sparse construction, the bad/lazy way

% W_sparse=sparse(size(X,1),size(X,1));
% Knn=10;
% NN=zeros(Knn,size(X,1));
% 
% for i=1:size(X,1)
%     NN(:,i)=knnsearch(X,X(i,:),'k',Knn);
%     for j=1:Knn
%         W_sparse(i,NN(j,i))=exp(-norm(X(i,:)-X(NN(j,i),:)).^2/sigma^2);
%     end
% end
% 
% D_sparse=diag(sum(W_sparse,2));
% 
% L_sparse=eye(size(W_sparse))-D_sparse^(-1)*W_sparse;
% 
% [EigVecsSparse,EigValsSparse]=eigs(L_sparse,6,'sr');
% EigValsSparse=diag(EigValsSparse);
% 
% close all; scatter(X(:,1),X(:,2),[],EigVecsSparse(:,2)>0);

% Labels=kmeans(EigVecsSparse(:,1:3),3,'Replicates',100);

% figure;
% scatter(X(:,1),X(:,2),[],Labels); 
% title('Spectral Clustering Labels');
% colorbar

% figure;
% scatter(X(:,1),X(:,2),[],EigVecs(:,2)>0); 
% title('Thresholding on Second EigenVector');
% colorbar
