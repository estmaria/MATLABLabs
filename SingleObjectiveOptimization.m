clear
%% FIND MINIMUM  f(x)=x^3-13x^2-7x   min  -1000 to 1000
fun = @(x) [x.^3-13*x.^2-7*x];
x1=-1000;
x2=1000;
x=fminbnd(fun,x1,x2);
figure(1)
fplot(fun,[-1000,1000]);
fprintf('The location of the minimum of the function is %d', x);

%% Find minimum of unconstrained multivariable function   f(x)=10(x2-x1^2)^2+x2  x1=0  x2=1
fun= @(x) 10*(x(2)-x(1).^2).^2+x(2);
x0=[0,1];
x=fminsearch(fun,x0);
%figure(2)
%fplot(fun);
fprintf('The location of the minimum of the function is %d', x);