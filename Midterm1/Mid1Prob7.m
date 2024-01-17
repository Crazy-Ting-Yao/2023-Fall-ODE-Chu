%%
clear
syms x y(x)
eqn = diff(y,x) + y == x*exp(x)*y;
cond = y(0) == 1;
f = dsolve(eqn,cond)

%%
clear
syms x y(x)
eqn = diff(y,x) + y == x*exp(x)*y;
cond = diff(y,x) == 0;
f = dsolve(eqn,cond)

%%
clear
[T, Y] = meshgrid(-2:0.2:2, -2:0.2:2);
S = T.*exp(T).*Y - Y;
L = sqrt(1 + S.^2);
quiver(T, Y, 1./L, S./L, 0.45)
axis tight; xlabel('x'), ylabel('y')
title('Direction field for dy/dx + y = x*exp(x)*y')

%%
clear
syms x y(x)
eqn = diff(y,x) == exp(y)/(x*y);
f = dsolve(eqn)
