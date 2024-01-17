%%
clear
ro = 3.2;
u = zeros(4,100);
u(1,1) = 0.2;
u(2,1) = 0.4;
u(3,1) = 0.6;
u(4,1) = 0.8;
t = 1:100;
for i = 1:4
    for j = 2:100
        u(i,j) = ro*u(i,j-1)*(1-u(i,j-1));
    end
end

plot(t,u(1,:),'r',t,u(2,:),'g',t,u(3,:),'b',t,u(4,:),'k')
xlabel('t')
ylabel('u')
legend('u_0 = 0.2','u_0 = 0.4','u_0 = 0.6','u_0 = 0.8')
title('Logistic Map')

%%
clear
ros = [2.6,2.8,3.4];
for k = 1:3
    ro = ros(k);
    u = zeros(4,100);
    u(1,1) = 0.2;
    u(2,1) = 0.4;
    u(3,1) = 0.6;
    u(4,1) = 0.8;
    t = 1:100;
    for i = 1:4
        for j = 2:100
            u(i,j) = ro*u(i,j-1)*(1-u(i,j-1));
        end
    end

    plot(t,u(1,:),'r',t,u(2,:),'g',t,u(3,:),'b',t,u(4,:),'k')
    xlabel('t')
    ylabel('u')
    legend('u_0 = 0.2','u_0 = 0.4','u_0 = 0.6','u_0 = 0.8')
    title(strcat('Logistic Map for rho = ',num2str(ro)))
    
end