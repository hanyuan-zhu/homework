%% Load some random data laying on two circles.  

%% Circle of radius 1.   
% Note this is not uniform on the circle, despite being uniform in theta1.
theta1=2*pi*rand(1000,1);
X1=[cos(theta1),sin(theta1)];
%polar coor.
R1=ones(1000,1);
X1_p=[theta1,R1];

%% Circle of radius 2.
% Note this is not uniform on the circle, despite being uniform in theta1.

theta2=2*pi*rand(1000,1);
X2=10*[cos(theta2),sin(theta2)];

%polar Coor.
R2=10*ones(1000,1);
X2_p=[theta2,R2];



%% Concatenate data and plot
X=vertcat(X1,X2);
%Polar
X_p=vertcat(X1_p,X2_p)

close all;
scatter(X(:,1),X(:,2));
title('Circular data to cluster');


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


%Do k means for polar coordinates

[idx_p,C_p] = kmeans(X_p,2,'Display','Iter','Replicates',100);

%change centroid back to cartestion coordinates
C1_p=[cos(C_p(1,1)),sin(C_p(2,1))];
C2_p=[cos(C_p(1,2)),sin(C_p(2,2))];

%Plot figure for polar coordinates
figure;
plot(X(idx_p==1,1),X(idx_p==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx_p==2,1),X(idx_p==2,2),'b.','MarkerSize',12)
plot(C1_p,C2_p,'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off


figure;
plot(X_p(idx_p==1,1),X_p(idx_p==1,2),'r.','MarkerSize',12)
hold on
plot(X_p(idx_p==2,1),X_p(idx_p==2,2),'b.','MarkerSize',12)
plot(C_p(:,1),C_p(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off

