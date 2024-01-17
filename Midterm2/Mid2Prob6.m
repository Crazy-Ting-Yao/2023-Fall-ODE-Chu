%%
%prob 6-a
syms x lambda
f = x * (1-x)/x;
limit(f,x = 0)
f = x^2 * (lambda)/(x);
limit(f,x = 0)

%%
% prob 6-c
clear
syms x y(x)
for lambda = 1:4
    eqn = x*diff(y,2) + (1-x) * diff(y,x) + lambda * y  == 0;
    f = dsolve(eqn)
end

%%
% prob 6-d
clear
syms x
for lambda = 1:4
    laguerreL(lambda, x)
end

%%
% prob 7
clear
syms x y(x)
Du = diff(y,x);
eqn = 3/2*(x^2)*diff(y,2) + x * diff(y,x) + (x^2-9/4) * y  == 0;
f = dsolve(eqn)