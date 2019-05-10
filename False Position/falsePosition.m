%% False Position Function
%Nolan Sherrill
%Mech 105
%% This function will yield the root based on the False Position estimation method
function [fx, root, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
format long
% Define the inputs
if nargin > 5
    disp('error, too many inputs have been entered')
end
switch nargin
    case 2
        es = 0.00001;
        maxiter = 200;
    case 3
        maxiter = 200;
end

% Check if there is a sign change
fxl = func(xl);
fxu = func(xu);
if (fxl*fxu > 0)
    disp('Error found, there is no sign change in the selected boundary')
end
% Defining the function paremeters using a while loop
iter = 1;
error = 1;
n = 1;
while ((error>es) && iter <= maxiter) %continues if error is less than the required or when the number of iterations reaches the specified amount
    root = xl-((func(xl)*(xl-xu))/(func(xl)-func(xu)));
    if (func(xl)*func(xu)<0) % determines which bound will be reassigned
        
        xu = root;
    else
        xl = root;
    end   
    iter = iter + 1; %counts the iteration number
    root1(n+1) = root; %creates a vector for the root
    error = abs((root1(n+1)-root1(n))/root1(n+1)); %calculates the error
    error1(n+1)= error; %makes an error vector
end
root = root;
ea = error1; %error percent
fx = func(root); %Function evaluated at the root
iter = iter-1; %number of iterations minus one to compensate for the start condition
end
