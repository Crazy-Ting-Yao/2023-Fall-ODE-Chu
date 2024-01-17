clear
f = @(t) (t>=-1 & t<=-1/2).*(cos(3*pi*(t+1) + 1/4*pi)+1i*sin(3*pi*(t+1) + 1/4*pi)) + ...
         (t>=-1/2 & t<=0).*(cos(7/4*pi)+1i*sin(7/4*pi)).*(1/2-t) + ...
         (t>=0 & t<=1/2).*(cos(-3*pi*t+7/4*pi)+1i*sin(-3*pi*t+7/4*pi))/2 + ...
         (t>=1/2 & t<=1).*(cos(1/4*pi)+1i*sin(1/4*pi)).*t;
t = linspace(-1, 1, 100);
N = 10;
a0div2 = integral(@(t) f(t), -1, 1) / 2;
partialSums = a0div2;
numFrames = 100;  % Number of frames in the animation
pauseTime = 0.01;  % Time delay between frames in seconds
for n = 1:N
    figure;
    title("Animated 2-D Plot", strcat("N = ", num2str(n)));
    xlabel('X-axis');
    ylabel('Y-axis');
    a_n = integral(@(t) f(t) .* cos(n*pi*t), -1, 1);
    b_n = integral(@(t) f(t) .* sin(n*pi*t), -1, 1);
    partialSums = partialSums + a_n * cos(n*pi*t) + b_n * sin(n*pi*t);
    for frame = 1:numFrames
        x(frame) = real(partialSums(frame));
        y(frame) = imag(partialSums(frame));
        plot(x,y,'r');
        axis([-1.2, 1.2, -1.2, 1.2]);
        % Pause for a short duration to create animation effect
        pause(pauseTime);
    end
    clear x y;
end

%%
delta = 0.00001;
F = @(t,y) y^2 - y^3;
opts = odeset('RelTol',1.e-4);
ode45(F,[0 2/delta],delta,opts);
figure;
delta = 0.00001;
ode23s(F,[0 2/delta],delta,opts);


