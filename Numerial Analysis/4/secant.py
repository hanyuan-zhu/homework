import numpy as np
import math


#f(x) = cos(x) - x
def func(x):
     return math.cos(x)-x

# here iter(x) is output x(n+1) by input x(n) and x(n-1)
def iter(x1,x2):
    x_0 = x1;
    x_1 = x2;
    x_2 = x_1 - func(x_1)*(x_1-x_0)/(func(x_1)-func(x_0));
    return x_2

## NOTE: Initation of variables
x_0 = 0;
x_1 = 1;
x_2 = 0;
#iteration counter: to count how many steps to reach the threshold value
i=0

### Setting the threshold epsilon
epsilon_ = math.pow(10,-15)

while abs(x_0-x_1) > epsilon_:
    x_2 = iter(x_0,x_1);
    x_0 = x_1;
    x_1 = x_2;
    i = i+1;

# the numerical results
print x_2

# i = 9
print i
