%% This will return the root estimate using the bisection method
% Input variables here
xL = 0.2;
xU = 0.5;
g = -9.81;
m = 95; 
v = 46;
t = 9;
e = 0.05;
% Input equation here:
syms cd
f = @(cd) sqrt(g*m/cd)*tan(sqrt(g*cd/m*t))-v;
a = xL;
b = xU;
F = f(a);
G = f(b); 
x = 1;
error = 1;
count = 0;
while (error>e)
    x0 = x;
    x = .5*(b+a);
    if (F*f(x)<0)
        b = x;
        F = f(a);
        G = f(b);
    else
        a = x;
        F = f(a);
        G = f(b) ;
    end
    error = abs(x-x0)/x;
    count = count +1;
end
disp(x)
disp(count)

% Below the bisection will be performed
