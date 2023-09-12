syms t u 
n=1; 
for v=1:length(A(:,1)); 
    n=n*exp(-(A(v,1)-u)^2/(2*t)); 
end 
p=n; 
 
Q=(1/sqrt(2*pi*t))^(length(A))*p 
%Take the derivative and solve for the mean 
w=diff(Q,u) 
w2=solve(w==0,u) 
 
 
v=diff(Q,t) 
y=solve(v==0,t) 