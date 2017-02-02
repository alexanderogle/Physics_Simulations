
%% Problem 3.4
clear all

%initial conditions 
q = 0;
F_d = 0;
w_d = 0.1;
m = 1; %mass of pendulum
l = [0.2,0.4,0.6,0.8,0.9,1]; %length of the wire
color = ['y','m','c','r','g','b']; %color spectrum
g = 9.8; %force of gravity
k = 1;
E(1) = 0; 
K(1) = 0; 
P(1) = 0; 
w(1) = 0; %initial angular velocity 
dt = 0.001;
ft = 5;
t = [0:dt:ft+dt]; %initial element in time array
theta(1) = pi/2; %initial angle of pendulum 
for j = 1:length(l)
    
x(1) = l(j)*sin(theta(1));

for i = 1:length(t)
    %calculating the motion of the pendulum itself
    w(i+1) = w(i)-((g/l(j))*(sin(theta(i)))-q*w(i)+F_d*sin(w_d*t(i)))*dt;
    theta(i+1) = theta(i) + w(i+1)*dt;
    t(i+1) = t(i) + dt;
    x(i+1) = l(j)*sin(theta(i+1));
    
    %calculating energy for over the entire loop
    %K(i+1) = (1/2)*m*(l^2)*(w(i)^2)*dt;
    %P(i+1) = m*g*l*(theta(i)^2)*dt;
    %E(i+1) = K(i+1) + P(i+1);
end

c = color(j);
plot(t,x,c); 
hold on
end

min_ax = min(x)-1;
max_ax = max(x)+1;
axis([0, t(end), min_ax, max_ax]);
legend('L = 0.2','L = 0.4','L = 0.6','L = 0.8','L = 0.9','L = 1');
title('SHO with Damping, a = 1, k = 1')
xlabel('Time (s)')
ylabel('X Position')