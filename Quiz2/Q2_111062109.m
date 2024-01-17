%%
% prob 6
clear
syms t
gamma = [0, 0.015625, 0.1, 0.5, 2];

hold on
for i = 1:5 
    fplot(1/sqrt((1-t^2)^2+gamma(i)*t^2), [0 2])
end
ylim([0 10])
xlabel('ω/ω_0')
ylabel('Rk/F_0')
legend('Γ = 0','Γ = 0.015625','Γ = 0.1','Γ = 0.5','Γ = 2')
title('Forced vibration with damping')

hold off

%%
% prob 7
clear
syms t u(t)
Du = diff(u,t);
eqn = diff(u,2) + u == 0.5 * cos(0.8 * t);
cond1 = u(0) == 0;
cond2 = Du(0) == 0;
f = dsolve(eqn, cond1, cond2);

fplot(f, [0 70])
xlabel('t')
ylabel('u')

%%
% prob 8
clear
syms y(x) x

hold on

for i = 1:8
    Dy = diff(y,x);
    f = dsolve(diff(y,2) + x * diff(y) + 2 * y == 0, y(0) == 0, Dy(0) == 1, 'ExpansionPoint' , 0 , 'Order', i);
    fplot(f, [0 10])
end
xlabel('x')
ylabel('y')
legend('n = 0','n = 1','n = 2','n = 3','n = 4','n = 5', 'n = 6', 'n = 7')

hold off