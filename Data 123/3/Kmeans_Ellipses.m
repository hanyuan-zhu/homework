%% Sample from two anisotropic Gaussians

N=1000;
DistortionMatrix=[1,0;0,10];

X1=randn(1000,2);
%Distort X1 by multiplying by an anisotropic matrix. 
X1=X1*DistortionMatrix;

X2=randn(1000,2);
%Distort X2 by multiplying by an anisotropic matrix. 
X2=X2*DistortionMatrix;
X2=X2+[10,0];

X=vertcat(X1,X2);

close all; 

scatter(X(:,1),X(:,2));
title('Two Elongated Gaussians with Means $[0,0], [10,0]$','Interpreter','latex');
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