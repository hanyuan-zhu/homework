%% Run SVD on Yale face database

%% Download Yale face database in MATLAB form from http://www.cad.zju.edu.cn/home/dengcai/Data/FaceData.html
% The original files are found at http://vision.ucsd.edu/content/yale-face-database

load('Yale_64x64.mat');

%% Diplay the first 20 faces, recognizing that the 4096 = 64^2 dimensions are the pixels of the 
% 64 x 64 images.

for k=1:20
    imagesc(reshape(fea(k,:),64,64));
    pause(.5);
    close all;
end

%% Run mean-center and run SVD:

X=fea-mean(fea);
[U,S,V]=svd(X);
S=diag(S);

%% Plot singular values

figure;
title('Plot of Singular values $\{\sigma_{i}\}_{i=1}^{165}$','Interpreter','latex');
plot(S,'.');

%% Plot 'Right Singular Faces'

for k=1:20
    imagesc(reshape(V(:,k),64,64));
    pause(1);
    close all;
end

%% Do the right singular vectors correspond to the principal components?  Compute PCA the old-fashioned way:
Covar=(1/size(X,1))*(X'*X);
[PC,EigVals]=eig(Covar);
EigVals=diag(EigVals); %Turn diagonal matrix into a vector
[~,IdxSorted]=sort(EigVals,'descend');
EigVals=EigVals(IdxSorted);
PC=PC(:,IdxSorted);

%%  Notice that the eigenvectors may differ from the right SV by a +/- sign

for k=1:20
    figure;
    subplot(1,2,1)
    imagesc(reshape(PC(:,k),64,64));
    title([num2str(k),'$^{th}$ Principal Component'],'Interpreter','latex');
    colorbar
    axis square;
    subplot(1,2,2)
    imagesc(reshape(V(:,k),64,64));
    title([num2str(k),'$^{th}$ Right SV'],'Interpreter','latex');
    colorbar
    axis square;
    pause(3)
end


