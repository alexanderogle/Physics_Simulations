
clear all;

%planet stuff
%k ->mass ratio: (planet mass)/(earth mass)
k = 316.67;

clear fig;

B = 2;
x(1) = 5.2;
y(1) = 0;
v_x(1) = 0;
v_y(1) = 6*pi;
dt = 0.001;
ft = 100*pi;
t = [0:dt:ft+dt];
r(1) = sqrt(x(1)^2 + y(1)^2);
A(1) = 0;
theta(1) = 0;
less_05 = false;
more_05 = false;
count = false;
cycles = 0;

%details about the planets
%the mass of the sun given in terms of 1 = 1*10^23
Ms = 1.989*10^7;
Mp = 4.9*10^1;

for i = 1:length(t)
    r(i) = sqrt(x(i)^2 + y(i)^2);
    v_x(i+1) = v_x(i) - (((k*4*pi^2)*x(i))/((r(i)^B)*r(i)))*dt;
    v_y(i+1) = v_y(i) - (((k*4*pi^2)*y(i))/((r(i)^B)*r(i)))*dt;
    x(i+1) = x(i) + v_x(i+1)*dt;
    y(i+1) = y(i) + v_y(i+1)*dt;
    
    r_t = r(i);
    theta(i) = acos(x(i)/r(i));
    
    
    if(theta(i) < 0.5)
       less_05 = true;
       more_05 = false;
    end
    if(theta(i) > 0.5)
        more_05 = true;
        less_05 = false;
        count = false;
    end
    
    if(~count && less_05)
       cycles = cycles + 1; 
       count = true;
    end
    %finding the area of the triangles created by each dt using Heron's
    %formula
    r(i) = sqrt(x(i)^2 + y(i)^2);
    r(i+1) = sqrt(x(i+1)^2 + y(i+1)^2);
    a = r(i);
    b = r(i+1);
    c = sqrt((x(i+1)-x(i))^2 + (y(i+1)-y(i))^2);
    p = (r(i)+r(i+1)+c)/2;
    A(i) = sqrt(p*(p-a)*(p-b)*(p-c));
    
end

ave_A = mean(A);

for i=1:length(A)
   total_diff = (ave_A-A(i))^2;
   variance_A = total_diff/length(A);
   std_dev_A = sqrt(variance_A);
end

%Calculate the T^2/a^3 ratio;
T = ft/cycles;
a = (1/2)*(min(r)+max(r));
K_3 = T^2/a^3;

n = 8;
m = n;

%scatter(x, y, 0.5);
hold on;

x = 0;
y = 0;
%plot(x,y,'ro');
title('Orbital Motion, Keplers Third Law, Vyi = 2.4pi, dt = 0.008, Venus');
axis([-n,m,-n,m]);
xlabel('X (AU)');
ylabel('Y (AU)');
%to add text into the graph
txt1 = -n+0.5;
txt2 = -m+0.5;
T_constant = num2str(K_3);
T_graph = strcat('(T^2)/(a^3) = ',T_constant);
%text(txt1,txt2,T_graph);
disp(std_dev_A);
disp(cycles);
disp(K_3);

