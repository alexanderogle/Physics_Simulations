%% Problem 3.1: Investigating the Euler-Cromer Method for SHO
clear all

%initial conditions 
m = 1; %mass of pendulum
l = 0.5; %length of the wire
g = 9.8; %force of gravity
E(1) = 0; 
K(1) = 0; 
P(1) = 0; 
w(1) = 0; %initial angular velocity 
dt = 0.1;
ft = 10;
t = [0:dt:ft+dt]; %initial element in time array
theta(1) = pi/2; %initial angle of pendulum 

for i = 1:length(t)
    %calculating the motion of the pendulum itself
    w(i+1) = w(i)-(g/l)*theta(i)*dt;
    theta(i+1) = theta(i) + w(i+1)*dt;
    t(i+1) = t(i) + dt;
    
    %calculating energy for over the entire loop
    K(i+1) = (1/2)*m*(l^2)*(w(i)^2)*dt;
    P(i+1) = m*g*l*(theta(i)^2)*dt;
    E(i+1) = K(i+1) + P(i+1);
    
end

plot(t, theta); 
hold on;
plot(t, E,'r');
title('Oscillatory Motion of Simple Harmonic Oscillator')
xlabel('Time (s)')
ylabel('Theta (displacement in radians)')
plot(t, P, 'g');
plot(t, K, 'y');
legend('Pendulum','Total Energy','Potential Energy','Kinetic Energy');
