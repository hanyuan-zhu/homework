clear all;
load('SalinasA_corrected.mat');
close all;

data1D = reshape(salinasA_corrected,[],204);
pcaM=pca(data1D);
projData=data1D*pcaM;

pca1=reshape(projData(:,1),83,86);

pca1=reshape(projData(:,1),83,86);
image(pca1,'CDataMapping','scaled');

pca2=reshape(projData(:,2),83,86);
image(pca2,'CDataMapping','scaled');

pca3=reshape(projData(:,3),83,86);
image(pca3,'CDataMapping','scaled');