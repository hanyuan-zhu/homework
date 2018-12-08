
% a = 1;
% x = [0 :0.05:1];
% 
% %% for f(x) = x^3 on [0,a)
% 
% y0 = x.^3;
% 
% 
% % Minimax
% y1 = a^2 * x - sqrt(2)/8 * a^3;
% 
% % linear Chebyshev polynomial
% y2 =  x *7/8 - 2/16;
% 
% % Least Square
% y3 = 9/10 * a^2 * x - a^3 /5;
% 
% % Plot 
% plot(x,y0,x,y1,x,y2,x,y3),legend('x^3', 'Minimax', 'Near MiniMax', 'Least Square')


%% On interval [-a,a]


a = 1;
x = [-1:0.05:1];
y0 = x.^3;


% Minimax
y1 = (3 - sqrt(5)) * x ;

% linear Chebyshev polynomial
y2 = x/2;

% Least Square
y3 = 3/5 * x;

plot(x,y0,x,y1,x,y2,x,y3),legend('x^3', 'Minimax', 'Near MiniMax', 'Least Square')






