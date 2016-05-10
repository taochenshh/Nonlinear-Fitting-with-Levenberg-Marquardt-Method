function xc=LevenbergMarquardt(r,x,x0,epsilon,n,lambda)
%Levenberg Marquardt Method for nonlinear least squares
%Input: r is the nonlinear fitting function model
%       x is the coefficients in the fitting function that needs to be
%       determined
%       x0 is the initial values
%       epsilon is the tolerance
%       lambda is the regularization term coefficient
%Output: xc is the determined coefficients
x0=x0(:);
x=x(:);
J=jacobian(r,x);
a=1;
A0=double(subs(J,x,x0));
r0=double(subs(r,x,x0));
v=-(A0'*A0+lambda*eye(length(x)))\(A0'*r0);
x0=x0+v;
while(norm(A0'*r0)>epsilon)
    A0=double(subs(J,x,x0));
    r0=double(subs(r,x,x0));  
    v=-(A0'*A0+lambda*eye(length(x)))\(A0'*r0);
    x0=x0+v;
    a=a+1;
    if a>n break;
    end
end
xc=x0;
end