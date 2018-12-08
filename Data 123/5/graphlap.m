load('Ncut_Data.mat')
reshaped = reshape(pepper,[], 1);

% Wdist is the matrix of the 2 norm of x_i and x_j
Wdist = pdist2(reshaped,reshaped);

%set sigma here
sigma = 0.2;
sigM = ones(size(Wdist))*sigma;

% here is the weight matrix
W = arrayfun(@expoweight, Wdist, sigM);

%sum each column of W, to get the D_i. and diagnolize the vector. 
D =diag(sum(W,2));

%graph Lapacian = D - W
L = D - W;

%eigenvlaue decomposition
[V E] = eig(L);

% Since the eigenvalue is sorted. the second smallest is E(2,2), and the
% vector is V(:,2)

%processing the data

imagebyV = arrayfun(@bipartitioN,reshaped,V(:,2));

newpepper = reshape(imagebyV,100,31);

imshow(newpepper)
