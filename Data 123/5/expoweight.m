function [b]=expoweight(a,sig)
b = exp(-(a/sig)^2);
end
