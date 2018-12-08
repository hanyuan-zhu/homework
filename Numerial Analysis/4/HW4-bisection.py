import numpy as np
import math
#iteration counter: to count how many steps to reach the threshold value
i=0

#Define the target funciton
def f(x):
    return math.tan(x)-math.cos(x)

def randompostive(x):
    return np.multiply(np.random.random(),x)

## NOTE: Inital generator, range:[0,1), half open interval, choosing a number uniformally randomly
a = randompostive(1);
b = randompostive(1);

## Here guarantees f(b)<= 0 <= f(a)
while f(a)<0:
    b = a;
    a = randompostive(1);

while f(b)>0:
    b = randompostive(1);

#to print the initial range
print abs(a-b)

### Setting the threshold epsilon
epsilon_ = math.pow(10,-15)

### Begin the bisection iterations. # NOTE:  Return r as root.
if f(a)*f(b) != 0:
    while abs(a-b) > epsilon_ :
        c = (a+b)/2
        if f(c) > 0:
            a = c;
        elif f(c) < 0:
            b = c;
        else:
            a = b;
        i = i+1;
    r = (a+b)/2;
elif  f(a) == 0:
    r = a;
else:
    r = b;

# print the root = 0.6662394324925154
print r

# print the number of iteratoins to get the root 50
print i
