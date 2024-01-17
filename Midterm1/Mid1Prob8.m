clear
h_1 = 0.1;
h_2 = 0.01;
h_3 = 0.001;

syms t X(t);
equation = diff(X,t) == X + t;
condition = X(0) == 1;
S = dsolve(equation,condition)
t = 0:0.001:10;
y = eval(S);

t_1 = zeros(1,101);
x_1 = zeros(1,101);
x_1(1) = 1;
t_2 = zeros(1,1001);
x_2 = zeros(1,1001);
x_2(1) = 1;
t_3 = zeros(1,10001);
x_3 = zeros(1,10001);
x_3(1) = 1;
error_1 = zeros(0, 101);
error_2 = zeros(0, 1001);
error_3 = zeros(0, 10001);

for i = 1:100
    x_1(i+1) = (x_1(i)+t_1(i))*(h_1) + x_1(i);
    t_1(i+1) = t_1(i) + h_1;
    error_1(i+1) = abs(x_1(i+1) - y(100*i+1)) / y(100*i+1);
end

for i = 1:1000
    x_2(i+1) = (x_2(i)+t_2(i))*(h_2) + x_2(i);
    t_2(i+1) = t_2(i) + h_2;
    error_2(i+1) = abs(x_2(i+1) - y(10*i+1)) / y(10*i+1);
end

for i = 1:10000
    x_3(i+1) = (x_3(i)+t_3(i))*(h_3) + x_3(i);
    t_3(i+1) = t_3(i) + h_3;
    error_3(i+1) = abs(x_3(i+1) - y(i+1)) / y(i+1);
end

plot(t,y,'r',t_1,x_1,'b',t_2,x_2,'g',t_3,x_3,'y')
legend('Exact','h = 0.1','h = 0.01','h = 0.001')
xlabel('t')
ylabel('x')
title('Euler Method')

plot(t_1, error_1, 'b', t_2, error_2, 'g', t_3, error_3, 'r')
legend('h = 0.1','h = 0.01','h = 0.001')
ylabel('Error')
xlabel('t')
title('Error')
