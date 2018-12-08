import numpy as np
import math
#iteration counter: to count how many steps to reach the threshold value
i=0

def randompostive(x):
    return np.multiply(np.random.random(),x)

# here iter(x) is x - f(x)/f'(x)
def iter(x):
    f_x = math.tan(x)-math.cos(x);
    df_x = 1+math.pow(math.tan(x),2)+math.sin(x);
    return x - f_x/df_x

## NOTE: Inital generator, range:[0,5). Since we get smallest root from bisection around 1.57.
x_1 = 0

x_2 = randompostive(2);

### Setting the threshold epsilon
epsilon_ = math.pow(10,-15)

while abs(x_1-x_2) > epsilon_:
    x_1 = x_2;
    x_2 = iter(x_1);
    i = i+1;

# x_2= 0.6662394324925153
print x_2

# i = 9
print i
