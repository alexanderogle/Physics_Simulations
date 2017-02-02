
clear all;

x(1) = 1;
y(1) = 0;
v_x(1) = 0;
v_y(1) = 2.2*pi;
dt = 0.001;
ft = 5*pi;
t = [0:dt:ft+dt];

for i = 1:length(t)+dt
    r = sqrt(x(i)^2 + y(i)^2);
    v_x(i+1) = v_x(i) - (((4*pi^2)*x(i))/r^3)*dt;
    v_y(i+1) = v_y(i) - (((4*pi^2)*y(i))/r^3)*dt;
    x(i+1) = x(i) + v_x(i+1)*dt;
    y(i+1) = y(i) + v_y(i+1)*dt;
    scatter(x(i), y(i), 0.5);
    hold on;
end

title('Earth Orbiting the Sun, V_yi = 2.2*pi');
axis([-2,2,-2,2]);
xlabel('X (AU)');
ylabel('Y (AU)');
