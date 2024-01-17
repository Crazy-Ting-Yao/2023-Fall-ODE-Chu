%%
f = @(t) (t.*(0 <= t & t < pi)) + ((t+2*pi).*(-2*pi <= t & t < -pi));
t = linspace(-4, 4, 1000);
N = 6;
a0 = (1/(2*pi)) * integral(@(t) f(t), -pi, pi);
partialSums = a0;

for n = 1:N
    errors = zeros(size(t));
    
    a_n = (1/pi) * integral(@(t) f(t) .* cos(n*t), -pi, pi);
    b_n = (1/pi) * integral(@(t) f(t) .* sin(n*t), -pi, pi);
    partialSums = partialSums + a_n * cos(n*t) + b_n * sin(n*t);
    figure;
    errors = errors + f(t) - partialSums;
    plot(t, partialSums, 'LineWidth', 2);
    hold on;
    plot(t, f(t), 'LineWidth', 2, 'LineStyle', '--');
    title('Fourier Series Approximation');
    xlabel('t');
    ylabel('f(t)');
    legend(sprintf('n = %d', n), 'Original Function');
    figure;
    plot(t, errors, 'LineWidth', 2);
    title('Error in Fourier Series Approximation');
    xlabel('t');
    ylabel('Error');
    legend(sprintf('n = %d', n));
end
%%
A = [2 3; 2 1];
[X, Y] = meshgrid(-1:0.1:1, -1:0.1:1);
U = A(1,1) * X + A(1,2) * Y;
V = A(2,1) * X + A(2,2) * Y;

figure;
quiver(X, Y, U, V);
xlabel('X');
ylabel('Y');
title('Phase Portrait');
axis tight;
grid on;

A = [-10 6; 15 -19];
[X, Y] = meshgrid(-1:0.1:1, -1:0.1:1);
U = A(1,1) * X + A(1,2) * Y;
V = A(2,1) * X + A(2,2) * Y;

figure;
quiver(X, Y, U, V);
xlabel('X');
ylabel('Y');
title('Phase Portrait');
axis tight;
grid on;

A = [3 -18; 2 -9];
[X, Y] = meshgrid(-1:0.1:1, -1:0.1:1);
U = A(1,1) * X + A(1,2) * Y;
V = A(2,1) * X + A(2,2) * Y;

figure;
quiver(X, Y, U, V);
xlabel('X');
ylabel('Y');
title('Phase Portrait');
axis tight;
grid on;
