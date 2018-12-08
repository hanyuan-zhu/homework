%% Sample from two anisotropic Gaussians

DistortionMatrix=[1,0;0,10];


X1=rand(1000,2);
X1=X1*DistortionMatrix;

X2=rand(1000,2);
X2=X2*DistortionMatrix;
X2=X2+[10,0];

X3=10*rand(1000,2);
D2Matrix=[1,0;0,0];
X3 = X3*D2Matrix+[0,5]

X4=rand(1000,2);
X4=X4*DistortionMatrix;
X4=X4+[12,0];


X=vertcat(X1,X2,X3,X4);

hold on

scatter(X(:,1),X(:,2));
title('Two Elongated Gaussians with Means $[0,0], [10,0]$','Interpreter','latex');
axis equal

Z=linkage(X,'single');

dendrogram(Z)
hold on

Z1=linkage(X,'complete');

dendrogram(Z1)