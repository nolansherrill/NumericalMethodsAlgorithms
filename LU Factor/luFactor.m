%% LU Factorization with pivoting
%Nolan Sherrill
%4/2/19, Mech 105
%% Inputs and outputs
% Inputs: 
% A, (nxn matrix)
% Outputs: 
% L,U,P

function [L,U,P] = luFactor(A)
n = length(A); % Sets the lenth of vector A
L=eye(n);% Sets up L to the identity matrix to start
P = eye(n);
for b=1:n %Pivoting operation
    while (A(b,b) == 0)
        f = f + 1;
        b = f:n; % re pivots until the condition is met
        P = eye(n)*(f:n); % updates P
    end
    
    L(b+1:n,b)=A(b+1:n,b)/A(b,b); % Finds coefficients to form L
    for j=b+1:n
        A(j,:)=A(j,:)-L(j,b)*A(b,:); % Creates L from coefficients
    end
end
U = A/L; % Sets U, by dividing from L
