import numpy as np
import math
#iteration counter: to count how many steps to reach the threshold value
i=0

#Define the target funciton
#def f(x):
#    return math.tan(x)-x;

# here iter(x) is x - f(x)/f'(x)
def iter(x):
    tanx = math.tan(x);
    tanx2 = math.pow(tanx,2);
    return x - (tanx - x)/tanx2

## NOTE: Inital generator, range:[4.2,4.7). Since we get smallest root from bisection around 1.57.
x_1 = 0

x_2 = np.random.random()*.5+4.2;


### Setting the threshold epsilon
epsilon_ = math.pow(10,-15)

while abs(x_1-x_2) > epsilon_:
    x_1 = x_2;
    x_2 = iter(x_1);
    i = i+1;

# x_2= 4.49340945791
print x_2

# i = 7
print i
