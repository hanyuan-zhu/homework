load('SalinasA_corrected.mat');

% a is the original 3D data set
a = salinasA_corrected;


%reduce the data into 2D 7138 by 204 ( here 83*86 = 7138)
b = reshape(a,[7138,204]);

b_mean = mean(b);

% find the convariance matrix
b_cov = 1/7138 * (b-b_mean)'*(b-b_mean);

% The eigenvalue of convariance matrix
b_eig = eig(b_cov);


threshold = 0.95;

%the partial sum of ev
i = 1;
e_sum = b_eig(i);



s_sum = sum(b_eig);



% (a)
% The principle components PC
[PC, D_eig] = eig(b_cov); % PC is the principle component 

% (b)
% Therefore first i principle components preserves 95% variance
%to find the terms preserve 95% of variance
while e_sum < s_sum*0.95 
    i = i+1;
    e_sum = e_sum + b_eig(i);
end

i % i is 2 here


% the first 3 Principle components
for k=1:3
    close all;
    figure;
    imagesc(reshape(b*PC(:,k),size(a,1),size(a,2)));
    title(['First 3 Principle components']);
    pause(4);
end

% Last 3 Principle components
for k=1:3
    close all;
    figure;
    imagesc(reshape(b*PC(:,204-k),size(a,1),size(a,2)));
    title(['Last 3 Principle components']);
    pause(4);
end

