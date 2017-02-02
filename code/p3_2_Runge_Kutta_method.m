%% Problem 3.1: Investigating the Euler-Cromer Method for SHO
clear all

%initial conditions 
m = 1; %mass of pendulum
l = 0.5; %length of the wire
g = 9.8; %force of gravity
E_e(1) = 0; 
E_r(1) = 0;
K_e(1) = 0;
P_e(1) = 0; 
w(1) = 0; %initial angular velocity 
dt = 0.1;
ft = 100;
t = [0:dt:ft+dt]; %initial element in time array
theta(1) = pi/2; %initial angle of pendulum 
theta_r(1) = pi/2;

for i = 1:length(t)
    %calculating the motion of the pendulum itself
    w(i+1) = w(i)-(g/l)*theta(i)*dt;
    theta(i+1) = theta(i) + w(i)*dt;
    t(i+1) = t(i) + dt;
    
    %calculating energy for over the entire loop
    K_e(i+1) = (1/2)*m*(l^2)*(w(i)^2)*dt;
    P_e(i+1) = m*g*l*(theta(i)^2)*dt;
    E_e(i+1) = K_e(i+1) + P_e(i+1);
    E_e(i+2) = E_e(i+1);
end

%plot(t, theta, 'r');
hold on;

for i = 1:length(t)
    %calculating the motion of the pendulum itself
    theta_p = theta_r(i) + (1/2)*w(i)*dt;
    w_p = w(i) - (1/2)*theta_r(i)*dt;
    theta_r(i+1) = theta_r(i) + w_p*dt;
    w(i+1) = w(i) - theta_p*dt;
    t(i+1) = t(i) + dt;
    
    %calculating energy for over the entire loop
    %K(i+1) = (1/2)*m*(l^2)*(w(i)^2)*dt;
    %P(i+1) = m*g*l*(theta(i)^2)*dt;
    E_r(i+1) = (1/2)*(w(i)^2 + theta(i)^2);
    
end

%plot(t, theta_r, 'b'); 
hold on;
plot(t, E_r,'g');
hold on
plot(t, E_e, 'y');
axis([0, 10, -10, 10]);
title('Oscillatory Motion of SHO, Runge-Kutta')
xlabel('Time (s)')
ylabel('Theta (displacement in radians)')
legend('Euler-Cromer','Runge-Kutta','Energy of Runge-Kutta','Energy of Euler-Cromer');
