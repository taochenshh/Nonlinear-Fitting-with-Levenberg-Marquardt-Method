clear all;clc;close all;
syms c1 c2 c3 t y
Y=c1*exp(-c2*(t-c3)^2)-y;
x1=[-1 0 1 3 6];
x1=x1';
z1=[1 5 10 8 1];
z1=z1';
x2=[1 2 4 5 6 8 9 11];
x2=x2';
z2=[1 3 7 12 13 5 2 1];
z2=z2';
c=[c1;c2;c3];
epsilon=0.5e-8;
n=30;

display('********************************');
display('For exercise (a)');
display('********************************');
r1=subs(Y,{t,y},{x1,z1});
c0=[10;0;2];
lambda=1;
c_root1=LevenbergMarquardt(r1,c,c0,epsilon,n,lambda);
display('The coefficients found by using LevenbergMarquardt method are:');
display(['c=[c1;c2;c3]=' mat2str(c_root1)]);
f1=c_root1(1).*exp(-c_root1(2).*(x1-c_root1(3)).^2);
aError=f1-z1;
aRMSE=norm(aError,2);
display(['RMSE=' num2str(aRMSE)]);
figure(1);
plot(x1,z1,'o','MarkerFaceColor','g','MarkerSize',8);
hold on;
a=-2:0.1:8;
g1=c_root1(1).*exp(-c_root1(2).*(a-c_root1(3)).^2);
plot(a,g1,'b');
title('Levenberg-Marquardt fitting');


display('********************************');
display('For exercise (b)');
display('********************************');
r2=subs(Y,{t,y},{x2,z2});
c0=[10;0;2];
lambda=0.5;
c_root2=LevenbergMarquardt(r2,c,c0,epsilon,n,lambda);
display('The coefficients found by using LevenbergMarquardt method are:');
display(['c=[c1;c2;c3]=' mat2str(c_root2)]);
f2=c_root2(1).*exp(-c_root2(2).*(x2-c_root2(3)).^2);
bError=f2-z2;
bRMSE=norm(bError,2);
display(['RMSE=' num2str(bRMSE)]);
figure(2);
plot(x2,z2,'o','MarkerFaceColor','g','MarkerSize',8);
hold on;
a=0:0.01:12;
g2=c_root2(1).*exp(-c_root2(2).*(a-c_root2(3)).^2);
plot(a,g2,'b');
title('Levenberg-Marquardt fitting');





