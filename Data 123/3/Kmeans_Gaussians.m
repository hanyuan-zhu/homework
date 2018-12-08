%% Sample from two isotropic Gaussians

N=1000;

X1=randn(1000,2);
X2=randn(1000,2)+[4,0];

X=vertcat(X1,X2);

close all; 

scatter(X(:,1),X(:,2));
title('Two Isotropic Gaussians with Means $[0,0], [4,0]$','Interpreter','latex');
axis equal

[idx,C] = kmeans(X,2,'Display','Iter','Replicates',100);


%Plot figure
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off