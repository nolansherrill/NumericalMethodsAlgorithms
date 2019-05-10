%% Simpsons 1/3 rule for input matrix
% Nolan Sherrill
% 4/19/19
% Mech 105 
% Professor: Dr Bechara
function [I] = Simpson (x,y)
%This function uses a combination of simpsons 1/3 rule and trapezoidal
%reimann sums to find the estimate of the integral of tabular data
%   Inputs x,y is a matrix that has equal spacing and equal length
%   Outputs I is the estimate of the integral using this method
I = 0;
[m,n] = size(x); 
a = x(1,1);
b = x(1,end);
j = 3;
mid = 2;
k = 1;
check = linspace(a,b,n); % creates an equally spaced matrix
if isequal(check,x) == 0 % checks if the input is equally spaced
    disp('The input matrix is not equally spaced')
else
   if mod(n,2) == 0 % determines if the function has an even number of inputs
    disp('Note to user: A trapezoidal sum has been used for the last interval')
    tr = (x(1,end)- x(1,end-1)).*((y(1,end)+ y(1,end-1))./2); % uses the trapezoidal sum for the last input
    h=((b-1)-a)/2; %Sets up h
    while j <= n % uses just simpsons rule if input # is odd
    simp = h/3*((y(1,k))+4*y(1,mid)+ y(1,j));  %uses simpsons 1/3 for the remaining intervals
       k = j;
       j = j+2;
       mid = mid +2;
       I = simp;
    I = simp + tr;
    end
   else
    h=(b-a)/2; %sets up h if input # is odd
   while j<=n % uses just simpsons rule if input # is odd
    simp = h/3*((y(1,k))+4*y(1,mid)+ y(1,j));
       k = j;
       j = j+2;
       mid = mid +2;
       I = simp;
   end
end
end
end



