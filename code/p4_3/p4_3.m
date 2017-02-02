
clear all;

x(1) = 1;
y(1) = 0;
v_x(1) = 0;
v_y(1) = 3*pi;
dt = 0.01;
ft = 10*pi;
t = [0:dt:ft+dt];
r(1) = sqrt(x(1)^2 + y(1)^2);
A(1) = 0;

for i = 1:length(t)
    r = sqrt(x(i)^2 + y(i)^2);
    v_x(i+1) = v_x(i) - (((4*pi^2)*x(i))/r^3)*dt;
    v_y(i+1) = v_y(i) - (((4*pi^2)*y(i))/r^3)*dt;
    x(i+1) = x(i) + v_x(i+1)*dt;
    y(i+1) = y(i) + v_y(i+1)*dt;
    
    %finding the area of the triangles created by each dt using Heron's
    %formula
    r(i) = sqrt(x(i)^2 + y(i)^2);
    r(i+1) = sqrt(x(i+1)^2 + y(i+1)^2);
    a = r(i);
    b = r(i+1);
    c = sqrt((x(i+1)-x(i))^2 + (y(i+1)-y(i))^2);
    p = (r(i)+r(i+1)+c)/2;
    A(i) = sqrt(p*(p-a)*(p-b)*(p-c));
    
    scatter(x(i), y(i), 0.5);
    hold on;
end

ave_A = mean(A);

for i=1:length(A)
   total_diff = (ave_A-A(i))^2;
   variance_A = total_diff/length(A);
   std_dev_A = sqrt(variance_A);
end

n = 6;
m = n;

x = 0;
y = 0;
plot(x,y,'ro');
title('Orbital Motion, Keplers Second Law, Vyi = 3pi, dt = 0.01');
axis([-n,m,-n,m]);
xlabel('X (AU)');
ylabel('Y (AU)');
disp(std_dev_A);

