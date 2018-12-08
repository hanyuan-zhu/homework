%% Sample ~1000 points uniformly from a ball

X_Circle=2*rand(floor(1000*(4/pi)),2)-[1,1]; % Generate data uniformly at random
X_Circle=X_Circle(sum(X_Circle.^2,2)<1,:); %Use rejection sampling to get points to live in ball

%%First Principle component
Cov_Circle = cov(X_Circle);
[V_C,D_C] = eig(Cov_Circle);
%%Transformed
PC_1 = X_Circle * V_C(:,1);
PC_2 = X_Circle * V_C(:,2);
length = zeros(size(PC_1,1),1);
close all; % Display data
%scatter(X_Circle(:,1),X_Circle(:,2));
scatter(length,PC_1);
axis equal
title('Data Generated Uniformly From a Ball of Radius 1','Interpreter','Latex');

%% Sample ~1000 points uniformly from an ellipse with major axis lengths 2,.5.




X_Ellipse=4*rand(floor(1000*(16/pi)),2)-[2,2];
X_Ellipse=X_Ellipse(sum([4,.25].*X_Ellipse.^2,2)<1,:);
%%First Principle component
Cov_Ellipse = cov(X_Ellipse);
[V_E,D_E] = eig(Cov_Ellipse);
%%Principle Components
PC_E1 = X_Ellipse * V_E(:,1);
PC_E2 = X_Ellipse * V_E(:,2);
length_E = zeros(size(PC_E1,1),1);
%Eigenvectors line

x_1 = [0 1];
x_2 = [0 0.005];


y_1=V_E(2,1)/V_E(1,1) * x_1;
y_2=V_E(2,2)/V_E(1,2) * x_2;



close all; 
scatter(X_Ellipse(:,1),X_Ellipse(:,2));

hold on 


plot(x_1,y_1)

hold on

plot(x_2,y_2)

hold off

axis equal
title('Data Generated Uniformly From Interior of the Ellipse $4x^{2}+\frac{y^{2}}{4}=1$','Interpreter','latex');